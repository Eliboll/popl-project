grammar base;

start: block EOF ;

block: (line? '\n')* line EOF;

line: ifstatement | assignment | statement;

statement:	statement OPS statement
		| statement COMPOPS statement 
		| '(' statement ')'
		| type
		| not
;

not: 'not' statement ;

assignment:	VAR ASSIGNOP statement ;

nested_lines: (INDENT line? '\n')* INDENT line;

ifstatement: 'if ' statement ':\r\n' nested_lines ('\nelif 'statement':\r\n' nested_lines)* ('\nelse:\r\n' nested_lines)?;

list: 	'[' (type ',')* type? ']' ;

//LIST: '[' ([0-9] ',')* ']' ;

BOOL: 'True' | 'False';

INDENT: '    ' | '\t';

INT: [0-9]+;

FLOAT: [0-9]+ '.' [0-9]*;

STRING: '"' [a-zA-Z0-9 ]* '"' | '\'' [a-zA-Z0-9 ]* '\'';

type: INT
	| FLOAT
	| STRING
	| BOOL
	| VAR
	| list
;

COMPOPS:	'<'
		| '<='
		| '>'
		| '>='
		| '=='
		| '!='
		| 'and'
		| 'or'
;

OPS:	'+'
	| '-'
	| '*'
	| '/'
	| '%'
;

ASSIGNOP:	'='
		| '+='
		| '-=' 
		| '*='
		| '/='
;

VAR:	[a-zA-Z_][a-zA-Z0-9_]* ;

WS: [\r ]+ -> skip;