Instructions
============

1) First start up ipython notebook via ipython notebook --ip:0.0.0.0 --no-browser

2)Run 'New HW 2.ipynb'

3)Back to the unix prompt: Initiate R (verison 3.0.0 or higher if possible) within the directory in terminal that all the files are stored in
execute command: source("hw2.R")

4) "At this point the data has been curated and the next step should be followed"

5) For the Analysis, there is a seperate R file 

what the code does
==================
The first portion of the code is the iPython notebook. This grabs the data from the google spreadsheet
then exacts two columns and prints them on to two seperate txt files which can then be read into R. The majority
is identical to the example.py file, the only difference is the part that writes txt files.

With R, the data is reorganized by means of Regular expressions and data manipulation. This data was also incorporated
in the Analysis R file
