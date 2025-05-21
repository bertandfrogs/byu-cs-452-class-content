## Q1 - What are the five most similar segments to segment "267:476"
### Input: "that if we were to meet alien life at some point"
### For each result return the podcast name, the segment id, segment raw text,  the start time, stop time, and embedding distance

- Query:
```sql
WITH topfive AS (
  SELECT *, embedding <-> (SELECT embedding from segment where id = '267:476') as distance FROM segment
  WHERE segment.id != '267:476'
  ORDER BY embedding <-> (SELECT embedding from segment where id = '267:476')
  LIMIT 5
)
SELECT podcast.title, topfive.id, content, start_time, end_time, topfive.distance
FROM topfive
JOIN podcast ON topfive.podcast_id = podcast.id
ORDER BY distance;
```
- Response: 
```
('Podcast: Ryan Graves: UFOs, Fighter Jets, and Aliens | Lex Fridman Podcast #308', '113:2792', ' encounters, human beings, if we were to meet another alien', 6725.62, 6729.86, 0.6483450674336982)
('Podcast: Richard Dawkins: Evolution, Intelligence, Simulation, and Memes | Lex Fridman Podcast #87', '268:1019', ' Suppose we did meet an alien from outer space', 2900.04, 2903.0800000000004, 0.6558106859320757)
('Podcast: Jeffrey Shainline: Neuromorphic Computing and Optoelectronic Intelligence | Lex Fridman Podcast #225', '305:3600', ' but if we think of alien civilizations out there', 9479.960000000001, 9484.04, 0.6595433115268592)
('Podcast: Michio Kaku: Future of Humans, Aliens, Space Travel & Physics | Lex Fridman Podcast #45', '18:464', ' So I think when we meet alien life from outer space,', 1316.8600000000001, 1319.5800000000002, 0.6662026419636159)
('Podcast: Alien Debate: Sara Walker and Lee Cronin | Lex Fridman Podcast #279', '71:989', ' because if aliens come to us', 2342.34, 2343.6200000000003, 0.6742942635162208)
```

## Q2 - What are the five most dissimilar segments to segment "267:476"
### Input: "that if we were to meet alien life at some point"
### For each result return the podcast name, the segment id, segment raw text,  the start time, stop time, and embedding distance

- Query:
```sql
WITH bottomfive AS (
  SELECT *, embedding <-> (SELECT embedding from segment where id = '267:476') as distance FROM segment
  WHERE segment.id != '267:476'
  ORDER BY embedding <-> (SELECT embedding from segment where id = '267:476') DESC
  LIMIT 5
)
SELECT podcast.title, bottomfive.id, content, start_time, end_time, distance
FROM bottomfive
JOIN podcast ON bottomfive.podcast_id = podcast.id
ORDER BY distance DESC;
```
- Response: 
```
('Podcast: Jason Calacanis: Startups, Angel Investing, Capitalism, and Friendship | Lex Fridman Podcast #161', '119:218', ' a 73 Mustang Grande in gold?', 519.96, 523.8000000000001, 1.6157687685840119)
('Podcast: Rana el Kaliouby: Emotion AI, Social Robots, and Self-Driving Cars | Lex Fridman Podcast #322', '133:2006', ' for 94 car models.', 5818.62, 5820.82, 1.5863359073014982)
('Podcast: Travis Stevens: Judo, Olympics, and Mental Toughness | Lex Fridman Podcast #223', '283:1488', ' when I called down to get the sauna.', 3709.34, 3711.1000000000004, 1.572552805197421)
('Podcast: Jeremy Howard: fast.ai Deep Learning Courses and Research | Lex Fridman Podcast #35', '241:1436', ' which has all the courses pre-installed.', 4068.9, 4071.1400000000003, 1.5663319710412156)
('Podcast: Joscha Bach: Nature of Reality, Dreams, and Consciousness | Lex Fridman Podcast #212', '307:3933', ' and very few are first class and some are budget.', 10648.64, 10650.960000000001, 1.5616341289820461)
```

## Q3 - What are the five most similar segments to segment '48:511'

### Input: "Is it is there something especially interesting and profound to you in terms of our current deep learning neural network, artificial neural network approaches and the whatever we do understand about the biological neural network."
### For each result return the podcast name, the segment id, segment raw text,  the start time, stop time, and embedding distance
- Query:
```sql
WITH topfive AS (
  SELECT *, embedding <-> (SELECT embedding from segment where id = '48:511') as distance FROM segment
  WHERE segment.id != '48:511'
  ORDER BY embedding <-> (SELECT embedding from segment where id = '48:511')
  LIMIT 5
)
SELECT podcast.title, topfive.id, content, start_time, end_time, distance
FROM topfive
JOIN podcast ON topfive.podcast_id = podcast.id
ORDER BY distance;
```
- Response: 
```
('Podcast: Andrew Huberman: Neuroscience of Optimal Performance | Lex Fridman Podcast #139', '155:648', ' Is there something interesting to you or fundamental to you about the circuitry of the brain', 3798.48, 3805.84, 0.652299685331962)
('Podcast: Cal Newport: Deep Work, Focus, Productivity, Email, and Social Media | Lex Fridman Podcast #166', '61:3707', ' of what we might discover about neural networks?', 8498.02, 8500.1, 0.7121050124628524)
('Podcast: Matt Botvinick: Neuroscience, Psychology, and AI at DeepMind | Lex Fridman Podcast #106', '48:512', " And our brain is there. There's some there's quite a few differences. Are some of them to you either interesting or perhaps profound in terms of in terms of the gap we might want to try to close in trying to create a human level intelligence.", 1846.84, 1865.84, 0.7195603322334674)
('Podcast: Yann LeCun: Dark Matter of Intelligence and Self-Supervised Learning | Lex Fridman Podcast #258', '276:2642', ' Have these, I mean, small pockets of beautiful complexity. Does that, do cellular automata, do these kinds of emergence and complex systems give you some intuition or guide your understanding of machine learning systems and neural networks and so on?', 8628.16, 8646.16, 0.7357217735737499)
('Podcast: Stephen Wolfram: Fundamental Theory of Physics, Life, and the Universe | Lex Fridman Podcast #124', '2:152', ' So is there something like that with physics where so deep learning neural networks have been around for a long time?', 610.86, 618.86, 0.7366969553372291)
```

## Q4 - What are the five most similar segments to segment '51:56'

### Input: "But what about like the fundamental physics of dark energy? Is there any understanding of what the heck it is?"
### For each result return the podcast name, the segment id, segment raw text,  the start time, stop time, and embedding distance
- Query:
```sql
WITH topfive AS (
  SELECT *, embedding <-> (SELECT embedding from segment where id = '51:56') as distance FROM segment
  WHERE segment.id != '51:56'
  ORDER BY embedding <-> (SELECT embedding from segment where id = '51:56')
  LIMIT 5
)
SELECT podcast.title, topfive.id, content, start_time, end_time, distance
FROM topfive
JOIN podcast ON topfive.podcast_id = podcast.id
ORDER BY distance;
```
- Response: 
```
('Podcast: George Hotz: Hacking the Simulation & Learning to Drive with Neural Nets | Lex Fridman Podcast #132', '308:144', " I mean, we don't understand dark energy, right?", 500.44, 502.6, 0.6681965222094363)
('Podcast: Lex Fridman: Ask Me Anything - AMA January 2021 | Lex Fridman Podcast', '243:273', " Like, what's up with this dark matter and dark energy stuff?", 946.22, 950.12, 0.7355511762966292)
('Podcast: Katherine de Kleer: Planets, Moons, Asteroids & Life in Our Solar System | Lex Fridman Podcast #184', '196:685', ' being like, what the hell is dark matter and dark energy?', 2591.72, 2595.9599999999996, 0.7631141596843518)
('Podcast: Alex Filippenko: Supernovae, Dark Energy, Aliens & the Expanding Universe | Lex Fridman Podcast #137', '51:36', ' Do we have any understanding of what the heck that thing is?', 216.0, 219.0, 0.7922019445543276)
('Podcast: Leonard Susskind: Quantum Mechanics, String Theory and Black Holes | Lex Fridman Podcast #41', '122:831', ' That is a big question in physics right now.', 2374.9, 2377.6200000000003, 0.8022704628640559)
```

## Q5 - For each of the following podcast segments, find the five most similar podcast episodes. Hint: You can do this by averaging over the embedding vectors within a podcast episode.

### Segment "267:476"
- Query:
```sql
WITH podEp AS (
  SELECT podcast_id from segment
  WHERE segment.id = '267:476'
),
podEmbed AS (
  SELECT AVG(embedding) as avg_embed FROM segment
  WHERE podcast_id = (SELECT podcast_id from podEp)
  GROUP BY podcast_id
),
topfive AS (
  SELECT AVG(embedding) as avg_embed, podcast_id, AVG(embedding) <-> (SELECT podEmbed.avg_embed from podEmbed) as distance FROM segment
  WHERE podcast_id NOT IN (SELECT podcast_id from podEp)
  GROUP BY podcast_id
  ORDER BY AVG(embedding) <-> (SELECT podEmbed.avg_embed from podEmbed)
  LIMIT 5
)
SELECT podcast.title, topfive.podcast_id, distance
FROM topfive
JOIN podcast ON topfive.podcast_id = podcast.id
ORDER BY distance;
```
- Response: 
```
('Podcast: Demis Hassabis: DeepMind - AI, Superintelligence & the Future of Humanity | Lex Fridman Podcast #299', 'Gfr50f6ZBvo', 0.11301193616129587)
('Podcast: Oriol Vinyals: DeepMind AlphaStar, StarCraft, and Language | Lex Fridman Podcast #20', 'Kedt2or9xlo', 0.11327739413045972)
('Podcast: Ilya Sutskever: Deep Learning | Lex Fridman Podcast #94', '13CZPWmke6A', 0.12476937431692706)
('Podcast: Greg Brockman: OpenAI and AGI | Lex Fridman Podcast #17', 'bIrEM2FbOLU', 0.13182197779463417)
('Podcast: Gary Marcus: Toward a Hybrid of Deep Learning and Symbolic AI | Lex Fridman Podcast #43', 'vNOTDn3D_RI', 0.13208838417321903)
```

## Q6 - For each of the following podcast segments, find the five most similar podcast episodes. Hint: You can do this by averaging over the embedding vectors within a podcast episode.

### Segment '48:511'
- Query:
```sql
WITH podEp AS (
  SELECT podcast_id from segment
  WHERE segment.id = '48:511'
),
podEmbed AS (
  SELECT AVG(embedding) as avg_embed FROM segment
  WHERE podcast_id = (SELECT podcast_id from podEp)
  GROUP BY podcast_id
),
topfive AS (
  SELECT AVG(embedding) as avg_embed, podcast_id, AVG(embedding) <-> (SELECT podEmbed.avg_embed from podEmbed) as distance FROM segment
  WHERE podcast_id NOT IN (SELECT podcast_id from podEp)
  GROUP BY podcast_id
  ORDER BY AVG(embedding) <-> (SELECT podEmbed.avg_embed from podEmbed)
  LIMIT 5
)
SELECT podcast.title, topfive.podcast_id, distance
FROM topfive
JOIN podcast ON topfive.podcast_id = podcast.id
ORDER BY distance;
```
- Response: 
```
('Podcast: Tomaso Poggio: Brains, Minds, and Machines | Lex Fridman Podcast #13', 'aSyZvBrPAyk', 0.12102781315668082)
('Podcast: Jay McClelland: Neural Networks and the Emergence of Cognition | Lex Fridman Podcast #222', 'Ui38ZzTymDY', 0.12674422316158854)
('Podcast: Dileep George: Brain-Inspired AI | Lex Fridman Podcast #115', 'tg_m_LxxRwM', 0.15083697578956798)
('Podcast: Wojciech Zaremba: OpenAI Codex, GPT-3, Robotics, and the Future of AI | Lex Fridman Podcast #215', 'U5OD8MjYnOM', 0.15314839072533984)
('Podcast: Melanie Mitchell: Concepts, Analogies, Common Sense & Future of AI | Lex Fridman Podcast #61', 'ImKkaeUx1MU', 0.15440845076894336)
```

## Q7 - For each of the following podcast segments, find the five most similar podcast episodes. Hint: You can do this by averaging over the embedding vectors within a podcast episode.

### Segment '51:56'
- Query:
```sql
WITH podEp AS (
  SELECT podcast_id from segment
  WHERE segment.id = '51:56'
),
podEmbed AS (
  SELECT AVG(embedding) as avg_embed FROM segment
  WHERE podcast_id = (SELECT podcast_id from podEp)
  GROUP BY podcast_id
),
topfive AS (
  SELECT AVG(embedding) as avg_embed, podcast_id, AVG(embedding) <-> (SELECT podEmbed.avg_embed from podEmbed) as distance FROM segment
  WHERE podcast_id NOT IN (SELECT podcast_id from podEp)
  GROUP BY podcast_id
  ORDER BY AVG(embedding) <-> (SELECT podEmbed.avg_embed from podEmbed)
  LIMIT 5
)
SELECT podcast.title, topfive.podcast_id, distance
FROM topfive
JOIN podcast ON topfive.podcast_id = podcast.id
ORDER BY distance;
```
- Response: 
```
('Podcast: Avi Loeb: Aliens, Black Holes, and the Mystery of the Oumuamua | Lex Fridman Podcast #154', 'plcc6E-E1uU', 0.11366666801560775)
('Podcast: Martin Rees: Black Holes, Alien Life, Dark Matter, and the Big Bang | Lex Fridman Podcast #305', '50r-5ULcWgY', 0.1764280077049357)
('Podcast: Garry Nolan: UFOs and Aliens | Lex Fridman Podcast #262', 'uTCc2-1tbBQ', 0.1889772829993557)
('Podcast: Chris Mason: Space Travel, Colonization, and Long-Term Survival in Space | Lex Fridman Podcast #283', '1C2tPFCGL1U', 0.190206553482873)
('Podcast: Jim Gates: Supersymmetry, String Theory and Proving Einstein Right | Lex Fridman Podcast #60', 'IUHkhB366tE', 0.19369683536091986)
```