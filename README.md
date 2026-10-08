# popusintes-cajas-paneles

cajas y paneles paramétriques en OpenSCAD

## Desarrollo

Este repositorio contiene los archivos escritos en OpenSCAD para generar cajas y paneles para el proyecto Popusintes, una colección de sintetizadores modulares

Al clonar el repositorio, ejecutar este comando una vez para activar el hook de pre-commit que corrige automáticamente estilo en los archivos `.scad`:

```bash
git config core.hooksPath .githooks
```

Para exportar todas las cajas y paneles a `.stl` con un solo comando:

```bash
./scripts/exportar-stl.sh
```

Esto deja los archivos en `stl-<version>/`, donde `<version>` es el valor de `VERSION` en [comun/versiones.scad](comun/versiones.scad) — la misma que se graba en cada pieza. Al cambiar `VERSION` y volver a exportar, se genera una carpeta `stl-<version>/` nueva. También se puede filtrar por nombre de pieza, por ejemplo `./scripts/exportar-stl.sh relo` exporta solo `relo_caja.stl` y `relo_panel.stl`. Requiere tener `openscad` instalado (en Mac, si no está en el `PATH`, el script busca automáticamente `/Applications/OpenSCAD.app`).

## Estructura del repositorio

### Configuracion

- [.github/](./.github/): archivos de configuración y automatizaciones para GitHub.
- [scripts/](./scripts/): scripts para mantenimiento, linting y exportado a `.stl` de los archivos.
- [LICENSE](./LICENSE): licencia del repositorio.
- [README.md](./README.md): este archivo, con información del repositorio.
- [comun/](./comun/): archivos comunes a todas las cajas y paneles, con constantes y funciones. Se pueden usar desde otros repositorios, ver [Uso como biblioteca](#uso-como-biblioteca).

### Cajas y paneles de los módulos

- [ataconso](./ataconso/)
- [compa](./compa/)
- [envo](./envo/)
- [grilla](./grilla/)
- [noti](./noti/)
- [pane](./pane/)
- [recta](./recta/)
- [relo](./relo/)
- [rerelo](./rerelo/)
- [secu](./secu/)
- [suma](./suma/)

## Uso como biblioteca

Otros proyectos pueden usar [comun/](./comun/) como biblioteca de constantes y funciones, agregando este repositorio como submódulo de git fijado a un tag:

```bash
git submodule add https://github.com/piruetasxyz/popusintes-cajas-paneles.git terceros/popusintes-cajas-paneles
git -C terceros/popusintes-cajas-paneles checkout <tag>
```

e incluyendo el punto de entrada [comun/comun.scad](comun/comun.scad), con una ruta relativa al archivo `.scad` que lo usa:

```openscad
include <../terceros/popusintes-cajas-paneles/comun/comun.scad>
```

`comun.scad` no incluye [comun/versiones.scad](comun/versiones.scad): cada proyecto define su propia `VERSION` y las constantes de sus módulos. Por eso los archivos de `comun/` no deben dibujar geometría al nivel superior, solo definir constantes, funciones y módulos.

Proyectos que usan esta biblioteca:

- [bote](https://github.com/piruetasxyz/bote): caja de varios módulos con rieles. Vivía en este repositorio hasta octubre 2026.

## Versiones

La versión vive en `VERSION` en [comun/versiones.scad](comun/versiones.scad), se graba en cada pieza y da nombre a la carpeta `stl-<version>/` que genera el script de exportado.

- **v0.0.7**: se unifica la perilla a un solo tamaño. Antes había `agujero_perilla_grande` (RoundBlackKnob) y `agujero_perilla_chica` (RoundSmallBlackKnob); ahora existe un único módulo `agujero_perilla` (Ø 6.1 mm) que usan todos los paneles. Las perforaciones se probaron renderizando los dos tamaños del panel `grilla` (4 hp y 8 hp) con OpenSCAD. STL en `stl-v0.0.7/`.
- **v0.0.x** (julio–agosto 2026): pruebas de tamaño.

## Licencia

MIT
