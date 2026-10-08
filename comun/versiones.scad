// versiones.scad

include <./constantes.scad>

// version compartida por todas las cajas y paneles: un solo string,
// grabado igual en cada pieza exportada
VERSION = "v0.0.11";

ATACONSO_TEXTO = "ataconso";
ATACONSO_HP = 5;

COMPA_TEXTO = "compa";
COMPA_HP = 5;

ENVO_TEXTO = "envo";
ENVO_HP = 5;

GRILLA_TEXTO = "grilla";
// dos tamanhos del panel de referencia: 5 hp con 2 columnas y 10 hp con
// las 4 columnas del layout ancho (como rerelo)
GRILLA_HP_CHICA = 5;
GRILLA_HP_ANCHA = 10;

NOTI_TEXTO = "noti";
NOTI_HP = 10;

PANE_TEXTO = "pane";
PANE_HP = 5;

RECTA_TEXTO = "recta";
RECTA_HP = 5;

RELO_TEXTO = "relo";
RELO_HP = 5;

RERELO_TEXTO = "rerelo";
RERELO_HP = 10;

SECU_TEXTO = "secu";
SECU_HP = 10;

SUMA_TEXTO = "suma";
SUMA_HP = 5;

// versiones v0.0.x
// pruebas de tamano
// realizadas entre julio y agosto 2026
//
// v0.0.7: unificacion de la perilla a un solo tamano (antes habia
// perilla grande y chica), probada en las perforaciones de grilla
//
// v0.0.8: prueba de tamano de grilla, ahora 5 hp (chica) y 10 hp
// (ancha), antes 4 hp y 8 hp
//
// v0.0.9: todos los modulos suben de tamano: los de 4 hp pasan a 5 hp
// (ataconso, compa, envo, recta, relo, suma) y los de 8 hp pasan a
// 10 hp (noti, rerelo, secu). ademas agujero de jack a 6.2 mm, agujero
// de perilla a 6.6 mm y grosor de panel a 2.4 mm
//
// v0.0.10: bote pasa a 48 hp (el maximo par que cabe en una bambu lab
// x1c) y a 90 mm de profundidad util interior. ademas el ancho de bote
// queda en la constante BOTE_HP, que ahora usa tambien exportar-stl.sh
//
// v0.0.11: bote tiene su propia geometria, con rieles arriba y abajo
// con agujeros piloto M3 cada 1 hp para atornillar los paneles, sin
// lip perimetral, con 0.4 mm de holgura en el asiento y con un
// agujero de 90 x 20 mm en la pared izquierda para el bus de poder.
// para esta prueba la profundidad util de bote baja a 45 mm
