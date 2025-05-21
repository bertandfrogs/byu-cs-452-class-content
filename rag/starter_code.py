import pandas as pd
from sentence_transformers import SentenceTransformer, util
import openai
import tiktoken
import json
import os
import torch

fdir = os.path.dirname(__file__)
def getPath(fname):
    return os.path.join(fdir, fname)

# Initialize OpenAI client
configPath = getPath("config.json")
with open(configPath) as configFile:
    config = json.load(configFile)

client = openai.OpenAI(api_key=config["openaiKey"])

def truncate_text(text, max_tokens, encoding_name="cl100k_base"):
    """Truncate text to fit within max_tokens using tiktoken."""
    encoding = tiktoken.get_encoding(encoding_name)
    tokens = encoding.encode(text)
    if len(tokens) > max_tokens:
        tokens = tokens[:max_tokens]
        text = encoding.decode(tokens)
    return text

def generate_chatgpt_response(search_term, talks, model="gpt-3.5-turbo", max_context_tokens=3000):
    """
    Generate a ChatGPT response based on the search term and provided talks.
    Ensure that the response uses only the talk content, with no external sources.
    """
    try:
      # get the talk content into a string
      talk_content = []
      for index, talk in talks.iterrows():
          talk_content.append(truncate_text(talk['talk'], max_context_tokens))

      talks_string = '\n'.join(talk_content)
      
      # format prompt
      content = f"Only using the provided Latter-day Saint General Conference talks and no other material, summarize an answer to the search term: {search_term}. The provided talks are: {talks_string}"

      stream = client.chat.completions.create(
        model=model,
        messages=[{"role": "user", "content": content}],
        stream=True,
      )

      responseList = []
      for chunk in stream:
          if chunk.choices[0].delta.content is not None:
              responseList.append(chunk.choices[0].delta.content)

      result = "".join(responseList)
      return result
    
    except Exception as e:
        print(f"Error generating ChatGPT response: {e}")
        return "Unable to generate response due to an error."

def find_similar_talks(search_term, top_k=3):
    """
    Finds the top_k most similar conference talks to a given search term based on embeddings
    and generates a ChatGPT response based on those talks.
    """
    try:
        # Load the CSV
        input_path = getPath("cleaned_conference_talks.csv")
        df = pd.read_csv(input_path)

        # Initialize the sentence transformer model
        model = SentenceTransformer('all-mpnet-base-v2')
        search_embedding = model.encode(search_term)

        """
        Pseudo code:
        Generate the search embedding from the search term using the model.
        For each row in the dataframe, you should extract the talk embedding and convert it
        from a string to a list (use eval()). Next, use the util.cos_sim() function
        to calculate the cosine similarity between the search embedding and the talk
        embedding. Save each similarity value for use the next step
        """

        similarity = []
        for line in df["embeddings"]:
          embedding = eval(line)
          similarity.append(util.cos_sim(search_embedding, embedding)[0].item())

        df["similarity"] = similarity
        

        # Find the top_k most similar talks and store them in a list.
        sorted_df = df.sort_values(by="similarity", ascending=False)
        top_talks = sorted_df.head(top_k)

        # Generate ChatGPT response
        chatgpt_response = generate_chatgpt_response(search_term, top_talks)

        return top_talks, chatgpt_response

    except FileNotFoundError:
        print("Error: 'cleaned_conference_talks.csv' not found.")
        return [], ""
    except Exception as e:
        print(f"An error occurred: {e}")
        return [], ""

# Example usage
search_term = "How to succeed in school and career"
similar_talks, chatgpt_response = find_similar_talks(search_term)
print(f"## Query: {search_term}")
if not similar_talks.empty:
    print(f"### Top 3 most similar talks:")
    for index, talk in similar_talks.iterrows():
        print(
            f". Title: {talk['title']}, "
            f"Speaker: {talk['speaker']}, "
            f"Year: {talk['year']}, "
            f"Similarity: {talk['similarity']:.4f}, "
            f"Text Snippet: {talk['talk'][:200]}..."
        )
    print("\n ### ChatGPT Response:")
    print(chatgpt_response)
else:
    print("No similar talks found.")