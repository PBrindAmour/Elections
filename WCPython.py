import pandas as pd
import os
from spacy.lang.fr.stop_words import STOP_WORDS as fr_stop
from wordcloud import WordCloud 
from matplotlib import pyplot as plt
from sklearn.feature_extraction.text import TfidfVectorizer
os.chdir('/Users/philb/OneDrive/Projet Final/Repository/Elections/')


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

vectorizer = TfidfVectorizer(stop_words=fr_stop, use_idf=True, sublinear_tf= False, smooth_idf=False, norm='l2')
vecs = vectorizer.fit_transform(corpus)
feature_names = vectorizer.get_feature_names_out()
dense = vecs.todense()
lst1 = dense.tolist()
df = pd.DataFrame(lst1, columns=feature_names)


iterator = 0
while iterator < len(df[[]]):
		parti = df.iloc[[iterator]]
		Cloud = WordCloud(background_color="white", max_words=40).generate_from_frequencies(parti.T.sum(axis=1))
		plt.imshow(Cloud)
		plt.show()
		iterator = iterator + 1
