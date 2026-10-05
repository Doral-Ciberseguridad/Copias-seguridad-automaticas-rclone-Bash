#!/bin/bash

# 1. Solicito los datos necesarios al usuario
read -p "Introduce la ruta del directorio/archivo al que quieres hacer backup (ej: /home) --> " DIR_ORIGEN

read -p "¿Ya has configurado rclone anteriormente? Este paso es necesario para el correcto funcionamiento del script. (s/n) --> " rclone_configurado
while true; do
    if [ "$rclone_configurado" == "s" ] || [ "$rclone_configurado" == "S" ]; then
        echo "Ok."
        break
    elif [ "$rclone_configurado" == "n" ] || [ "$rclone_configurado" == "N" ]; then
        echo "Sigue estas instrucciones:"
        echo ""
        rclone config
        break
    else
        echo "Opción inválida, introduce 's' o 'n'."
        read -p "¿Ya has configurado rclone anteriormente? (s/n) --> " rclone_configurado
    fi
done

read -p "Introduce el remoto y carpeta en la nube (ej: Prueba:backups) --> " REMOTO

# 2. Preparo rutas y limpieza
DIR_DEST="/home/root/backups"
FECHA=$(date +%d-%m-%Y)
ZIP_FILE="$DIR_DEST/backup-$FECHA.zip"

mkdir -p "$DIR_DEST"
rm -f "$ZIP_FILE"

# 3. Comprimo el archivo que me ha indicado el usuario
echo "Comprimiendo..."
/usr/bin/7z a "$ZIP_FILE" "$DIR_ORIGEN" >/dev/null 2>&1

# 4. Subo el archivo comprimido a la nube
echo "Subiendo a la nube..."
/usr/bin/rclone copyto "$ZIP_FILE" "$REMOTO/backup_rclone-$FECHA.zip" --verbose

# 5.Mensaje final
echo "¡Backup completado y subido!"
