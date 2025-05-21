# MongoDB

## 1. Find the movies titled "Gladiator".

- Query: 

  ```
  list(movies.find(
    {'title': 'Gladiator'},
    {'_id': 0, 'title': 1, 'year': 1}
  ))
  ```

- Results:
  ```
  [{'title': 'Gladiator', 'year': 2000}]
  ```

## 2. List the distinct genre values of movies.

- Query: 

  ```
  movies.distinct('genre')
  ```

- Results:
  ```
  ['Action',
  'Comédie',
  'Fantastique',
  'Guerre',
  'Horreur',
  'Science-fiction',
  'Suspense',
  'Thriller',
  'Western',
  'crime',
  'drama',
  'romance']
  ```

## 3. List just the titles of movies of "crime" or "drama" genre.

- Query: 

  ```
  list(movies.find(
    {"$or": [
      {"genre": "crime"},
      {"genre": "drama"}  
    ]},
    {"_id": 0, "title": 1, "genre": 1}
  ))
  ```

- Results:
  ```
  [{'title': 'Vertigo', 'genre': 'drama'},
  {'title': 'Titanic', 'genre': 'drama'},
  {'title': 'Sacrifice', 'genre': 'drama'},
  {'title': 'Gladiator', 'genre': 'drama'},
  {'title': 'Van Gogh', 'genre': 'drama'},
  {'title': 'Seven', 'genre': 'crime'},
  {'title': 'Le last_name de la rose', 'genre': 'crime'},
  {'title': 'Le silence des agneaux', 'genre': 'crime'},
  {'title': 'Les pleins pouvoirs', 'genre': 'crime'},
  {'title': 'Rain Man', 'genre': 'drama'},
  {'title': 'Reservoir dogs', 'genre': 'crime'},
  {'title': 'Le grand bleu', 'genre': 'drama'},
  {'title': 'King of New York', 'genre': 'drama'},
  {'title': 'De bruit et de fureur', 'genre': 'drama'},
  {'title': 'Bad Lieutenant', 'genre': 'drama'},
  {'title': 'Le parrain', 'genre': 'drama'},
  {'title': 'Le parrain II', 'genre': 'drama'},
  {'title': 'Le parrain III', 'genre': 'drama'},
  {'title': 'Jackie Brown', 'genre': 'crime'},
  {'title': 'Kill Bill', 'genre': 'drama'},
  {'title': 'Stalingrad', 'genre': 'drama'},
  {'title': 'Million Dollar Baby', 'genre': 'drama'},
  {'title': 'Marie Antoinette', 'genre': 'drama'},
  {'title': 'Heat', 'genre': 'crime'},
  {'title': 'Taxi driver', 'genre': 'drama'},
  ...
  {'title': 'Fargo', 'genre': 'crime'},
  {'title': 'Les quatre cents coups', 'genre': 'drama'},
  {'title': 'Le dernier métro', 'genre': 'drama'},
  {'title': 'Un prophète', 'genre': 'drama'},
  {'title': 'Nous trois ou rien', 'genre': 'drama'}]
  ```

## 4. Find the list of movies directed by "Hitchcock", display only title and year and sort them by year (asc).

- Query: 

  ```
  list(movies.find(
    {"director.last_name": "Hitchcock"},
    {"_id": 0, "title": 1, "year": 1}
  ).sort({"year": 1}))
  ```

- Results:
  ```
  [{'title': 'Fenêtre sur cour', 'year': 1954},
  {'title': 'Vertigo', 'year': 1958},
  {'title': 'La mort aux trousses', 'year': 1959},
  {'title': 'Psychose', 'year': 1960},
  {'title': 'Les oiseaux', 'year': 1963},
  {'title': 'Pas de printemps pour Marnie', 'year': 1964}]
  ```

## 5. List the movie titles where "Cotillard" played.

- Query: 

  ```
  list(movies.find(
    {"actors.last_name": "Cotillard"},
    {"_id": 0, "title": 1, "year": 1}
  ))
  ```

- Results:
  ```
  [{'title': 'Inception', 'year': 2010},
  {'title': 'The Dark Knight Rises', 'year': 2012}]
  ```

## 6. List the movie titles released between 1967 and 1995 (inclusive).

- Query: 

  ```
  list(
    movies.find(
      {
        "$and": [
          {"year": {"$gte": 1967}},
          {"year": {"$lte": 1995}}
        ]
      },
      {"_id": 0, "title": 1, "year": 1}
    )
  )
  ```

- Results:
  ```
  [{'title': 'Alien', 'year': 1979},
  {'title': 'Sacrifice', 'year': 1986},
  {'title': 'Impitoyable', 'year': 1992},
  {'title': 'Blade Runner', 'year': 1982},
  {'title': 'Piège de cristal', 'year': 1988},
  {'title': '58 minutes pour vivre', 'year': 1990},
  {'title': 'Van Gogh', 'year': 1990},
  {'title': 'Seven', 'year': 1995},
  {'title': 'Twelve Monkeys', 'year': 1995},
  {'title': 'Le last_name de la rose', 'year': 1986},
  {'title': 'Pulp fiction', 'year': 1994},
  {'title': 'Terminator', 'year': 1984},
  {'title': 'Les dents de la mer', 'year': 1975},
  {'title': 'Le silence des agneaux', 'year': 1990},
  {'title': 'Kagemusha', 'year': 1980},
  {'title': 'Le gendarme et les extra-terrestres', 'year': 1978},
  {'title': 'Rain Man', 'year': 1988},
  {'title': 'Top Gun', 'year': 1986},
  {'title': 'Les bronzés font du ski', 'year': 1979},
  {'title': 'Le retour du Jedi', 'year': 1983},
  {'title': 'Reservoir dogs', 'year': 1992},
  {'title': 'Shining', 'year': 1980},
  {'title': 'Léon', 'year': 1994},
  {'title': 'Nikita', 'year': 1990},
  {'title': 'Le grand bleu', 'year': 1988},
  ...
  {'title': 'Heat', 'year': 1995},
  {'title': 'Taxi driver', 'year': 1976},
  {'title': 'Les affranchis', 'year': 1990},
  {'title': 'Casino', 'year': 1995},
  {'title': 'Le dernier métro', 'year': 1980}]
  ```

## 7. List the the movies released between 1967 and 1995 (inclusive), by displaying only title, year, director’s last name sorted by year

- Query: 

  ```
  list(
    movies.find(
      {
        "$and": [
          {"year": {"$gte": 1967}},
          {"year": {"$lte": 1995}}
        ]
      },
      {"_id": 0, "title": 1, "year": 1, "director.last_name": 1}
    ).sort({"year": 1})
  )
  ```

- Results:
  ```
  [{'title': 'Le parrain', 'year': 1972, 'director': {'last_name': 'Coppola'}},
  {'title': 'Soleil vert',
    'year': 1973,
    'director': {'last_name': 'Fleischer'}},
  {'title': 'Le parrain II',
    'year': 1974,
    'director': {'last_name': 'Coppola'}},
  {'title': 'Les dents de la mer',
    'year': 1975,
    'director': {'last_name': 'Spielberg'}},
  {'title': 'Taxi driver', 'year': 1976, 'director': {'last_name': 'Scorcese'}},
  {'title': 'Le gendarme et les extra-terrestres',
    'year': 1978,
    'director': {'last_name': 'Girault'}},
  {'title': 'Alien', 'year': 1979, 'director': {'last_name': 'Scott'}},
  {'title': 'Les bronzés font du ski',
    'year': 1979,
    'director': {'last_name': 'Leconte'}},
  {'title': 'Le dernier métro',
    'year': 1980,
    'director': {'last_name': 'Truffaut'}},
  {'title': 'Shining', 'year': 1980, 'director': {'last_name': 'Kubrick'}},
  {'title': 'Kagemusha', 'year': 1980, 'director': {'last_name': 'Kurozawa'}},
  {'title': 'Blade Runner', 'year': 1982, 'director': {'last_name': 'Scott'}},
  {'title': 'Le retour du Jedi',
  ...
  {'title': 'Heat', 'year': 1995, 'director': {'last_name': 'Mann'}},
  {'title': 'Twelve Monkeys',
    'year': 1995,
    'director': {'last_name': 'Gilliam'}},
  {'title': 'Casino', 'year': 1995, 'director': {'last_name': 'Scorcese'}}]
  ```
