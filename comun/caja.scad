// caja.scad
// caja generica reutilizada por todos los modulos
//
// hp define el ancho util interior; el ancho exterior
// es una consecuencia de sumarle la pared

include <./constantes.scad>
include <./formas.scad>
include <./texto.scad>

module caja(
    hp,
    texto,
    version,
    pared = CAJA_PARED,
    radio_esquina = 1.5,
    tamano_texto = MODULO_ALTURA_3U * 0.05,
    tamano_version = MODULO_ALTURA_3U * 0.035
) {

  ancho_int       = CAJA_ANCHO * hp;
  altura_int      = CAJA_ALTURA;
  profundidad_int = CAJA_PROFUNDIDAD;

  ancho_ext       = 2 * pared + ancho_int;
  altura_ext      = 2 * pared + altura_int;
  profundidad_ext = pared + profundidad_int;

  // profundidad del asiento donde calza el panel, y donde
  // por lo tanto empieza el lip que lo detiene
  lip_profundidad = pared;
  profundidad_asiento = profundidad_ext - lip_profundidad;

  module cuerpo() {
    difference() {
      // caja hueca con esquinas exteriores redondeadas
      caja_redondeada(ancho_ext, altura_ext, profundidad_ext, radio_esquina);

      // cavidad angosta desde la base hasta el lip: deja un
      // reborde perimetral de ancho = pared que detiene al panel
      translate([2 * pared, 2 * pared, -1])
        cube([
          ancho_int - 2 * pared,
          altura_int - 2 * pared,
          profundidad_asiento + 1
        ], center=false);

      // asiento del panel: cavidad de ancho completo cerca del
      // frente, donde el panel calza apoyado sobre el lip
      translate([pared, pared, profundidad_asiento])
        cube([ancho_int, altura_int, lip_profundidad + 1], center=false);
    }
  }

  module base() {
    difference() {
      caja_redondeada(ancho_ext, altura_ext, pared, radio_esquina);

      // grabados en la base
      texto_base(texto,   tamano_texto,   ancho_ext/2, 40*altura_ext/100);
      texto_base(version, tamano_version, ancho_ext/2, 60*altura_ext/100);
    }
  }

  cuerpo();
  base();
}
