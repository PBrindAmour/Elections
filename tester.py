import os
import sys
import pandas as pd
import ast
import numpy as np
from PIL import Image
from spacy.lang.fr.stop_words import STOP_WORDS as fr_stop
from wordcloud import WordCloud 
from matplotlib import pyplot as plt
os.chdir('/Users/philb/OneDrive/Projet Final/Repository/Elections/')
with open('wordcloud.txt', 'r', encoding="utf8") as f:
    dictionnaire= f.read()
dictionnaire = eval(dictionnaire)
mask=np.array(Image.open('imagecaq.jpg'))
df=pd.DataFrame(data=dictionnaire)
Cloud = WordCloud(width = 4000, height = 1250, background_color="white",color_func=lambda *args, **kwargs: (0, 0, 102), max_words=30).generate_from_frequencies(df.T.sum(axis=1))
plt.imshow(Cloud, interpolation="bilinear")
plt.axis("off")
plt.show()