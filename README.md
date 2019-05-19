# Movies APP

La app se genero con una arquitectura MVC en donde tenemos como modelo a la clase 'Movie' y 'MovieTableView', las vistas son los storyboards 'LaunchScreen' y 'Main' y los controladores 'ViewController' y 'MovieDetailViewController'.
El manejo de los datos los cuales voy a usar para llenar las tablas lo hago desde una clase de servicios 'APICli'.

El principio de responsabilidad unico consiste en que cada clase que se genere debe tener una sola responsabilidad, y esta debe estar encapsulada. Su proposito es que mantener alta cohesion, que todo lo relacionado a esa responsabilidad este en esa clase, y bajo acoplamiento, reduciendo la relacion de esa clase con el resto, con el proposito de crear codigo mantenible, extensible y testeable.

En mi opinion un codigo limpio debe tener algoritmos y rutinas enfocadas, que hagan una sola cosa, cortas, legibles y entendibles por cualquier desarrollador que tome ese codigo. Deberia tener comentarios que ayuden a la lectura. No deberia repetir lo mismo en distintos lugares o con variables que pueden ser parametrizables. Debe tener la menor cantidad de dependencias posibles. Debe poder ser extendido por cualquier desarrollador. Debe poder ser testeado, y tener purebas implementadas.
