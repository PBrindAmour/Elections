import math
import string
import sys
import os
from sys import argv
from sklearn.feature_extraction.text import TfidfVectorizer
from nltk.corpus import stopwords
os.chdir('/Users/philb/OneDrive/Projet Final/Repository/Elections/')
from spacy.lang.fr.stop_words import STOP_WORDS as fr_stop






# reading the text file
# This functio will return a 
# list of the lines of text 
# in the file.
n = len(sys.argv)
with open('0.txt', 'r', encoding="utf8") as f:
    texte1 = f.read()
with open('1.txt', 'r', encoding="utf8") as f:
    texte2 = f.read()
with open('2.txt', 'r', encoding="utf8") as f:
    texte3 = f.read()
with open('3.txt', 'r', encoding="utf8") as f:
    texte4 = f.read()
with open('4.txt', 'r', encoding="utf8") as f:
    texte5 = f.read()

corpus = [texte1, texte2, texte3, texte4, texte5]

vectorizer = TfidfVectorizer(stop_words=fr_stop, use_idf=False, sublinear_tf= True, smooth_idf=False, norm='l2')
document_term_matrix = vectorizer.fit_transform(corpus)
print(vectorizer.get_feature_names_out())
pairwise_similarity = document_term_matrix * document_term_matrix.transpose()
print(pairwise_similarity.toarray())