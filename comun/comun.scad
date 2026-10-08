// comun.scad
// punto de entrada de la biblioteca comun: incluye todas las
// constantes, funciones y modulos compartidos. pensado para proyectos
// que usan este repositorio como submodulo, por ejemplo bote:
//
//   include <../terceros/popusintes-cajas-paneles/comun/comun.scad>
//
// no incluye versiones.scad: cada proyecto define su propia VERSION y
// las constantes de sus modulos (*_TEXTO, *_HP)

include <./constantes.scad>
include <./formas.scad>
include <./texto.scad>
include <./perillas.scad>
include <./posicionador.scad>
include <./columnas.scad>
include <./espaciado.scad>
include <./tornillos.scad>
include <./componentes.scad>
include <./panel.scad>
include <./caja.scad>
