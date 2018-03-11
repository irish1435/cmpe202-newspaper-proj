import argparse
import sys
from timeit import default_timer as timer
from newspaper import Article


url1 = 'http://www.bbc.co.uk/zhongwen/simp/chinese_news/2012/12/121210_hongkong_politics.shtml'

for x in range (0, 100):
	url1 = 'http://www.bbc.co.uk/zhongwen/simp/chinese_news/2012/12/121210_hongkong_politics.shtml'
	t1 = timer()
	a = Article(url1, language='zh') # Chinese
	a.download()
	a.parse()
	a.html
	#print(a.html)
	a.authors
	#print(a.authors)
	a.publish_date
	#print(a.publish_date)
	a.text
	#print(a.text)
	a.nlp()
	a.keywords
	#print(a.keywords)
	a.summary
	#print(a.summary)

	t2 = timer()
	tf = t2-t1
	print(tf)