# Escaneo nmap Automatizado
## Un escaneo de nmap automatizado para el kali auto-bspwm o cualquier entorno kali que cuente con la función "settarget". Espero que os sea útil!!! :)

-------------------------------------------------------------------------------------------------------

Primero deberemos localizar el archivo donde se almacena el "TARGET" cuando lo especificamos con el comando `settarget`. Para ello nos iremos a __~.zshrc__, donde también estaremos realizando todo el proceso:
```bash
nano ~/.zshrc
```

Una vez aquí, buscaremos la función de `settarget`:
![Captura de pantalla 1](https://github.com/samucrow/escaneo_nmap/assets/34478588/81150796-fdf7-4231-8305-3dde382422b1)
```python
# Settarget
function settarget(){
        if [ $# -eq 1 ]; then
                echo $1 > ~/.config/polybar/shapes/scripts/target
        elif [ $# -gt 2 ]; then
                echo "settarget [IP] [NAME] | settarget [IP]"
        else
                echo $1 $2 > ~/.config/polybar/shapes/scripts/target
        fi
}
```

Como vemos, redirige lo que pongamos en el comando a __~/.config/polybar/shapes/scripts/target__, así que ya tenemos el archivo donde se almacena la ip objetivo. Ahora empezamos con la variable.

En primer lugar vamos a especificar una función, en mi caso se llama _archivo_target_, donde vamos a darle el valor del lugar donde está el archivo en el que se almacena la ip:
( __~/.config/polybar/shapes/scripts/target__ ):
![Captura de pantalla 2](https://github.com/samucrow/escaneo_nmap/assets/34478588/f6d9f299-6c8c-459e-b094-b0cc665fcb67)
El siguiente paso es verificar si este archivo está vacío o contiene información para que , más adelante, podamos especificar un mensaje de error y que no haga el escaneo si no hay ip:
![Captura de pantalla 3](https://github.com/samucrow/escaneo_nmap/assets/34478588/f6dba974-d505-43d3-bce6-25364e1fcd1f)
Ahora almacenaremos en otra función la primera frase del archivo (si tiene contenido) para que nos coja sólo la ip:
![Captura de pantalla 4](https://github.com/samucrow/escaneo_nmap/assets/34478588/5be3eee1-8015-4942-b095-01dfa010d9b9)
Y, como no, realizamos el escaneo de nmap con estos datos:
![Captura de pantalla 5](https://github.com/samucrow/escaneo_nmap/assets/34478588/8ac7e1c5-6b10-41f5-aab5-35f760e6f6a4)
Ahora, por si hubiese algún error al hacer el escaneo de nmap, pondremos un mensaje de error:
![Captura de pantalla 6](https://github.com/samucrow/escaneo_nmap/assets/34478588/fc17a335-50f2-4b9c-b0d5-c0a03ba7426c)
Y ahora, por último, especificaremos las instrucciones a seguir si el archivo "_~/.config/polybar/shapes/scripts/target_" está vacío (si no hay ninguna palabra):
![Captura de pantalla 7](https://github.com/samucrow/escaneo_nmap/assets/34478588/1597538a-2e5f-4831-a1b2-9266dfcfd64e)
Y ya estaría!!! Súper simple pero muy efectivo, solo quedaría REINICIAR nuestra máquina para que los cambios sean efectivos!!

## Ahora veamos la práctica. 

### 1. Con target válido:

![Captura de pantalla 8](https://github.com/samucrow/escaneo_nmap/assets/34478588/a484ea0d-9353-49fa-b7fb-977d371baa91)

### 2. Con target vacío:
![Captura de pantalla 9](https://github.com/samucrow/escaneo_nmap/assets/34478588/af45594a-b8b4-4b52-b701-7cd9853dfa53)

### 3. Escaneo fallido:
![Captura de pantalla 10](https://github.com/samucrow/escaneo_nmap/assets/34478588/4e45eb67-6be4-4113-89b8-9bb6d357b434)
