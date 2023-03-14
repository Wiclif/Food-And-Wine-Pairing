# Food and Wine Pairing
Unpacking and Matching the Characteristics of Food and Wine using Natural Language Processing

Pairing wine with food is somewhat of a dark art. What ultimately makes for great pairings is a delicate balance between the body, non-aroma and aroma characteristics in the wine and in the food. 
In this project, we will use data science techniques and the prevailing theory on wine/food pairing to build a wine pairing engine.

## Extracting Food Characteristics
Before we can even think about a pairing, we need to pick apart the attributes of our hotdog. How can we quantify the non-aroma and aroma characteristics of our dish so that we can match it up with wines along these same dimensions?

Our first step here is to train a Word2Vec model to generate a 300-dimensional word embedding for a wide range of different food-related terms. Provided that we can find a sufficiently expansive and descriptive corpus of text to train this model on, we would expect these embeddings to capture variation in the characteristics of our food.
After training this model, we can calculate an embedding for our hotdog. We will do this by breaking it down into its individual component pieces: hotdog, tomato, onion, pickle, relish, celery salt, sport peppers and mustard. We will assume that the fully loaded hot dog is the average of the word embeddings of these component ingredients.

To quantify the non-aroma attributes, we will use the trained Word2Vec model to define an embedding for the non-aromas (body, sweet, acid, salt, piquant, fat and bitter). Then, we will calculate the cosine distance between that non-aroma embedding and a range of example foods, as in the example above for saltiness. This distance is normalized between 0 and 1 using a MinMax Scaler, with the minimum distance being the food that is closest to the salt embedding (bacon), and the maximum distance being the food that is farthest from the salt embedding (raspberry)
