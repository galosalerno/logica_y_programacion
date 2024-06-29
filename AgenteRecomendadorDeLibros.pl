libro('l1', 'm1', 'Python', 'Moreles_Javier').
libro('l2', 'm1', 'Python2', 'Moreles_Javier').
libro('l3', 'm2', 'Java', 'Perez_Luisa').
libro('l4', 'm2', 'Java2', 'Perez_Luisa').
libro('l5', 'm3', 'C++', 'Gomez_Carlos').
libro('l6', 'm3', 'C++2', 'Gomez_Carlos').
libro('l7', 'm1', 'Python3', 'Moreles_Javier').
libro('l8', 'm1', 'Python4', 'Moreles_Javier').

estudiante('est1', 'Juan', 'Perez').
estudiante('est2', 'Maria', 'Lopez').
estudiante('est3', 'Carlos', 'Martinez').
estudiante('est4', 'Luisa', 'Garcia').
estudiante('est5', 'Ana', 'Gonzalez').
estudiante('est6', 'Jose', 'Rodriguez').
estudiante('est7', 'Elena', 'Hernandez').
estudiante('est8', 'Miguel', 'Fernandez').
estudiante('est9', 'Laura', 'Gomez').
estudiante('est10', 'David', 'Sanchez').

leido('est1', 'l1').
leido('est2', 'l2').
leido('est3', 'l3').
leido('est4', 'l4').
leido('est5', 'l5').
leido('est6', 'l6').
leido('est7', 'l1').
leido('est8', 'l3').
leido('est9', 'l5').
leido('est10', 'l2').

% Continuaciones
es_continuacion('l2', 'l1'). %Python y Python2
es_continuacion('l7', 'l2'). %Python2 y Python3
es_continuacion('l8', 'l7'). %Python3 y Python4
es_continuacion('l4', 'l3'). %Java y Java2
es_continuacion('l6', 'l5'). %C++ y C++2

nivel('l1', 'Inicial').
nivel('l2', 'Intermedio').
nivel('l3', 'Inicial').
nivel('l4', 'Intermedio').
nivel('l5', 'Intermedio').
nivel('l6', 'Avanzado').
nivel('l7', 'Avanzado').
nivel('l8', 'Avanzado').

recomendar_continuacion(EstudianteID, Recomendaciones) :-
    findall(NombreLibro,
        (leido(EstudianteID, LibroID),
         buscar_continuaciones(LibroID, NombreLibro)),
        Recomendaciones).

buscar_continuaciones(LibroID, NombreLibro) :-
    es_continuacion(ContinuacionID, LibroID),
    libro(ContinuacionID, _, NombreLibro, _).
buscar_continuaciones(LibroID, NombreLibro) :-
    es_continuacion(ContinuacionID, LibroID),
    buscar_continuaciones(ContinuacionID, NombreLibro).

% Recomendación de libros del mismo nivel
recomendar_nivel(EstudianteID, Recomendaciones) :-
    findall(LibroID, leido(EstudianteID, LibroID), LibrosLeidos),
    findall(NombreLibro,
        (leido(EstudianteID, LibroID),
         nivel(LibroID, Nivel),
         nivel(LibroRecomendado, Nivel),
         libro(LibroRecomendado, _, NombreLibro, _),
         \+ member(LibroRecomendado, LibrosLeidos)),
        Recomendaciones).

% Combinar recomendaciones y evitar duplicados
recomendar_libros(EstudianteID) :-
    recomendar_continuacion(EstudianteID, RecomendacionesContinuacion),
    (   RecomendacionesContinuacion \= []
    ->  Recomendaciones = RecomendacionesContinuacion
    ;   recomendar_nivel(EstudianteID, RecomendacionesNivel),
        Recomendaciones = RecomendacionesNivel
    ),
    sort(Recomendaciones, RecomendacionesUnicas),
    (   RecomendacionesUnicas \= []
    ->  listar_recomendaciones(RecomendacionesUnicas)
    ;   write('No hay recomendaciones disponibles.'), nl).

% Predicado para listar las recomendaciones
listar_recomendaciones([]).
listar_recomendaciones([Primera|Resto]) :-
    write('Recomiendo leer: '), write(Primera), write('.'), nl,
    listar_recomendaciones(Resto).
