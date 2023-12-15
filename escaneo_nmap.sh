# Función de NMAP
function escaneo(){

        archivo_target=~/.config/polybar/shapes/scripts/target

        # Verificamos si el archivo ^ está vacío ( Si tiene 1 Byte o menos se consideraría vacío)

        if [ $(wc -w < "$archivo_target") -gt 0 ]; then

        # Ahora leeremos el archivo (Si tiene contenido) para que lea la primera línea, que es la ip.

        escaneado=$(head -n 1 "$archivo_target")

        # Realizamos el escaneo...

        nmap -p- --open -sCV -sS -n -Pn -vvv $escaneado -oN escaneo_nmap 2>/dev/null

                # Pondremos un comando por si hay algún error al realizar el escaneo debido a que la ip establecida en el target no es válida.

                if [ $? -ne 0 ]; then
                        echo -e "\e[1;31m Hubo un problema al realizar el escaneo, prueba a poner una ip válida en el target con el comando 'settarget'. Y ACUÉRDATE QUE DEBES SER ROOT PARA REALIZAR UN ESCANEO DE NMAP\e[0m"
                        rm escaneo_nmap -f
                fi

        else
                echo -e "\e[1;34m No has añadido ningún objetivo!! Dime cuál es la ip a la que debo hacer el escaneo con el comando 'settarget' :) \e[0m"
                return 1 # Esto es para que nos dé código de error al ejecutarse y no lo tome como que se ha ejecutado correctamente.
        fi
}
