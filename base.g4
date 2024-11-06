comparison:	statement SPACE COMPOPS SPACE statement 
;

statement:	statement SPACE OPS SPACE statement SPACE
		| comparison
		| TYPE
;

assignment:	VAR SPACE ASSIGNOP SPACE statement ;

VAR:	[a-zA-Z_][a-zA-Z0-9_]* ;

LIST: 	'[' (TYPE ',')* ']' ;

BOOL: 'True' | 'False';

INT: [0-9]+;

SPACE: ' '?;

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