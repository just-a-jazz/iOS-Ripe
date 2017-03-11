import urllib
from PIL import Image
import os
import glob

for file in glob.glob("*.txt"):

    class_name = os.path.splitext(file)[0]

    directory = 'data/' + class_name + '/'

    if not os.path.exists(directory):
        os.makedirs(directory)

    f = open(class_name + '.txt', 'r')

    i = 0
    for line in f:
        file_path = directory + str(i) + '.jpg'
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
