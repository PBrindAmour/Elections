import spacy
nlp = spacy.load('fr_core_news_md')
doc = nlp(document)
resultat = " "
for token in doc:
     resultat = resultat + " " + token.lemma_
print(resultat)