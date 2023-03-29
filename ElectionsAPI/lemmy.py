import sys
import spacy

nlp = spacy.load('fr_core_news_md')
test = " "
n = len(sys.argv)
for i in range(1, n):
    test += sys.argv[i] + " "
resultat = " "
doc = nlp(test)
for token in doc:
    resultat += token.lemma_ + " "
print (resultat)



