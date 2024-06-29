# Resumen de Agentes Inteligentes

## Introducción a los Agentes Inteligentes

### Definición de Agente
Un **agente** es una entidad que percibe su entorno a través de sensores y actúa sobre dicho entorno mediante actuadores. Los agentes pueden ser simples programas de software o robots complejos.

### Características de un Agente
- **Autonomía**: Capacidad de operar sin intervención humana.
- **Reactividad**: Respuesta a cambios en el entorno en tiempo real.
- **Proactividad**: Comportamiento dirigido a objetivos y capacidad de tomar la iniciativa.
- **Sociabilidad**: Capacidad de comunicarse y cooperar con otros agentes o humanos.

## Tipos de Agentes

### Agentes Simples
Funcionan en base a reglas predefinidas (si-esto-entonces-aquello) y no tienen memoria.

### Agentes Basados en Modelo
Tienen un modelo del mundo que utilizan para tomar decisiones más informadas y manejar situaciones donde no todas las variables están presentes.

### Agentes Basados en Objetivos
Operan para alcanzar objetivos específicos y pueden elegir entre varias acciones para lograr sus metas.

### Agentes Basados en Utilidades
Eligen acciones basándose en la maximización de una función de utilidad, buscando el mejor estado posible según una medida cuantificable.

### Agentes de Aprendizaje
Pueden aprender y mejorar su comportamiento con el tiempo a través de la experiencia.

## Arquitectura de Agentes

### Arquitectura Reactiva
Compuesta por reglas simples de condición-acción. Es adecuada para entornos dinámicos y cambiantes.

### Arquitectura Basada en Planificación
El agente realiza una planificación previa antes de actuar, utilizando un modelo del entorno y simulando diferentes cursos de acción.

### Arquitectura Híbrida
Combina características de arquitecturas reactivas y basadas en planificación, permitiendo tanto respuestas rápidas como acciones planeadas a largo plazo.

## Ventajas y Desventajas de los Tipos de Agentes

| Tipo de Agente             | Ventajas                                                                                   | Desventajas                                                                        |
|----------------------------|--------------------------------------------------------------------------------------------|------------------------------------------------------------------------------------|
| Agentes Simples            | Simplicidad, fácil de implementar y mantener.                                              | Limitados a entornos predecibles, no pueden adaptarse a cambios imprevistos.       |
| Agentes Basados en Modelo  | Mejor toma de decisiones en entornos complejos, pueden manejar incertidumbre.              | Requieren más recursos computacionales, complejidad en la creación del modelo.      |
| Agentes Basados en Objetivos| Orientados a metas, pueden adaptarse a diferentes caminos para lograr objetivos.          | Pueden ser más difíciles de programar, requieren definición clara de objetivos.    |
| Agentes Basados en Utilidades| Maximización de resultados, pueden evaluar múltiples opciones.                           | Complejos de implementar, pueden requerir mucho tiempo para evaluar todas las opciones. |
| Agentes de Aprendizaje     | Capacidad de mejorar con el tiempo, adaptabilidad a nuevos entornos y situaciones.        | Requieren datos de entrenamiento, posibles problemas de sobreajuste o subajuste.   |

## Aplicaciones de los Agentes Inteligentes

### Sistemas Multiagente
Colección de agentes que interactúan para resolver problemas que son demasiado complejos para un solo agente. Ejemplos incluyen mercados electrónicos y sistemas de simulación.

### Agentes en Videojuegos
Controlan personajes no jugables (NPCs), proporcionando comportamientos inteligentes y adaptativos.

### Asistentes Virtuales
Como Siri, Alexa, y Google Assistant, que proporcionan asistencia basada en lenguaje natural y aprendizaje automático.

### Robótica
Robots autónomos que pueden realizar tareas en entornos diversos, desde limpieza del hogar hasta exploración espacial.

## Desafíos y Consideraciones

### Complejidad Computacional
El procesamiento de información y la toma de decisiones en tiempo real puede ser computacionalmente intensivo.

### Seguridad y Ética
Garantizar que los agentes actúen de manera segura y ética, especialmente en aplicaciones críticas como la conducción autónoma.

### Interacción Humano-Agente
Diseñar interfaces y métodos de comunicación efectivos para la colaboración entre humanos y agentes.

## Herramientas y Tecnologías para Agentes Inteligentes

### Plataformas de Desarrollo
- **JADE (Java Agent DEvelopment Framework)**: Plataforma de desarrollo para sistemas multiagente.
- **Jason**: Extensión de AgentSpeak para la implementación de agentes inteligentes.

### Lenguajes de Programación
- **Prolog**: Usado para programación lógica y agentes basados en reglas.
- **Python**: Popular para implementar algoritmos de aprendizaje y agentes inteligentes debido a sus bibliotecas de IA como TensorFlow y PyTorch.

## Ejemplo de Agente Inteligente en Prolog

A continuación, se presenta un ejemplo en Prolog que muestra cómo un agente puede recomendar libros a estudiantes basándose en los libros que ya han leído y las continuaciones de los mismos.

```prolog
% Base de conocimiento
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
