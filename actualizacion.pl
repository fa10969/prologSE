save(ToFile):-
	telling(Old),
	tell(ToFile),
	/*Enumera todas las clausula del predicado enfe entre 2 */
	listing(tiene/2),

	/*Cierra el archivo*/
	told,
	tell(Old).
enferma2:-
       consult('enf.dbs'),
       fail.
enferma2:-
	asserta(si(end)),
	asserta(no(end)),
	write('¿DESEA INTRODUCIR UNA ENFERMEDAD? Responda <s/n>:  '),nl,nl,
	write('     Resp:'),
	read(A),
	A=s,
	/*CUANDO YA NO SE DESEAN SEGUIR INGRESANDO ENFERMEDADES, ES FALSO
	Y TERMINA DE INTRODUCIR*/
	not(introducir),

	/* Se guarda el archivo despu�s de que se agrega */
	save('enf.dbs'),!,nl,
	write('DIALOGO DE DIAGNOSTICO'),nl,nl.
introducir:-
	write('Que enfermedad es? <<minusculas>>'),nl,nl,
	write('     Resp:'),
	read(Object),
	Object\="fin",
	write('     ENFERMEDAD < '),
	write(Object),
	write(" >"),nl,nl,

	/*SE DEFINE LA ENFERMEDAD EN OBJECT Y UNA LISTA [] PARA ALMACENAR LOS SINTOMAS*/
	atributos(Object,[]),
	write('¿DESEA INGRESAR OTRA ENFERMEDAD? <s/n>'),nl,nl,!,
	write('Resp:'),
	read(Q),Q=s,
	introducir.


	/*PREDICADO QUE PREGUNTA LOS S�NTOMAS DE UNA NUEVA ENFERMEDAD AGREGADA Y LOS
AGREGA A LA LISTA (NO HAY CAMBIOS) */
atributos(O,List):-
	write('INGRESE SINTOMA <<Para terminar ingrese fin>>:'),nl,
	write('Resp:'),
	read(Attribute),
	Attribute\=fin,
	anadir(Attribute, List, List2),
	atributos(O,List2).



/* Se agregan la enfermedad y los sntomas
a la Base de Conocimiento. (asserta manipula datos en la base de datos
Y SI HAY CAMBIOS PORQUE YA NO SE
ENCUENTRA writelist(List,1),!,nl) el cual sigue despues de
asserta */
atributos(O,List):-
	asserta(tiene(O,List)).
	% Se une la lista de sntomas



/*PREDICADO A�ADIR*/
anadir(X,L,[X|L]).

