# popl-project

## About

This project implements a rudementary parser for Python using the Antlr parser. This can take in a python file and turn it into a stream of tokens (which are currently unused), or fail if the syntax is invalid.

## Group Members

Eli Bollinger \
Joseph Kelley

## Setup instructions

Antlr v4 [https://www.antlr.org/] needs to be installed on the system and added to whatever folder is used for 3rd party java libraries (C:\Program Files\Java\libs)

To install the python packages needed, run the following command
```
python3 -m pip install requirements.txt
```

## How to run & use 

To generate the parser files, you must run:
```
java org.antlr.v4.Tool -Dlanguage=Python3 .\base.g4
```
and to run the prorgam, you must run
```
python3 Driver.py -f FILENAME
```
The python will print if the provided file passes or fails based on the grammer in base.g4. Any modification to base.g4 needs to have the parser files regenerated with the above command.

## Video Demo

[https://youtu.be/2K8otkjdXe4]