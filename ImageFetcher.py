import urllib
from PIL import Image
import os

class_name = 'Apple'

f = open(class_name + '.txt', 'r')

i = 0
for line in f:
    file_path = 'data/' + class_name + '/' + str(i) + '.jpg'
    print('Fetching {0}'.format(file_path))

    try:
        urllib.urlretrieve(line, file_path)
        im = Image.open(file_path)
        im.load()
        i += 1
    except Exception as e:
        print('Error fetching')
        if os.path.isfile(file_path):
            print('Removing {0}'.format(file_path))
            os.remove(file_path)
