#   SO-Scripts

Este repositorio contiene una colección de scripts de Bash desarrollados en 2021 para la materia Sistemas Operativos. Los scripts cubren diversas tareas, desde la manipulación de archivos y directorios hasta la automatización de tareas del sistema.

##   Contenido

* `alculadora.sh`: Simula una calculadora con operaciones de suma y resta a través de un menú interactivo.
* `calcular_expresion_entrada.sh`: Lee datos desde `entrada.txt`, realiza cálculos y muestra los resultados.
* `calcular_promedios_alumnos.sh`: Calcula el promedio de notas de alumnos a partir de un archivo `alumnos`, generando archivos con los promedios generales (`Promedios`), el promedio más alto (`prom-mas-alto`) y el promedio más bajo (`prom-mas-bajo`).
* `contar_lineas_archivos_directorio.sh`: Calcula la cantidad de líneas de los archivos en un directorio dado y guarda el resultado en `informe.txt`.
* `crear_usuario.sh`: Simula la creación de un nuevo usuario en el sistema, incluyendo la creación de directorio home, configuración de contraseña y adición a los archivos de configuración del sistema.
* `generar_tabla_multiplicar.sh`: Genera la tabla de multiplicar de un número ingresado por el usuario.
* `mover_archivos_contar_directorios.sh`: Mueve archivos `.doc` y `.xls` a directorios específicos y genera un reporte con las cantidades.
* `procesar_passwd_usuarios.sh`: Procesa el archivo `/etc/passwd` para generar informes sobre usuarios que comienzan con "so1", "so2", "so3" y "so4".
* `reporte_archivos_ejecucion.sh`: Genera reportes sobre archivos `.sh` (ejecutables y no ejecutables) y archivos `.doc` en un directorio dado.
* `reporte_tipos_archivos.sh`: Recorre un directorio, cuenta la cantidad de archivos ejecutables, no ejecutables y .doc, y genera un reporte.

##   Cómo Ejecutar los Scripts

Para ejecutar un script, abre una terminal, navega al directorio del script y ejecuta el siguiente comando:

```bash
bash nombre_del_script.sh [argumentos_si_es_necesario]
