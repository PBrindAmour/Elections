import math
import string
import sys
import os 
from sklearn.feature_extraction.text import TfidfVectorizer
from spacy.lang.fr.stop_words import STOP_WORDS as fr_stop

tfv = TfidfVectorizer(min_df=3,  max_features=None,
    strip_accents='unicode', analyzer='word',token_pattern=r'\w{1,}',
    ngram_range=(1,2), use_idf=1,smooth_idf=1,sublinear_tf=1,
    stop_words = fr_stop)

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
X_all = [texte1, texte2, texte3, texte4, texte5]

X_all = tfv.transform(X_all)

print (X_all)