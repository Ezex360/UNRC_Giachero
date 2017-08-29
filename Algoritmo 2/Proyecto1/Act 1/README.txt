El Metodo principal se llama "mein" y recibe una cota superior de estados, una lista de caracteres(alfabeto),
una lista de cadenas que el automata deberia reconocer y una lista de cadenas que el automata no deberia reconocer.
La funcion devuelve una cadena donde se muestra el Automata encontrado, o un mensaje donde se afirma que no 
se pudo encontrar el automata que cumpla con esas caracteristicas.

Ejemplos de uso
$ mein 20 ['a','b','c'] ["aaaa","aba","ca"] ["bb","ccc","bcb"]
"Automata ((0,[((0,'a'),0),((0,'b'),1),((0,'c'),1),((1,'a'),0),((1,'c'),0),((1,'b'),1)]),[0])"
$ mein 1 ['a','b'] ["a"] ["b"]
"No se encontro un automata con esas caracteristicas"
$ mein 10 ['a','b'] ["aaa","a","","aaaaa"] ["aab","bb","baaa"]
"Automata ((0,[((0,'a'),0),((0,'b'),1),((1,'a'),1),((1,'b'),1)]),[0])"
$ mein 10 ['a','b'] ["ab","abab","aba"] ["bba","aab","a","b"]
"Automata ((0,[((0,'b'),0),((0,'a'),1),((1,'a'),0),((1,'b'),2),((2,'a'),2),((2,'b'),2)]),[2])"


