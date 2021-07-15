

## **Álgebra relacional**

El **álgebra relacional** estudia basicamente las operaciones que se pueden realizar entre diversos conjuntos de datos.
⠀

------

⠀
No confundir las **relaciones del álgebra relacional** con las **relaciones de una base de datos relacional**.

- Las relaciones de una base de datos es cuando unes dos tablas.
- Las relaciones en álgebra relacional se refiere a una tabla.
  \- La diferencia es conceptual: Las tablas pueden tener tuplas repetidas pero en el álgebra relacional cada relación no tiene un cuerpo, no tiene un primer ni último *row*.

------

------

## **Tipos de operadores**

- **Operadores unarios.-** Requiere una relación o tabla para funcionar.
  \- **Proyección (π):** Equivale al comando Select. Saca un número de columnas o atributos sin necesidad de hacer una unión con una segunda tabla.
  **π**<Nombre, Apellido, Email>(Tabla_Alumno)
  ⠀
  \- **Selección (σ):** Equivale al comando Where. Consiste en el filtrado de de tuplas.
  **σ**<Suscripción=Expert>(Tabla_Alumno)
  ⠀
- **Operadores binarios.-** Requiere más de una tabla para operar.
  \- **Producto cartesiano (x):** Toma todos los elementos de una tabla y los combina con los elementos de la segunda tabla.
  Docentes_Quinto_A **x** Alumnos_Quinto_A
  ⠀
  \- **Unión (∪):** Obtiene los elementos que existen en una de las tablas o en la otra de las tablas.
  Alumnos_Quinto_A **x** Alumnos_Quinto_B
  ⠀
  \- **Diferencia (-):** Obtiene los elementos que existe en una de las tablas pero que no corresponde a la otra tabla.
  Alumnos_planExpertPlus **-** Alumnos_planFree



![ 2020-11-05 a la(s) 17.12.12.png](https://static.platzi.com/media/user_upload/2020-11-05%20a%20la%28s%29%2017.12.12-8ce833d0-8ca0-491c-a20a-e2eb10c7147a.jpg)

## **Breve historia de SQL**

**SQL** (*Structured Query Language* - Lenguaje de consulta estructurada) es un lenguaje que se basó en 2 principios fundamentales:

1. Teoría de conjuntos.
2. Álgebra relacional de Edgar Codd (científico informático inglés).
   ⠀

------

⠀
**SQL** fue creada en 1974 por IBM.
Originalmente fue llamado **SEQUEL**, posteriormente se cambió el nombre por problemas de derechos de autor.
⠀

------

⠀⠀⠀⠀⠀⠀⠀⠀⠀
**Relation Company** (actualmente con el nombre **Oracle**) creó el software Oracle V2 en 1979.

Mas adelante **SQL** se convertiría en un lenguaje estándar que unifica todo dentro de las bases de datos relacionales, se convierte en una norma ANSI o ISO.





Vamos a instalar PostgreSQL en nuestra computadora. A continuación veremos el paso a paso y algunos consejos útiles para instalar y configurar correctamente PostgreSQL en nuestro equipo. En éste caso, usaremos Windows, pero los pasos son bastante similares entre los diferentes sistemas operativos.

Primer paso: ir a https://www.postgresql.org/.

Actualmente, la página web oficial de postgres luce así:

![1.png](https://static.platzi.com/media/user_upload/1-82324fcc-cd15-407b-ac6c-ddc47d8a243a.jpg)

Ten en cuenta que puedes ver esta página en diferentes idiomas, depende de la configuración predeterminada de idioma de tu navegador.

Hacer clic en el botón ‘Download’ (Descarga) que se encuentra en la parte inferior derecha. Veremos lo siguiente:

![2.png](https://static.platzi.com/media/user_upload/2-b1e35963-ed85-4e61-9c0e-9a43eaac00b6.jpg)

Veremos lo siguiente:
Seleccionamos la opción que corresponda con tu sistema operativo, para éste caso hacemos clic en “Windows”:

Veremos en la parte inferior:

![3.png](https://static.platzi.com/media/user_upload/3-a99ee1d6-6468-465e-96fa-4f72a2308289.jpg)

Haz clic en el enlace “Download the installer”. Esto nos va a llevar a la Web de Enterprise DB o EDB. EDB es una empresa que ofrece servicios sobre el motor de base de datos PostgreSQL y ofrece un instalador para Postgres de manera gratuita.

![4.png](https://static.platzi.com/media/user_upload/4-ca32d0f5-6047-4f85-bd8a-72bd28642684.jpg)

Es altamente recomendable seleccionar la penúltima o antepenúltima versión. Si bien la última versión estable está disponible, en éste caso la 12.0, no es recomendable instalarla en nuestro equipo, ya que al momento de instalarla o usar un servicio en la Nube para Postgres, lo más seguro es que no esté disponible y sólo esté hasta la versión 11.5, que no es la última versión. Esto porque todos los proveedores de Infraestructura no disponen de la versión de Postgres más actual siempre (tardan un poco en apropiar los nuevos lanzamientos).

Si tienes un equipo con Linux, la instalación la puedes hacer directamente desde los repositorios de Linux, EDB ya no ofrece soporte para instaladores en Linux debido a que se ha vuelto innecesario, el repositorio de Linux con PostgreSQL ofrece una manera mucho más sencilla y estándar para instalar PostgreSQL en linux.

Segundo paso: descargamos la versión “Windows x86-64” (porque nuestro sistema operativo es de 64 bits). En caso de que tu equipo sea de 32 bits debes seleccionar la opción “Windows x86-32”.

Vamos a descargar la versión 11.5. Hacemos clic en Download y guardamos el archivo que tendrá un nombre similar a:
“postgresql-11.5-2-windows-x64.exe”

Ahora vamos a la carpeta donde descargamos el archivo .exe, debe ser de aproximadamente 190 MB, lo ejecutamos.

Veremos lo siguiente:

![5.png](https://static.platzi.com/media/user_upload/5-600d1a76-de39-4796-b7bd-00fd0fa4d3a3.jpg)

Hacemos clic en siguiente. Si deseas cambiar la carpeta de destino, ahora es el momento:

![6.png](https://static.platzi.com/media/user_upload/6-c3545ad4-a4c4-47a1-8272-bfa8468d054e.jpg)

Seleccionamos los servicios que queremos instalar. En este caso dejamos seleccionados todos menos “Stack Builder”, pues ofrece la instalación de servicios adicionales que no necesitamos hasta ahora. Luego hacemos clic en siguiente:

![7.png](https://static.platzi.com/media/user_upload/7-5687b5e0-d34e-49bc-9163-8e58ff2162e3.jpg)

Ahora indicamos la carpeta donde iran guardados los datos de la base de datos, es diferente a la ruta de instalación del Motor de PostgreSQL, pero normalmente será una carpeta de nuestra carpeta de instalación. Puedes cambiar la ruta si quieres tener los datos en otra carpeta. Hacemos clic en siguiente.

![8.png](https://static.platzi.com/media/user_upload/8-f634519b-aea8-43a3-84de-0a23e95cc8e3.jpg)

Ingresamos la contraseña del usuario administrador. De manera predeterminada, Postgres crea un usuario super administrador llamado `postgres` que tiene todos los permisos y acceso a toda la base de datos, tanto para consultarla como para modificarla. En éste paso indicamos la clave de ese usuario super administrador.

Debes ingresar una clave muy segura y guardarla porque la vas a necesitar después. Luego hacemos clic en siguiente.

![9.png](https://static.platzi.com/media/user_upload/9-11aa6e1a-572b-4f1c-a037-ca83472b7fe1.jpg)

Ahora si queremos cambiar el puerto por donde el servicio de Postgresql estará escuchando peticiones, podemos hacerlo en la siguiente pantalla, si queremos dejar el predeterminado simplemente hacemos clic en siguiente.

![10.png](https://static.platzi.com/media/user_upload/10-a2b1eceb-7c3c-43c6-887d-2d3e9e5c66da.jpg)

La configuración regional puede ser la predeterminada, no es necesario cambiarla, incluso si vamos a usarla en español, ya que las tildes y las eñes estarán soportadas si dejas la configuración regional predeterminada. Es útil cambiarla cuando quieras dejar de soportar otras funciones de idiomas y lenguajes diferentes a uno específico. Luego hacemos clic en siguiente:

![11.png](https://static.platzi.com/media/user_upload/11-eee9d065-17f4-4c83-978a-712f27cbbe81.jpg)

En pantalla aparecerá el resumen de lo que se va a instalar:

![12.png](https://static.platzi.com/media/user_upload/12-0d51a90f-495e-455d-9fc3-075ef91ba19a.jpg)

Al hacer clic en siguiente se muestra una pantalla que indica que PostgreSQL está listo para instalar, al hacer clic de nuevo en siguiente iniciará la instalación, espera un par de minutos hasta que la aplicación termine.

Una vez terminada la instalación, aparecerá en pantalla un mensaje mostrando que PostgreSQL ha sido instalado correctamente.

![13.png](https://static.platzi.com/media/user_upload/13-98b744e3-de8a-4cf4-975c-6df50ca8b109.jpg)

Podemos cerrar ésta pantalla y proceder a comprobar que todo quedó instalado correctamente.

Vamos a buscar el programa PgAdmin, el cual usaremos como editor favorito para ejecutar en él todas las operaciones sobre nuestra base de datos.

También vamos a buscar la consola… Tanto la consola como PgAdmin son útiles para gestionar nuestra base de datos, una nos permite ingresar comando por comandos y la otra nos ofrece una interfaz visual fácil de entender para realizar todas las operaciones.

En el menú de Windows (o donde aparecen instalados todos los programas) buscamos “PgAdmin…”

![14.png](https://static.platzi.com/media/user_upload/14-f1f1223a-7735-400a-9a94-be4031dbef74.jpg)

Ahora buscamos “SQL Shell…”

![15.png](https://static.platzi.com/media/user_upload/15-faad2c1d-8252-4af6-9f41-465a3952fcc8.jpg)

Efectivamente, ahora aparecen las herramientas que vamos a utilizar en éste curso.
Ahora vamos a crear una base de datos de prueba usando la consola y comprobaremos si existe usando PgAdmin, la crearemos para validar que la conexión con el servicio de base de datos interno funciona correctamente.

Para ello abrimos la consola, buscamos SQL Shell y lo ejecutamos. Veremos algo así:

![16.png](https://static.platzi.com/media/user_upload/16-2b8a8090-9e18-4e4d-a9a2-c41732bae301.jpg)

Lo que vemos en pantalla es la consola esperando que ingresemos cada parámetro para la conexión.

Primero está el nombre del parámetro. En éste caso es “Server” seguido de unos corchetes que contienen el valor predeterminado. Si presionamos “Enter” sin digitar nada la consola asumirá que te refieres al valor predeterminado, si en éste caso presionamos “Enter” el valor asumido será “Localhost”. Localhost se refiere a nuestra propia máquina, si instalaste la base de datos en el mismo pc que estás usando para la consola, el valor correcto es Localhost o 127.0.0.1 (representan lo mismo).

Podemos dejar todos los valores predeterminados (presionando “Enter”) hasta que la consola pregunte por la clave del usuario maestro:

![17.png](https://static.platzi.com/media/user_upload/17-f0b53470-a533-4c2b-b5b3-501fc68e93f6.jpg)

Debemos ingresar la clave que usamos cuando estábamos instalando Postgres, de lo contrario no podremos acceder. Presionamos Enter y veremos a continuación una pantalla que nos indica que estamos logueados en la base de datos y estamos listos para hacer modificaciones.

De manera predeterminada, la base de datos instalada es Postgres, la cual no debemos tocar, ya que ejecuta funciones propias del motor. Es usada por el Motor de PostgreSQL para interactuar con todas las bases de datos que vayamos a crear en el futuro.

La siguiente imagen indica que estamos conectados a la base de datos Postgres. Vamos a crear una base de datos nueva y luego saltar el cursor a ésta base de datos recién creada.

![18.png](https://static.platzi.com/media/user_upload/18-ac8f31b5-f307-4e43-b935-cb8b97b8b7c5.jpg)

Para ello escribimos el comando “CREATE DATABASE transporte_publico;” y presionamos “Enter”. Veremos:

![19.png](https://static.platzi.com/media/user_upload/19-267d7da8-f68e-45ea-9fab-150aa62fefc5.jpg)

El mensaje “CREATE DATABASE” justo después de la línea que acabamos de escribir indica que la base de datos fue creada correctamente.

Para saltar a la base de datos recién creada ejecutamos el comando “\c transporte_publico”, el cursor mostrará lo siguiente:

![20.png](https://static.platzi.com/media/user_upload/20-f904c2a7-3eff-4ac9-8801-a75a9a5bb9fb.jpg)

Ahora vamos a validar desde PgAdmin que la base de datos fué creada correctamente. Abrimos PgAdmin y nos encontramos con una lista de items a la izquierda, lo que significa que de manera predeterminada PgAdmin ha creado un acceso a nuestra base de datos local, el cual llamó “PostgreSQL 11”:

![21.png](https://static.platzi.com/media/user_upload/21-028b8530-63f5-4bc4-b1d6-0bdac6885cfe.jpg)

Al hacer hacer doble clic sobre éste elemento (“PostgreSQL 11”) nos pedirá ingresar la clave que hemos determinado para el super usuario postgres, al igual que la consola, hasta no ingresarla correctamente no nos podremos conectar:

![22.png](https://static.platzi.com/media/user_upload/22-0e0171ab-3ae9-4798-9188-7b14181cb83b.jpg)

Ingresamos la clave. Te recomiendo seleccionar la opción “Save Password” o “Guardar Contraseña”. Si la máquina sobre la que estás trabajando es de confianza, que seas sólo tú o tu equipo quien tenga acceso a ella, de lo contrario, no guardes la contraseña para mantenerla segura.
Veremos la lista de bases de datos disponibles, la predeterminada “postgres” y la que acabamos de crear usando la consola, lo que comprueba que la base de datos y la consola funcionan correctamente.

![23.png](https://static.platzi.com/media/user_upload/23-ff23bf88-a5f8-4449-8d89-78492b9cb834.jpg)

Ahora procedemos a eliminar la base de datos recién creada para comprobar que PgAdmin está correctamente configurada y si pueda realizar cambios sobre la base de datos.

Para ello hacemos clic derecho sobre el elemento “transporte_publico” y seleccionamos la opción “Delete/Drop”. Al mensaje de confirmar hacemos clic en OK.

Con ello, si el elemento “transporte_publico” desaparece del menú de la izquierda comprobamos que PgAdmin funcionan correctamente.

## Instalación de la BD de ejemplo

Instalación de postgres en ubuntu.
`sudo apt-get install postgresql postgresql-contrib`
instalación de la interfaz gráfica.
`sudo apt-get install pgadmin3`

Iniciar la base de datos
`sudo -u postgres psql -> Indica que se está iniciando sesión con el usuario postgres.`
Cambiar la contraseña del usuario postgres.
Dentro de la base de datos activa:
`alter user postgres with password ‘<contraseña>’;` -> Las comillas en la contraseña son obligatorias.

## Creando un usuario

`sudo -i -u postgres` 

```bash
postgres@digdata-GP60-2PE:~$ psql
psql (13.3 (Ubuntu 13.3-1.pgdg18.04+1), server 10.17 (Ubuntu 10.17-0ubuntu0.18.04.1))
Type "help" for help.

postgres=# \conninfo
You are connected to database "postgres" as user "postgres" via socket in "/var/run/postgresql" at port "5432".
postgres=# \c
psql (13.3 (Ubuntu 13.3-1.pgdg18.04+1), server 10.17 (Ubuntu 10.17-0ubuntu0.18.04.1))
You are now connected to database "postgres" as user "postgres".
postgres=# \q
postgres@digdata-GP60-2PE:~$ ^C
postgres@digdata-GP60-2PE:~$ 

```

```sql
postgres@digdata-GP60-2PE:~$ createuser --interactive
Enter name of role to add: platzi
Shall the new role be a superuser? (y/n) y

```



Como requisito previo es necesario instalar la BD siguiendo este [tutorial](https://platzi.com/clases/1480-postgresql/24177-instalacion-y-configuracion-de-la-base-de-datos/) del curso de PostgreSQL.

Archivos de datos SQL: [Drive](https://drive.google.com/drive/folders/1mGQ-POrs6yZWF6-M-unnCN_ucGW31U6t?usp=sharing)

Una vez tienes instalado PostgreSQL y pgAdmin vamos a crear la estructura de datos que veremos a lo largo del curso.

Para hacerlo abre pgAdmin (normalmente está en la dirección: http://127.0.0.1:63435/browser/), y expande el panel correspondiente a tu base de datos, en mi caso la he nombrado “prueba”.
![Captura de Pantalla 2020-09-09 a la(s) 18.51.40.png](https://static.platzi.com/media/user_upload/Captura%20de%20Pantalla%202020-09-09%20a%20la%28s%29%2018.51.40-46e438cd-78ad-4dad-962c-dc0723133b6c.jpg)

En la sección esquemas da click secundario y selecciona la opción Create > Schema…
![Captura de Pantalla 2020-09-09 a la(s) 18.52.42.png](https://static.platzi.com/media/user_upload/Captura%20de%20Pantalla%202020-09-09%20a%20la%28s%29%2018.52.42-cf9c9444-3e1d-4337-aa9a-028361140cd2.jpg)

Al seleccionar la opción abrirá un cuadro de diálogo en donde debes escribir el nombre del esquema, en este caso será “platzi”. Si eliges un nombre distinto, asegúrate de seguir los ejemplos en el curso con el nombre elegido; por ejemplo si en el curso mencionamos la sentencia:

```
SELECT * FROM platzi.alumnos
```

Sustituye platzi por el nombre que elegiste.

Finalmente selecciona tu usuario de postgres en el campo Owner, esto es para que asigne todos los permisos del nuevo esquema a tu usuario.
![Captura de Pantalla 2020-09-09 a la(s) 18.53.53.png](https://static.platzi.com/media/user_upload/Captura%20de%20Pantalla%202020-09-09%20a%20la%28s%29%2018.53.53-6c5d9722-4a37-4434-9cdc-675395b404c0.jpg)

Revisa que tu esquema se haya generado de manera correcta recargando la página y expandiendo el panel Schemas en tu base de datos.
![Captura de Pantalla 2020-09-09 a la(s) 18.57.31.png](https://static.platzi.com/media/user_upload/Captura%20de%20Pantalla%202020-09-09%20a%20la%28s%29%2018.57.31-ca4cdd49-5e68-411c-8a34-15cc76551ffd.jpg)

Dirígete al menú superior y selecciona el menú Tools > Query Tool.
![Captura de Pantalla 2020-09-09 a la(s) 18.57.40.png](https://static.platzi.com/media/user_upload/Captura%20de%20Pantalla%202020-09-09%20a%20la%28s%29%2018.57.40-c8a69066-b0db-4b7f-8f07-75ed757e54ed.jpg)

Esto desplegará la herramienta en la ventana principal. Da click en el botón “Open File” ilustrado por un icono de folder abierto.
![Captura de Pantalla 2020-09-09 a la(s) 18.57.54.png](https://static.platzi.com/media/user_upload/Captura%20de%20Pantalla%202020-09-09%20a%20la%28s%29%2018.57.54-fed93911-530d-4850-9802-8893b0269db4.jpg)

Busca en tus archivos y selecciona el archivo platzi.alumnos.sql que descargaste de este curso, da click en el botón “Select”.
![Captura de Pantalla 2020-09-09 a la(s) 18.58.10.png](https://static.platzi.com/media/user_upload/Captura%20de%20Pantalla%202020-09-09%20a%20la%28s%29%2018.58.10-9b3bbcdb-18a0-4658-8ba8-b10645d209a4.jpg)

Esto abrirá el código SQL que deberás ejecutar dando click en el botón ”Execute/Refresh” con el icono play.
![Captura de Pantalla 2020-09-09 a la(s) 18.59.32.png](https://static.platzi.com/media/user_upload/Captura%20de%20Pantalla%202020-09-09%20a%20la%28s%29%2018.59.32-8a7b1fc0-2a5b-41b6-a879-e81155c1a16e.jpg)

Al terminar debes ver un aviso similar al siguiente:
![Captura de Pantalla 2020-09-09 a la(s) 19.00.18.png](https://static.platzi.com/media/user_upload/Captura%20de%20Pantalla%202020-09-09%20a%20la%28s%29%2019.00.18-48060f48-b101-41f3-890c-280878704604.jpg)

Ahora repetiremos el proceso para la tabla platzi.carreras. Dirígete nuevamente al botón “Open File” y da click en él.
![Captura de Pantalla 2020-09-09 a la(s) 19.00.45.png](https://static.platzi.com/media/user_upload/Captura%20de%20Pantalla%202020-09-09%20a%20la%28s%29%2019.00.45-c9c52b5a-3ac1-4bb9-8260-5c67c4674643.jpg)

Encuentra y selecciona el archivo platzi.carreras.sql y da click en el botón “Select”.
![Captura de Pantalla 2020-09-09 a la(s) 19.00.51.png](https://static.platzi.com/media/user_upload/Captura%20de%20Pantalla%202020-09-09%20a%20la%28s%29%2019.00.51-e30e59e5-5b2e-425f-8633-6f9e6137b2b2.jpg)

Una vez abierto el archivo corre el script dando click en el botón “Execute/Refresh”

![Captura de Pantalla 2020-09-09 a la(s) 19.00.58.png](https://static.platzi.com/media/user_upload/Captura%20de%20Pantalla%202020-09-09%20a%20la%28s%29%2019.00.58-ad70bc36-65a5-435a-8ec2-c87b8b590814.jpg)

Debes ver nuevamente un aviso como el siguiente:

![Captura de Pantalla 2020-09-09 a la(s) 19.01.45.png](https://static.platzi.com/media/user_upload/Captura%20de%20Pantalla%202020-09-09%20a%20la%28s%29%2019.01.45-d49655f4-7442-49a9-bad5-1bf86c9b6b2e.jpg)

**¡Felicidades!** Ya tienes todo listo para realizar los ejercicios y retos del curso.

Con `SELECT` se especifica que columnas queremos obtener de una tabla determinada y con `FROM` se indica de donde se va a obtener la información que se va proyectar con `SELECT`. `FROM` va después de `SELECT`

```sql
SELECT *
FROM base_de_datos.tabla
```

En la sentencia anterior el manejador de base de datos (**DBMS**) va al esquema y proyecta lo solicitado.


**Las sentencias SQL no son sensibles a minúsculas o mayúsculas pero se recomienda escribir las palabras claves en MAÝUSCULAS y el resto en minúsculas**

`JOIN` es un complemento de `FROM`.

También se puede obtener la información de una base de datos remota, es decir que el esquema de donde que queremos obtener información se encuentra en otro **DBMS**.


Para obtener información de una tabla que se encuentra remotamente se utiliza la función `dblink`, dicha función recibe dos parámetros:

1. configuración de conexión al DBMS remoto
2. consulta SQL


Ejemplo de dblink

```sql
SELECT *
FROM dblink('
	dbname=somedb
	port=5432 host=someserver
	user=someuser
	password=somepwd',
	'SELECT gid, area, parimeter,
			state, country,
			tract, blockgroup,
			block, the_geom
	FROM massgis.cens2000blocks')
	AS blockgroups
```

**Proyección** significa elegir *QUE* columnas (o expresiones) la consulta debe retornar.
**Selección** significa *CUALES SON* las columnas retornadas.

```sql
Supongamos la siguiente consulta:  

select *Columna1, Columna2, Columna3* from *table_1* where ***n=3***;
```

La **proyección** sería: *Columna1, Columna2 y Columna3* y la parte de **Selección** es **n***=3,* debido a esto es que denominamos a la clausula **SELECT** como la **proyección** y los filtros aplicados en la clausula **WHERE** como **Selección**.

La Consulta más Básica sería

```sql
SELECT * FROM Tabla1;
```

El astrisco (*) es un comodín que indica que queremos traer una proyección completa (Todos los campos o columnas existentes en la tabla)

## Alias

Un alias (.**.AS…**), es otra forma de llamar a una tabla o a una columna, y se utiliza para simplificar las sentencias SQL cuando los nombres de tablas o columnas son largos o complicados.

**SELECT** Columna1 **AS** Alias1 **FROM** Tabla1; (Para referirnos a la *Columna1*, podremos denominarla como *Alias1*)

…
.

## **Funciones de agregación**

Las funciones de agregación en SQL nos permiten efectuar operaciones sobre un conjunto de resultados, pero devolviendo un único valor agregado para todos ellos.
Es decir, nos permiten obtener medias, máximos, etc… sobre un conjunto de valores.

Las funciones de agregación básicas que soportan todos los gestores de datos son las siguientes:

- **COUNT**: devuelve el número total de filas seleccionadas por la consulta, como particularidad se puede usar *COUNT(*)* donde contará todos los registros de la tabla incluyendo nulos.
- **MIN**: devuelve el valor mínimo del campo que especifiquemos.
- **MAX**: devuelve el valor máximo del campo que especifiquemos.
- **SUM**: suma los valores del campo que especifiquemos. Sólo se puede utilizar en columnas numéricas.
- **AVG**: devuelve el valor promedio del campo que especifiquemos. Sólo se puede utilizar en columnas numéricas.
  .

## Función IF()

Función que **evalúa una sola expresión** y retorna lo que se le especifica en el caso que sea Verdadera o Falsa

```sql
IF (expresion, resultado_true, resultado_else)
```

## Función CASE()

Sirve para evaluar **una lista de condiciones** y retornar uno o múltiples posibles resultados.

Comienza con la sentencia **CASE**, luego evalua expresiones comenzando con **WHEN** y en caso que sea verdadera, devolverá el resultado especificado para esa condición luego del **THEN**…
.
La sentencia **ELSE** es *opcional* y devolverá este valor en caso que todas las condiciones **WHEN** anteriores sean Falsas.

Si todas las condiciones son falsas, y no existe la clausula ELSE, se devolverá *NULL*.

```sql
CASE 
   WHEN eval_1 THEN resultado_1
   WHEN eval_2 THEN resultado_2
      ...
   WHEN value_n THEN resultado_n
   ELSE resultado
END AS ValorResultado;
```



## PGADMIN 4



## Install for both desktop and web modes:

sudo apt install pgadmin4

# Install for desktop mode only:
sudo apt install pgadmin4-desktop

# Install for web mode only: 
sudo apt install pgadmin4-web

# Configure the webserver, if you installed pgadmin4-web:
sudo /usr/pgadmin4/bin/setup-web.sh
Alternative Distributions

Container
macOS
Python
RPM
Source Code
Windows

> Path: /var/lib/pgadmin/storage/lizandro23difo_gmail.com/

> http://127.0.0.1/pgadmin4/browser/#
>
> Username : lizandro23difo@gmail.com
>
> Password: **********33

