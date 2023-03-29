import math
import string
import sys
import os
import tokenize
from sys import argv
from sklearn.feature_extraction.text import TfidfVectorizer
from nltk.corpus import stopwords
os.chdir('/Users/philb/OneDrive/Projet Final/Repository/Elections/')
from spacy.lang.fr.stop_words import STOP_WORDS as fr_stop




n = 30 # nombre de résultat voulu

# reading the text file
# This functio will return a 
# list of the lines of text 
# in the file.
n = len(sys.argv)
with open('0.txt', 'r', encoding="utf8") as f:
    texte1 = f.read().replace('\n', '')
with open('1.txt', 'r', encoding="utf8") as f:
    texte2 = f.read().replace('\n', '')
with open('2.txt', 'r', encoding="utf8") as f:
    texte3 = f.read().replace('\n', '')
with open('3.txt', 'r', encoding="utf8") as f:
    texte4 = f.read().replace('\n', '')
with open('4.txt', 'r', encoding="utf8") as f:
    texte5 = f.read().replace('\n', '')

corpus = [texte1, texte2, texte3, texte4, texte5]

vectorizer = TfidfVectorizer(stop_words=fr_stop)
document_term_matrix = vectorizer.fit_transform(corpus)
feature_names = document_term_matrix.get_feature_names()

for col in document_term_matrix.nonzero()[1]:
	print(feature_names[col], ' - ', document_term_matrix.nonzero[0, col])

for col in document_term_matrix.nonzero()[1]:
	feature_names = vectorizer.get_feature_names()
feature_array = np.array(vectorizer.get_feature_names())
tfidf_sorting = np.argsort(document_term_matrix.toarray()).flatten()[::-1]
top_n = feature_array[tfidf_sorting][:n]
for result in top_n:
	for rez in result:
		tokens[i] = tokens[i].lower()

     comment_words += " ".join(tokens)+" "

wordcloud = WordCloud(width = 800, height = 800,

                background_color ='white',

                stopwords = stopwords,

                min_font_size = 10).generate(comment_words)