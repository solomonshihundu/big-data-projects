#!/usr/bin/env python

from operator import itemgetter
import sys

current_word = None
current_count = 0
word = None

# read the entire line from STDIN
for line in sys.stdin:
    # remove leading and trailing whitespace
    line = line.strip()
    #split the data based on the tab introduced in mapper
    word,count = line.split('\t',1)
    #parse the count into an integer
    try:
        count = int(count)
    except ValueError:
        #count wasn't a number thus ignore
        continue

    # if the current word being accessed is similar to a previously
    # accessed word, increase its count by one
    if current_word == word:
        current_count += count
    else:
        # if the word is being accessed the very first time,
        # then check if the word being accessed is not null nor none
        # print the word and its count
        if current_word:
            #write result on output
            cw = '%s\t%s' % (current_word,current_count)
            print(cw)
        current_count=count
        current_word=word

if current_word == word:
    cw = '%s\t%s' % (current_word,current_count)
    print(cw) 
    