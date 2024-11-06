import sys
from io import StringIO
from antlr4 import *
from baseLexer import baseLexer
from baseParser import baseParser
from antlr4.tree.Trees import Trees

filepath = f"project_deliverable_1.py"

def main():
	# code = "strg = 'test'"
	# s = InputStream(code)
	# OR you can use a FileStream
	s = FileStream(filepath)

	lexer = baseLexer(s)
	stream = CommonTokenStream(lexer)
	parser = baseParser(stream)
	
	
	if parser.getNumberOfSyntaxErrors() > 0:
		print("failed")
	else:
		print("passed")

main()

