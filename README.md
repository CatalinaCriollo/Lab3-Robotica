# Laboratorio N° 03 - 2024-II - Robótica de Desarrollo, Intro a ROS

Integrantes: Catalina Criollo Castelblanco - Diego Fernando Malagón Saenz

## Proceso de instalación de ROS2.

### Consideraciones previas
Antes de proceder con la instalación, es importante asegurarse de que el nombre de usuario del computador no contenga espacios, ya que esto puede generar problemas en las direcciones de las carpetas.

### Descarga de Miniforge
La instalación de ROS2 se realiza a través de RoboStack (https://robostack.github.io/index.html). En la sección "Getting Started", se encuentra un hipervínculo hacia "miniforge", el cual dirige al sitio donde se puede descargar el instalador minimalista de conda.

En la página de GitHub correspondiente, se debe navegar hasta la sección **Install -> Windows** y hacer clic en el hipervínculo "the Windows installer". Esto descargará el ejecutable **Miniforge3-Windows-x86_64.exe**.

### Instalación de Miniforge
Una vez descargado el instalador, se ejecuta el archivo **Miniforge3-Windows-x86_64.exe**. Durante la instalación, en las opciones avanzadas, se deben seleccionar las siguientes casillas:
- Create shortcuts (supported packages only)
- Add Miniforge3 to my PATH environment variable
- Register Miniforge3 as my default Python 3.12

### Verificación de la instalación
Tras completar la instalación, se debe abrir el sistema de comandos y verificar la instalación de `mamba` y `conda` ejecutando:
```
mamba --version
conda --version
```

### Creación y configuración del entorno
Para preparar un entorno con los canales correctos, se ejecutan las siguientes líneas en el sistema de comandos:
```
mamba create -n ros_env python=3.11
mamba activate ros_env
```
Si se presenta un error en este paso, el sistema de comandos indicará una línea de código que se debe ejecutar para solucionarlo. Luego, se deben volver a ejecutar las líneas anteriores.

Posteriormente, se configuran los canales de conda en el entorno:
```sh
# Agregar el canal conda-forge
conda config --env --add channels conda-forge

# Agregar el canal robostack-staging
conda config --env --add channels robostack-staging

# Agregar el canal de ROS Jazzy (si se desea usar esta versión)
conda config --env --add channels robostack-jazzy

# Eliminar el canal defaults (esto puede generar un error si no está en la lista, lo cual es aceptable)
conda config --env --remove channels defaults
```

### Instalación de ROS2
Para instalar ROS2 Humble en el entorno creado, se ejecuta el siguiente comando:
```sh
mamba install ros-humble-desktop
```

Con esto, se completa la instalación de ROS2 en Windows 11 a través de RoboStack.



