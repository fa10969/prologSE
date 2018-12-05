enferma3:-
       consult('enf.dbs'),
       fail.
%EVALUA LA ENFERMEDAD DEFINIDA POR EL USUARIO Y POSTERIORMENTE PURGA
%(SI HAY CAMBIOS PORQUE
%SE AGREGA write('¿QUE ENFERMEDAD SUPONES? <<minusculas>>'),nl,nl,)
 enferma3:-

	write('  DIALOGO DE DIAGNOSTICO'),nl,nl,
	write('< Responde <<s/n>> >'),nl,nl,
	write('¿QUE ENFERMEDAD SUPONES? <<minusculas>>'),nl,nl,
	write('Resp:'),
	read(O),
	preguntar(O),
	purgar.



/* En el fail del predicado procesar,
 no se puede seguir infiriendo (NO HAY CAMBIOS)*/
 enferma3:-
	write('NO SE ENCUENTRA EN LA BASE DE CONOCIMIENTOS'),nl,nl,
	write('Escribe cualquier caracter, seguido de punto. '),
	read(_),
	purgar.







/*PREDICADO A�ADIR*/
anadir(X,L,[X|L]).

/* PREDICADO PARA PREGUNTAR LOS SINTOMAS DE LA ENFERMEDAD CONSULTADA (SI HAY CAMBIOS) */
preguntar(O):-
	asserta(si(end)),
	asserta(no(end)),
	tiene(O,A),
	/*not(miembro(O,L)), (AQUI HAY CAMBIOS PORQUE ESTO SE COMENTA)*/
	anadir(O,_L,_L2),
	anterioressi(A),
	anterioresno(A),
	intentar(O,A), !, nl, nl, write(O), nl, nl,
	write('Tiene los sintomas presentados'),nl,nl.
/*TAMBIeN HAY CAMBIOS AQUI, PORQUE INMEDIANTAMENTE SE
DEBERIA DE BUSCAR OTRA ENFERMEDAD MEDIANTE LOS
SIGUIENTE PREDICADOS.
write("     BUSCANDO OTRA ENFERMEDAD..."),
readchar(_),
preguntar(L2).
*/



/*PREDICADOS QUE OBTIENEN LOS SINTOMAS DE LA ENFERMEDAD CONSULTADA*/
anterioressi(A):-si(T),!,xanterioressi(T,A,[]),!.

/*NO CAMBIA*/
xanterioressi(end,_,_):-!.

/*NO HAY CAMBIOS*/
xanterioressi(T,A,L):-
	miembro(T,A),!,
	anadir(T,L,L2),
	si(X), not(miembro(X,L2)),!,
	xanterioressi(X,A,L2).

/*NO HAY CAMBIOS*/
anterioresno(A):-
	no(T), !,
	xanterioresno(T,A,[]),!.

/*NO HAY CAMBIOS*/
xanterioresno(end,_,_):-!.

/*NO HAY CAMBIOS*/
xanterioresno(T,A,L):-
	miembro(T,A),!,
	anadir(T,L,L2),
	no(X), not(miembro(X,L2)),!,
	xanterioresno(X,A,L2).


/* PREDICADOS PARA LEER LOS SINTOMAS DE LA ENFERMEDAD CONSULTADA */
/*CAMBIA DE 0 A _0 Y DEBERIA IR DESPUES DEL PREDICADO SIGUIENTE intentar*/
intentar(_O,[]).

/*HAY CAMBIOS PORQUE FALTA EL PREDICADO
(O,[X|T]):-
si (X), !,
intentar(O,T).
*/

/*NO HAY CAMBIOS*/
intentar(O,[X|T]):-
	write('¿TIENES ESTE SINTOMA? '),
	write(X),nl,
	write(':  '),
	write('RESPONDE <s/n>'),
	read(Q),
	procesar(O,X,Q),!,
	intentar(O,T).



% Si un sntoma est� presente se agrega al inicio de la Base de
% Conocimiento, en caso contrariose termina con fail y se concluye con
% no inferir ms.
/*NO HAY CAMBIOS*/
procesar(_,X,s):-
	asserta(si(X)),!.



/*NO HAY CAMBIOS*/
procesar(_,X,n):-
	asserta(no(X)), !, fail.

%SI HAY CAMBIOS PORQUE FALTA
%procesar(O,X,why):-
%	write("CREO QUE PUEDE SER "),nl,
%write(O,"POR QUE TIENE: "),nl,
%si (Z), xwrite(Z),nl,
%Z=end,!,
%write(" SINTOMA: ",X," ?"),
%readln(Q),
%procesar (O,X,Q),!.



/*NO HAY CAMBIOS*/
xwrite(end).




/*NO HAY CAMBIOS*/
xwrite(Z):-write(Z).


% retract se encarga de eliminar todos los t�rminos temporales de la BC
/*NO HAY CAMBIOS*/
purgar:-
	retract(si(X)),
	X=end, fail.



/*NO HAY CAMBIOS*/
purgar:-
	retract(no(X)),
	X=end.

/*HAY CAMBIOS PORQUE FALTA
    juntar([],List,List).

    juntar([X|L1],List2,[X|L3]):-
        juntar(L1,List2,L3).

    writelist([],_).
    writelist([Head|Tail],3):-
        write(Head),nl,writelist(Tail,1).

    writelist([Head|Tail],I):-
        N=I+1,
        Write(Head,"  "),write(Tail,N).
*/

% DETERMINA SI UN ELEMENTO PERTENECE A UNA LISTA.
/*NO HAY CAMBIOS*/
miembro(N,[N|_]).

/*NO HAY CAMBIOS*/
miembro(N,[_|T]):- miembro(N,T).







