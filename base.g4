comparison:	statement COMPOPS statement 
;

statement:	statement OPS statement
		| comparison
		| TYPE
;

assignment:	VAR ASSIGNOP statement ;

VAR:	[a-zA-Z_][a-zA-Z0-9_]* ;

LIST: 	'[' (TYPE ',')* ']' ;

BOOL: 'True' | 'False';

INT: [0-9]+;

FLOAT: [0-9]+ '.' [0-9]*;

STRING: '"' [a-zA-Z0-9]+ '"' | ''' [a-zA-Z0-9]+ ''';

TYPE:	INT
	| FLOAT
	| STRING
	| BOOL
	| VAR
	| LIST
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