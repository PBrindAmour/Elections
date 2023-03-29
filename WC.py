import sys

n = len(sys.argv)
df = pd.DataFrame(n, columns=n)

wordcloud = WordCloud(width = 800, height = 800,

                background_color ='white',

                max_words=50,

                min_font_size = 10).generate_from_frequencies(df.T.sum(axis=1))
 
# plot the WordCloud image                       

plt.figure(figsize = (8, 8), facecolor = None)
plt.imshow(wordcloud)

plt.axis("off")

plt.tight_layout(pad = 0)
 
plt.show()