#import sys to read and write via STDIN and STDOUT
import sys

# read entire stdin line inputed
for line in sys.stdin:
    # remove the leading and trailing whitespaces
    line = line.strip()
    # split the line into words
    words = line.split()

    # loop through the array printing out the word and a count 
    # of one every time
    for word in words:
        wd = '%s\t%s' % (word,1)
        print(wd)