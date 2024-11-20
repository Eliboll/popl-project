grammar base;

start: block EOF ;

block: (line? NL)* line EOF;

line: ifstatement 
        | assignment 
        | statement
        | while
        | for
;

statement:	statement OPS statement
		| statement COMPOPS statement 
		| '(' statement ')'
		| type
		| not
		| function_call
;

not: 'not' statement ;

assignment:	VAR ASSIGNOP statement ;

nested_lines: (INDENT line? NL)* INDENT line (INDENT? NL)*;

ifstatement: 'if ' statement ':' NL nested_lines (NL'elif 'statement':' NL nested_lines)* (NL 'else:' NL nested_lines)?;

while: 'while ' statement ':' NL nested_lines ;

for: 'for ' statement ' in ' statement ':' NL nested_lines ;

list: 	'[' (type ',')* type? ']' ;

paramaters: (statement ',')* statement? ;

function_call: VAR '(' paramaters ')' ;

BOOL: 'True' | 'False';

INDENT: '    '+ | '\t'+;

INT: '-'?[0-9]+;

FLOAT: '-'?[0-9]+ '.' [0-9]*;

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

NL: ('\r')?'\n' ;

VAR:	[a-zA-Z_][a-zA-Z0-9_]* ;

//LINECOMMENT: '#' ~[NL]* -> skip ;

WS: [\r\t ]+ -> skip;