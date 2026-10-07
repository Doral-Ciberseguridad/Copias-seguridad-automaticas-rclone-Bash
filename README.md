Pasos para ejecutar y usar esta herramienta:



1. Clona o descarga el repositorio en tu máquina ejecutando este comando:

```
git clone https://github.com/Doral-Ciberseguridad/Copias-seguridad-automaticas-rclone-Bash.git
```



2. Instala las dependencias necesarias (como 7z y rclone) ejecutando en tu terminal:

```
sudo apt update && sudo apt install p7zip-full rclone
```




3. Dale permisos de ejecución y lanza el script ejecutando en tu terminal:

```
chmod +x 3.Copias_seguridad_nube.sh
```
```
./3.Copias_seguridad_nube.sh
```




4. Sigue el asistente interactivo para configurar o verificar rclone (si no lo habías hecho previamente)



5. Introduce la ruta del directorio de origen que deseas respaldar y el remoto con la carpeta en la nube de destino para comprobar la compresión y subida automática de tus archivos

