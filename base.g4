grammar sample;

start: block EOF ;

block: assignment | statement ;

statement:	statement OPS statement
		| statement COMPOPS statement 
		| type
;

assignment:	VAR ASSIGNOP statement ;

VAR:	[a-zA-Z_][a-zA-Z0-9_]* ;

list: 	'[' (type ',')* type? ']' ;

//LIST: '[' ([0-9] ',')* ']' ;

BOOL: 'True' | 'False';

INT: [0-9]+;


FLOAT: [0-9]+ '.' [0-9]*;

STRING: '"' [a-zA-Z0-9]+ '"' | '\'' [a-zA-Z0-9]+ '\'';

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
		| 'not'
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

WS: [ ]+ -> skip;