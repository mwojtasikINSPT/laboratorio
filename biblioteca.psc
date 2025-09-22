Algoritmo biblioteca
	
	definir credencial, credencialAdmin Como caracter
	credencialAdmin <- "1234"
	
	
	definir libros como Cadena 
	Definir resp Como Caracter
	Definir op, modulo, opLibros, i, j Como Entero 
	Definir disponible, camposLibros Como Entero
	camposLibros <- 6
	Dimension libros[200, camposLibros]
	i<- 0
	
	//Inicializo matriz de libros 
	Para i <- 0 Hasta 199 Hacer		
		Para j <- 0 Hasta 4 Hacer
			libros[i, j] <- ""
		FinPara
	FinPara	

	
	Escribir "****Bienvenido al Sistema de Gestion de Biblioteca****" 
	Repetir
		Escribir "Ingrese la clave de acceso: " 
		Leer credencial
	Hasta Que credencial == credencialAdmin
	
	//Precargo Libros para pruebas
	libros[0, 0] <- "10000"
	libros[0, 1] <- "DON QUIJOTE"
	libros[0, 2] <- "MIGUEL DE CERVANTES"
	libros[0, 3] <- "NOVELA"
	libros[0, 4] <- "1605" 
	libros[0, 5] <- "1" 
	libros[1, 0] <- "10001"
	libros[1, 1] <- "HAMLET"
	libros[1, 2] <- "WILLIAN SHAKESPEARE"
	libros[1, 3] <- "TRAGEDIA"
	libros[1, 4] <- "1603" 
	libros[1, 5] <- "1" 
	
	Repetir
		mostrarMenuPpal
		Leer modulo
		
		Segun modulo Hacer
			1:
				Repetir
					mostrarMenuLibros
					Leer opLibros
					
					Segun opLibros Hacer
						1: //Agregar Libros
							Repetir
								crearLibro(libros)
								Repetir
									Escribir "Desea agregar otro libro? (S/N)"
									Leer resp
									resp<-Mayusculas(resp)	
									si resp<>"S" y resp<>"N" Entonces
										Escribir "Entrada inv�lida. Por favor ingrese S para S� o N para No."	
										Leer resp
										resp<-Mayusculas(resp)	
									FinSi
								Hasta Que (resp = "S" o resp = "N")				
							Mientras Que (resp<>"N")	
						2: //Consultar Libros
							Repetir
								mostrarSubMenuConsultaLibros
								Leer op 
								
								Segun op Hacer
									1:
										buscarLibro(libros)
									2:
										modificarLibro(libros)
									3:	
										mostrarLibros(libros)
									4:
										registrarPrestamo(libros)
										//generar fecha de inicio y de fin 
									5:
										//validar que hayan prestamos para hacer la devolucion
										//pedir los datos del libro y del usuario
										//verificar que el fecha fin dado sea igual a la fecha de devolucion
										//si hay castigo, se deben sumar los dias atrasados y multarlo (si intenta sacar algun libro y no pasaron esos dias, que le informe que no puede)
										//sumarle 1 a los libros disponibles y restarle -1 a los disponibles
									6:	
										Escribir "Volviendo a menu anterior..."
										Esperar 1 segundos 
									De Otro Modo:
										Escribir "Eligi� una opci�n inv�lida."
								Fin Segun
								
							Hasta Que (op=6)
							
							
						3:
							Escribir "Volviendo al menu principal..."
							Esperar 1 segundo
						De Otro Modo:
							Escribir "Eligi� una opci�n inv�lida."
					Fin Segun
					
				Mientras que (opLibros<>3)
			2:
				Escribir "En proceso - Modulo Socios"
			0:
				Escribir "Saliendo del sistema..."
			De Otro Modo:
				Escribir "Opci�n inv�lida"
		Fin Segun
		
	Hasta Que (modulo==0)


	

FinAlgoritmo

//Menues para mostrar
Funcion mostrarMenuPpal
	Escribir "Elija el m�dulo al que quiere acceder (0 para Salir): "
	Escribir "1. LIBROS"
	Escribir "2. SOCIOS"
	Escribir "0. Salir"
FinFuncion

Funcion mostrarMenuLibros
	Escribir ""
	Escribir "**** MENU LIBROS ****"
	Escribir "1. Agregar libros"		
	Escribir "2. Consultar libros"
	Escribir "3. Volver al menu principal"
	Escribir "Elija la opcion: "	
FinFuncion

Funcion mostrarSubMenuConsultaLibros
	Escribir ""
	Escribir "***Sub Menu Consulta de Libros***"
	Escribir "1. Buscar Libro"
	Escribir "2. Modificar datos de libro"
	Escribir "3. Listado de Libros"
	Escribir "4. Registrar Pr�stamo"
	Escribir "5. Registrar Devoluci�n"
	Escribir "6. Volver"
	Escribir "Elija la opcion: "
FinFuncion


//Asigno posici�n a cada libro ingresado
Funcion posicion<-buscarUltimo(libros) 
    Definir i, posicion Como Entero
    i <- 0	
    Mientras i < 200 Y libros[i, 0] <> "" Hacer
        i <- i + 1
    FinMientras	
    Si i < 199 Entonces
        posicion <- i
    Sino
        posicion <- -1
    FinSi
FinFuncion


//Valido Texto
Funcion esTextoValido <- ValidarTexto(cadenaAVerificar)
	Definir i, esTextoValido Como Entero
	Definir letra Como Caracter
	esTextoValido <-  1
	//verifico que no ingrese vacio
	Si Longitud(cadenaAVerificar) = 0 Entonces
        esTextoValido <- 0        
    FinSi
	
	Para i<-0 Hasta Longitud(cadenaAVerificar)-1 Con Paso 1 Hacer
		letra <- Subcadena(cadenaAVerificar, i ,i)	
		Si (letra < "A" o letra > "Z") y (letra < "a" o letra > "z") y (letra <> "�") y (letra <> "�") y (letra <> "�") y (letra <> "�") y (letra <> "�") y (letra <> "�") y (letra <> "�") y (letra <> "�") y (letra <> "�") y (letra <> "�") y (letra <> "�") y (letra <> "�") y (letra <> " ") Entonces
		esTextoValido <- 0            	
		FinSi
	Fin Para	
FinFuncion


//Pido Texto
Funcion txt <- pedirTexto(mensaje)
	Definir input, txt como Cadena
	Definir esTextoValido Como Entero
	esTextoValido <-  0
	
	Mientras esTextoValido=0 Hacer
		Escribir Sin Saltar mensaje
		Leer input
		input<-Mayusculas(input)
		
		Si validarTexto(input)=1 Entonces
			esTextoValido <- 1
		SiNo
			Escribir "Ingrese un texto v�lido"
		FinSi
	Fin Mientras
	txt <- input
FinFuncion


//Valido N�meros
Funcion esNumero <- EsNumeroEnteroPositivo(cadenaAVerificar)
	Definir i, esNumero Como Entero
	Definir letra Como Caracter
	esNumero <-  1
	Para i <- 0 Hasta Longitud(cadenaAVerificar) -1 Hacer
		letra <- Subcadena(cadenaAVerificar,i,i) //recorro x caracter
		Si (letra > "9" o letra < "0") Entonces
			esNumero <- 0
		FinSi		
	FinPara
FinFuncion


//Pido numeros
Funcion num <- pedirNumero(mensaje)
	definir esNumero, num Como Entero
	definir input como cadena
	esNumero <- 0
	Mientras esNumero ==0 Hacer
		Escribir Sin Saltar mensaje
		leer input
		Si (EsNumeroEnteroPositivo(input)=1) Entonces
			esNumero <- 1
		SiNo
			Escribir "Ingrese un numero v�lido"
		FinSi
	FinMientras
	num <- ConvertirANumero(input)
FinFuncion


//Genero Ids - sin Repetir
Funcion idUnico <- generarId
	Definir totalGenerados, i, j, nuevoId, repetido, generados Como Entero
	Definir idUnico como Cadena
	Dimension generados[200]
	totalGenerados <- 0
	
	Repetir
		nuevoID <- Aleatorio(10000, 99999) 		
		// Verifico si ya existe
		repetido <- 0
		si totalGenerados>0
			Para j <- 1 Hasta totalGenerados
				Si generados[j] = nuevoId Entonces
					repetido <- 1
				FinSi
			FinPara
		FinSi			
	Hasta Que repetido = 0
	
	// Guardo el nuevo id
	totalGenerados <- totalGenerados + 1
	generados[totalGenerados] <- nuevoId		
	Escribir "Id generado para el nuevo libro: ", nuevoId
	
	idUnico<-ConvertirATexto(nuevoId)
FinFuncion


//Crear libro
funcion crearLibro(libros Por Referencia)
	Definir idLibro, tituloLibro, autorLibro, generoLibro, anoPublicacionLibro, opcionUsuario como caracter
	Definir confirmar, indice, numTemporal Como Entero
	confirmar <- 0
	indice <- buscarUltimo(libros)
	Mientras confirmar = 0 Hacer
		Escribir ""
		Escribir "***INGRESO DE NUEVO LIBRO***"
		idLibro<-generarId
		tituloLibro<-pedirTexto("Ingrese Nombre del libro: ")
		autorLibro<-pedirTexto("Ingrese Autor: ")
		generoLibro<-pedirTexto("Ingrese G�nero: ")
		//anoPublicacionLibro <- pedirNumero("A�o de publicacion: ")
		numTemporal<-pedirNumero("A�o de publicacion: ")
		anoPublicacionLibro <- ConvertirATexto(numTemporal)
		
		Limpiar Pantalla
		
		Escribir "***DATOS DEL NUEVO LIBRO***"
		Escribir Sin Saltar "Id del libro: "
		Escribir idLibro
		Escribir Sin Saltar "Nombre: "
		Escribir tituloLibro
		Escribir sin saltar "Autor: "
		Escribir autorLibro
		Escribir sin saltar "Genero: "
		Escribir generoLibro
		Escribir sin saltar "A�o de publicacion: "
		Escribir anoPublicacionLibro
		Escribir "Confirma ingreso? (S/N)"
		leer opcionUsuario
		si Mayusculas(opcionUsuario) == "S" Entonces
			confirmar <- 1
		FinSi
	FinMientras
	
	libros[indice, 0] <- idLibro
	libros[indice, 1] <- tituloLibro
	libros[indice, 2] <- autorLibro
	libros[indice, 3] <- generoLibro
	libros[indice, 4] <- anoPublicacionLibro 
	libros[indice, 5] <- "1" //esta disponible
FinFuncion


Funcion posicionResultado<-filtrarPorCriterio(libros, columna, filtro, resultados)
    Definir i, posicionResultado Como Entero
    i <- 0
    posicionResultado <- 0	
    Mientras i < 200 Hacer
        Si libros[i, 0] <> "" Entonces
            Si libros[i, columna] = filtro Entonces
                resultados[posicionResultado] <- i
                posicionResultado <- posicionResultado + 1
            FinSi
        FinSi
        i <- i + 1
    FinMientras	
FinFuncion


//Buscar Libros
Funcion buscarLibro(libros Por Referencia)
	Definir tituloLibro, autorLibro, generoLibro, anoPublicacionLibro como caracter
	Definir opcionUsuario, columna, resultados, i, indice, cantidad Como Entero
	Definir criterio como Cadena
	Dimension resultados[200]
	//Inicializo resultados
	Para i <- 0 Hasta 199 Hacer		
		resultados[i] <- -1
	FinPara
	Escribir ""
	Escribir "**B�SQUEDA DE LIBRO**"
	Escribir "Elija un criterio de b�squeda"
	Escribir "1. Id"
	Escribir "2. T�tulo"
	Escribir "3. Autor"
	Escribir "4. G�nero"
	Escribir "5. A�o de publicaci�n"
	Escribir "6. Volver"
	Escribir "Ingrese una opci�n (1-6): "
	Leer opcionUsuario
	
	Segun opcionUsuario Hacer
		1:
			columna<-0
			Escribir Sin Saltar "Ingrese id a buscar: "
			Leer criterio
		2:
			columna<-1
			Escribir Sin Saltar "Ingrese t�tulo a buscar: "
			Leer criterio			
			criterio<-Mayusculas(criterio)
		3:
			columna<-2
			Escribir Sin Saltar "Ingrese autor a buscar: "
			Leer criterio			
			criterio<-Mayusculas(criterio)
		4:
			columna<-3
			Escribir Sin Saltar "Ingrese g�nero a buscar: "
			Leer criterio			
			criterio<-Mayusculas(criterio)
		5:
			columna<-4
			Escribir Sin Saltar "Ingrese a�o de publicaci�n a buscar: "
			Leer criterio
		6:
			Escribir "Volviendo al men� de Libros"
		De Otro Modo:
			Escribir "Eligi� una opci�n inv�lida."
	Fin Segun
	
	
	cantidad<-filtrarPorCriterio(libros, columna, criterio, resultados)
	
	// Mostrar resultados si hay coincidencias
    Si cantidad = 0 Entonces
        Escribir "No se encontraron libros con ese criterio."
    Sino
        Para i <- 0 Hasta cantidad - 1 Hacer
            indice <- resultados[i]
            Escribir "Libro encontrado:"
			Escribir "Id: ", libros[indice, 0]
            Escribir "T�tulo: ", libros[indice, 1]
            Escribir "Autor: ", libros[indice, 2]
            Escribir "G�nero: ", libros[indice, 3]
            Escribir "A�o: ", libros[indice, 4]
            Escribir "Disponible: ", libros[indice, 5]
            Escribir ""
        FinPara
    FinSi	
FinFuncion

//Modificar Libro
Funcion modificarLibro(libros Por Referencia)
    Definir i, idBuscado, indice, confirmar Como Entero
    Definir opcionUsuario, nuevoDato, tituloLibro, autorLibro, generoLibro, anoPublicacionLibro Como Cadena
	
    // Pedir el ID del libro a modificar
	Escribir ""
	Escribir "**MODIFICACI�N DE LIBRO**"
    Escribir "Ingrese el ID del libro a modificar: "
    Leer idBuscado
	
    // Buscar el libro en la matriz
    indice <- -1
    Para i <- 0 Hasta 199
        Si libros[i,0] = ConvertirATexto(idBuscado) Entonces
            indice <- i
        FinSi
    FinPara
	
    // Verifico si se encontr� el libro
    Si indice = -1 Entonces
        Escribir "Id de Libro no encontrado."
    Sino
        // Cargar datos actuales en variables temporales
        tituloLibro <- libros[indice,1]
        autorLibro <- libros[indice,2]
        generoLibro <- libros[indice,3]
        anoPublicacionLibro <- libros[indice,4]
		
        confirmar <- 0
        Mientras confirmar = 0 Hacer
            Limpiar Pantalla
            Escribir "***DATOS ACTUALES DEL LIBRO***"
            Escribir "ID: ", libros[indice,0]
            Escribir "1. Titulo: ", tituloLibro
            Escribir "2. Autor: ", autorLibro
            Escribir "3. Genero: ", generoLibro
            Escribir "4. A�o de Publicacion: ", anoPublicacionLibro
			
            Escribir "Ingrese los nuevos datos (dejar vac�o para no cambiar):"
			
            Escribir Sin Saltar "Nuevo T�tulo: "
            Leer nuevoDato
            Si Longitud(nuevoDato) > 0 Entonces
                tituloLibro <- nuevoDato
            FinSi			
            Escribir Sin Saltar "Nuevo Autor: "
			Leer nuevoDato
            Si Longitud(nuevoDato) > 0 Entonces
                autorLibro <- nuevoDato
            FinSi			
            Escribir Sin Saltar "Nuevo G�nero: "
			Leer nuevoDato
            Si Longitud(nuevoDato) > 0 Entonces
                generoLibro <- nuevoDato
            FinSi			
            Escribir Sin Saltar "Nuevo A�o de Publicacion: "
			Leer nuevoDato
            Si Longitud(nuevoDato) > 0 Entonces
                anoPublicacionLibro <- nuevoDato
            FinSi
			
            Limpiar Pantalla
            Escribir "***DATOS DEL LIBRO MODIFICADOS***"
            Escribir "ID: ", libros[indice,0]
            Escribir "Titulo: ", tituloLibro
            Escribir "Autor: ", autorLibro
            Escribir "Genero: ", generoLibro
            Escribir "A�o de Publicacion: ", anoPublicacionLibro
			
            Escribir "Confirma los cambios? (s/n)"
            Leer opcionUsuario
            Si Mayusculas(opcionUsuario) = "S" Entonces
                confirmar <- 1
            FinSi
        FinMientras
		
        // Guardar cambios en la matriz
        libros[indice,1] <- tituloLibro
        libros[indice,2] <- autorLibro
        libros[indice,3] <- generoLibro
        libros[indice,4] <- anoPublicacionLibro
    FinSi
FinFuncion


//Mostrar libros cargados
Funcion mostrarLibros(libros Por Referencia)
	
	Definir i Como Entero
	
	Escribir "*** LISTA DE LIBROS CARGADOS ***"	
	Para i <- 0 Hasta 199   
		Si libros[i,0] <> "" Entonces
			Escribir "----------------------------------------"
			Escribir "ID: ", libros[i,0]
			Escribir "Titulo: ", libros[i,1]
			Escribir "Autor: ", libros[i,2]
			Escribir "Genero: ", libros[i,3]
			Escribir "A�o de Publicacion: ", libros[i,4]
			Escribir "Disponible: ", libros[i,5]
		FinSi
	FinPara
	
FinFuncion

//Registrar pr�stamo
Funcion registrarPrestamo(libros Por Referencia)

	Definir i, disponible, indiceLibro Como Entero
	Definir idBuscado, op Como Cadena
	disponible <- -1
	
	Escribir ""
	Escribir "REGISTRAR PR�STAMO DE LIBRO"
	Escribir Sin Saltar "Ingrese id del libro a prestar:"
	Leer idBuscado
	
	Para i <- 0 hasta 199 Con Paso 1 Hacer
		si libros[i,0] = idBuscado Entonces
			indiceLibro <- i
			si libros[i,5] = "1" Entonces
				disponible <- 1
			SiNo
				disponible <- 0
			FinSi			
		FinSi		
	FinPara
	
	Si disponible = 1 Entonces
		Escribir "El libro se encuentra Disponible para pr�stamo"
		Escribir "Desea registrar pr�stamo (S-N)?"
		Leer op
		op <- Mayusculas(op)
		//Registrar pr�stamo y Cambiar el estado
		Segun op Hacer
			"S":
				Escribir "Registrando Prestamo "
				Si indiceLibro <> -1 Entonces
					libros[indiceLibro,5] <- "0"			
				FinSi
				//Pedir datos del socio, validar - Falta ver modulo socios
				
			"N":
				Escribir "Volviendo a consultas..."
			De Otro Modo:
				Escribir "Opci�n inv�lida"
				Repetir
					Escribir "Desea registrar pr�stamo (S-N)?"
					Leer op
					op <- Mayusculas(op)
				Hasta Que (op="S" o op="N")
		Fin Segun
	Sino Si disponible = 0 Entonces
			Escribir "El libro NO se encuentra Disponible para pr�stamo"
		Sino
			Escribir "ID no encontrado"
		FinSi
	FinSi	
	//ver si puedo combinar con buscarLibros()

	
FinFuncion
