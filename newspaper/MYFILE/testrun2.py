import argparse
import sys
from newspaper import Article

parser = argparse.ArgumentParser()
parser.add_argument('core', type=int)
args = parser.parse_args()

url1 = 'http://www.bbc.co.uk/zhongwen/simp/chinese_news/2012/12/121210_hongkong_politics.shtml'
url2 = 'http://www.koreatimes.com/article/20180304/1164956'


a = Article(url1, language='zh') # Chinese
a.download()
b = Article(url1, language='ko')
b.download()

#1, 4, 16, 64, 256
#1 thread (2048, 512, 128, 32, 8)
#2 threads (1024, 256, 64, 16, 4)
#4 threads (512, 128, 32, 8, 2)
#8 threads (256, 64, 16, 4, 1)

for x in range (0, args.core):
    a.parse()
    b.parse()