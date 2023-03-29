import textstat
import sys
import spacy

text = ""
n= len(sys.argv)
for i in range(1,n):
    text += sys.argv[i] + " "
textstat.set_lang('fr')
resultat = textstat.flesch_reading_ease(text)
resultatdeux = textstat.flesch_kincaid_grade(text)
resultattrois = textstat.dale_chall_readability_score(text)

print(resultat)
print(resultatdeux)
print(resultattrois)
