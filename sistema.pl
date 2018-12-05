
/*PREDICADO PARA IMPRIMIR EL MENU PRINCIPAL (AQUi HAY UN CAMBIO
DEBIDO A LA OPCION a)*/
menu:-
    write('SISTEMA DE DIAGNOSTICO DE ENFERMEDADES RESPIRATORIAS'),nl,nl,nl,
	write('     MENU PRINCIPAL'),nl,nl,nl,
	write('a. CREAR EL ARCHIVO.'),nl,nl,
	write('b. ACTUALIZAR BASE DE CONOCIMIENTO.'),nl,nl,
	write('c. INICIAR INFERENCIA.'),nl,nl,
	write('d. SALIR.'),nl,nl,nl,
	write('Presiona <a. b. c. O d>.'),
	read(Resp),
	opcion(Resp).



/* PREDICADO PARA VALIDAR LAS OPCIONES (HAY UN CAMBIO DEBIDO A LA OPCI�N a)*/
opcion(Resp):-
        Resp='a',tell('enf.dbs'),
        told, write('El archivo enf.dbs, se definio'),nl,nl,nl,menu.
opcion(Resp):- Resp='b', actualizacion, menu.
opcion(Resp):- Resp='c', inferencia, menu.
opcion(Resp):- Resp='d', despedida.
opcion(Resp):- Resp\='a', Resp\='b',Resp\='c',Resp\='d', menu.



/*PREDICADO DESPEDIDA (TERMINA EL PROGRAMA NO HAY CAMIBIOS)*/
despedida:-
	write('    BYE.....'), nl,nl,nl,
	write('Presiona cualquier tecla, seguida de punto: '),
	read(_).



actualizacion:-
consult('actualizacion.pl'),fail.
actualizacion:-enferma2.

 inferencia:- consult('Inferencia.pl'),fail.
 inferencia:-enferma3.



















