import sys
from io import StringIO
from antlr4 import *
from baseLexer import baseLexer
from baseParser import baseParser
from antlr4.tree.Trees import Trees

filepath = f"project_deliverable_2.py"

def main():
	# code = "test = 10"
	# code = '10'
	# s = InputStream(code)
	# OR you can use a FileStream
	s = FileStream(filepath)

	lexer = baseLexer(s)
	stream = CommonTokenStream(lexer)
	parser = baseParser(stream)
	tree = parser.start()
	
	if parser.getNumberOfSyntaxErrors() > 0:
		print("failed")
	else:
		print("passed")

main()

