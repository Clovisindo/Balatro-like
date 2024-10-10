<!--
*** Thanks for checking out the Best-README-Template. If you have a suggestion
*** that would make this better, please fork the repo and create a pull request
*** or simply open an issue with the tag "enhancement".
*** Thanks again! Now go create something AMAZING! :D
-->



<!-- PROJECT SHIELDS -->
<!--
*** I'm using markdown "reference style" links for readability.
*** Reference links are enclosed in brackets [ ] instead of parentheses ( ).
*** See the bottom of this document for the declaration of the reference variables
*** for contributors-url, forks-url, etc. This is an optional, concise syntax you may use.
*** https://www.markdownguide.org/basic-syntax/#reference-style-links
-->
[![Contributors][contributors-shield]][contributors-url]
[![Forks][forks-shield]][forks-url]
[![Stargazers][stars-shield]][stars-url]
[![Issues][issues-shield]][issues-url]
[![MIT License][license-shield]][license-url]
[![LinkedIn][linkedin-shield]][linkedin-url]



<!-- PROJECT LOGO -->
<br />
<p align="center">
  <a href="https://github.com/Clovisindo/Balatro-like.git">
    <img src="images/logo.png" alt="Logo" width="80" height="80">
  </a>

  <h3 align="center">Balatro-like</h3>

  <p align="center">
   Balatro-like
    <br />
    <a href="https://github.com/Clovisindo/Balatro-like"><strong>Ver documentos »</strong></a>
    <br />
    <br />
    <a href="https://github.com/Clovisindo/Balatro-like">Ver Demo</a>
    ·
    <a href="https://github.com/Clovisindo/Balatro-like/issues">Reportar un error</a>
    ·
    <a href="https://github.com/Clovisindo/Balatro-like/issues">Solicita una funcionalidad</a>
  </p>
</p>



<!-- TABLE OF CONTENTS -->
<details open="open">
  <summary>Table of Contents</summary>
  <ol>
    <li>
      <a href="#about-the-project">Tabla de contenidos</a>
      <ul>
        <li><a href="#built-with">Instrucciones de instalación</a></li>
      </ul>
    </li>
    <li>
      <a href="#getting-started">Como empezar</a>
      <ul>
        <li><a href="#prerequisites">Prerequisitos</a></li>
        <li><a href="#installation">Instalación</a></li>
      </ul>
    </li>
    <li><a href="#usage">Uso</a></li>
    <li><a href="#roadmap">Hoja de ruta</a></li>
    <li><a href="#contributing">Contribuir</a></li>
    <li><a href="#license">Licencia</a></li>
    <li><a href="#contact">Contacto</a></li>
    <li><a href="#Agradecimientos">Agradecimientos</a></li>
  </ol>
</details>



<!-- ABOUT THE PROJECT -->
## Sobre el proyecto

Pequeña demo para replicar los efectos y feeling de interactuar con las cartas en Balatro.

Basado en el proyecto de MixAndJam, quería intentar replicarlo en Godot para poner a prueba mi capacidad de replicar funcionalidades independientemente del motor.

https://www.youtube.com/watch?v=I1dAZuWurw4

Algunas cosas se quedaron en el camino, otras han sido mas sencillas, y algunas las cambiaría como las he planteado.

Objeto carta interactuable, que responde a distintos eventos.

Si haces un clic, cambia a estado “seleccionada”.
Si lo mantienes, puedes arrastrar la carta y moverla a otra posición de la mano.
Al soltarla , se adapta a la posición que le corresponde.
Con el movimiento de arrastrar, la carta gira con la inercia del movimiento.
Al pasar el ratón por encima, la carta se sacude para dar feedback de cual se está interactuando.
Separación de la parte visual en otro objeto, para poder aplicar los efectos mejor sin afectar al objeto que recibe la lógica.
Rotación de la carta en estado “reposo”, y cuando se pasa el ratón por encima, se ajusta a la posición del ratón.
Gestion de la mano:

 Añadiendo cartas se autoajustan al tamaño de la mano.
Errores:

Usar el elemento de godot para ahorrar el metodo de autoordenar la mano no es una buena decision, es mejor implementar algo propio, y además tendríamos mas opciones para colocar las cartas aplicando curvas al posicionamiento.
Haber elegido elementos 2D, era más fácil simular el efecto 2D con cartas en 3D y no tendría que usar un shader para simular la rotación.
Faltaría añadir los efectos de policromo y negativo, pero con ningún conocimiento en shaders no he sido capaz de replicarlo ;( .

<!-- Como empezar -->
## Como empezar

Guia paso a paso de como descargar el proyecto.

### Prerequisitos

*Godot 4
### Instalacion

1. Clona el repositorio.
   ```sh
   git clone https://github.com/Clovisindo/Balatro-like.git
   ```
2. Añadir la solucion a Godot.


<!-- Hoja de ruta -->
## Hoja de ruta

Revisa las [tareas abiertas](https://github.com/Clovisindo/Balatro-like/issues) para ver la lista de proximas funcionalidades (y fallos conocidos).



<!-- Contribuir -->
## Contribuir

1. Crea un Fork del proyecto
2. crea una rama de tu funcionalidad (`git checkout -b feature/AmazingFeature`)
3. Sube los cambios (`git commit -m 'Add some AmazingFeature'`)
4. Añadelos a la rama (`git push origin feature/AmazingFeature`)
5. abre una "Pull request".



<!-- LICENCIA -->
## Licencia
Distribuido bajo licencia MIT.


<!-- Contacto -->
## Contacto

Damian - [@Clovisindo](https://twitter.com/Clovisindo) - damianmgbamio@gmail.com

Project Link: [https://github.com/Clovisindo/Balatro-like](https://github.com/Clovisindo/Balatro-like)


<!-- Agradecimientos -->
## Agradecimientos

* [Assets creados por ...]


<!-- MARKDOWN LINKS & IMAGES -->
<!-- https://www.markdownguide.org/basic-syntax/#reference-style-links -->
[contributors-shield]: https://img.shields.io/github/contributors/Clovisindo/Balatro-like.svg?style=for-the-badge
[contributors-url]: https://github.com/Clovisindo/Balatro-like/graphs/contributors
[forks-shield]: https://img.shields.io/github/forks/Clovisindo/Balatro-like.svg?style=for-the-badge
[forks-url]: https://github.com/Clovisindo/Balatro-like/network/members
[stars-shield]: https://img.shields.io/github/stars/Clovisindo/Balatro-like.svg?style=for-the-badge
[stars-url]: https://github.com/Clovisindo/Balatro-like/stargazers
[issues-shield]: https://img.shields.io/github/issues/Clovisindo/Balatro-like.svg?style=for-the-badge
[issues-url]: https://github.com/Clovisindo/Balatro-like/issues
[license-shield]: https://img.shields.io/github/license/Clovisindo/Balatro-like.svg?style=for-the-badge
[license-url]: https://github.com/Clovisindo/Balatro-like/blob/master/license.txt
[linkedin-shield]: https://img.shields.io/badge/-LinkedIn-black.svg?style=for-the-badge&logo=linkedin&colorB=555
[linkedin-url]: https://linkedin.com/in/Clovisindo
[product-screenshot]: images/screenshot.png
