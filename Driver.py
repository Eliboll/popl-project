import sys
from io import StringIO
from antlr4 import *
from baseLexer import baseLexer
from baseParser import baseParser
from antlr4.tree.Trees import Trees
import argparse


def main():
	parser = argparse.ArgumentParser(description="Process a filename provided as an argument.")

	# Add the -f argument
	parser.add_argument('-f', '--file', required=True, help="Filename to process")

	# Parse the arguments
	args = parser.parse_args()

	# Access the filename
	filename = args.file

	s = FileStream(filename)

	lexer = baseLexer(s)
	stream = CommonTokenStream(lexer)
	parser = baseParser(stream)
	tree = parser.start()

	if parser.getNumberOfSyntaxErrors() > 0:
		print("failed")
	else:
		print("passed")

main()

