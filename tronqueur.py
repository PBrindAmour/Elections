import os
import spacy

os.chdir('/Users/philb/OneDrive/Projet Final/Repository/Elections/')
nlp = spacy.load('fr_core_news_md')
with open('texteatronquer.txt', 'r', encoding="utf8") as f:
    texte1 = f.read()
obj = nlp(texte1)
lemmat = [x.lemma_ for x in obj]
resultat = " "
for token in lemmat:
    resultat += token + " "
print (resultat)



