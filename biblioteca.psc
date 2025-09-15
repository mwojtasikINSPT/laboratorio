Algoritmo biblioteca
	
	definir credencial, credencialAdmin Como caracter
	credencialAdmin <- "1234"
	
	//Variables de Libros
	definir nombre, editorial, autor, anoPublicacion, libros como Cadena
	Definir  resp Como Caracter
	Definir op, modulo, opLibros, idLibro, stockLibro, i, j Como Entero
	Definir disponible, camposLibros Como Entero
	camposLibros <- 5
	Dimension libros[200, camposLibros]
	i<- 0
	
	//Inicializo matriz de libros
	Para i <- 0 Hasta 199 Hacer		
		Para j <- 0 Hasta 4 Hacer
			libros[i, j] <- ""
		FinPara
	FinPara

	
	Escribir "***Bienvenido al Sistema de Gestion de Biblioteca***" 
	Repetir
		Escribir "Ingrese la clave de acceso: " 
		Leer credencial
	Hasta Que credencial == credencialAdmin
	
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
									Escribir "Desea agregar otro libro? (S - N)"
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
							Escribir "1. Buscar Libro"
							Escribir "2. Modificar datos"
							Escribir "3. Prestamo"
							Escribir "4: Devoluci�n"
							Escribir "Elija la opcion (1 - 4): "
							Leer op 
							Segun op Hacer
								1:
									buscarLibro(libros)
								2:
									//modificar los datos que quiera (menos idLibro)
								3:
									//validar que hayan disponibles para hacer el prestamo
									//pedir los datos del libro y del usuario
									//generar fecha de inicio y de fin 
									//sumarle 1 a los libros prestados y restarle -1 a los disponibles
								4:
									//validar que hayan prestamos para hacer la devolucion
									//pedir los datos del libro y del usuario
									//verificar que el fecha fin dado sea igual a la fecha de devolucion
									//si hay castigo, se deben sumar los dias atrasados y multarlo (si intenta sacar algun libro y no pasaron esos dias, que le informe que no puede)
									//sumarle 1 a los libros disponibles y restarle -1 a los disponibles
									
								De Otro Modo:
									Escribir "Eligi� una opci�n inv�lida."
							Fin Segun
						3:
							Escribir "Volviendo al menu principal..."
							Esperar 1 segundo
						De Otro Modo:
							Escribir "Eligi� una opci�n inv�lida."
					Fin Segun
					
					
				Mientras que (opLibros<>3)
			2:
				Escribir "En proceso"
			0:
				Escribir "Saliendo del sistema..."
			De Otro Modo:
				Escribir "Opci�n inv�lida"
		Fin Segun
		
	Hasta Que (modulo==0)


	

FinAlgoritmo

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



Funcion posicion<-buscarUltimo(libros) //asigna posicion a cada libro ingresado
    Definir i, posicion Como Entero
    i <- 0
	
    Mientras i < 199 Y libros[i, 0] <> "" Hacer
        i <- i + 1
    FinMientras	
    Si i < 199 Entonces
        posicion <- i
    Sino
        posicion <- -1
    FinSi
FinFuncion

//Valido A�o de publicacion
Funcion esNumero <- EsNumeroEnteroPositivo(cadenaAVerificar)
	Definir i, esNumero Como Entero
	Definir letra Como Caracter
	esNumero <-  1
	Para i <- 0 Hasta Longitud(cadenaAVerificar) -1 Hacer
		letra <- Subcadena(cadenaAVerificar,i,i)
		Si (letra > "9" o letra < "0") Entonces
			esNumero <- 0
		FinSi		
	FinPara
FinFuncion


Funcion variable <- pedirNumero(titulo)
	definir esNumero Como Entero
	definir input como cadena
	esNumero <- 0
	Mientras esNumero ==0 Hacer
		Escribir Sin Saltar titulo
		leer input
		si(EsNumeroEnteroPositivo(input) <> 1) Entonces
			Escribir "Ingrese un numero v�lido"
		sino 
			esNumero <- 1
		FinSi
	FinMientras
FinFuncion


//Crear libro
funcion crearLibro(libros Por Referencia)
	Definir tituloLibro, autorLibro, generoLibro, anoPublicacionLibro, opcionUsuario como caracter
	definir confirmar, indice Como Entero
	confirmar <- 0
	indice <- buscarUltimo(libros)
	Mientras confirmar = 0 Hacer
		Escribir Sin Saltar "Ingrese Nombre del libro: "
		leer tituloLibro
		Escribir sin saltar "Ingrese Autor: "
		leer autorLibro
		Escribir sin saltar "Ingrese Genero: "
		leer generoLibro
		anoPublicacionLibro <- pedirNumero("A�o de publicacion: ")
		
		Limpiar Pantalla
		
		Escribir "Datos ingresados"
		Escribir Sin Saltar "Nombre del libro: "
		Escribir  tituloLibro
		Escribir sin saltar "Autor: "
		Escribir autorLibro
		Escribir sin saltar "Genero: "
		Escribir generoLibro
		Escribir sin saltar "A�o de publicacion: "
		Escribir anoPublicacionLibro
		Escribir "Confirma ingreso? (s/n)"
		leer opcionUsuario
		si Mayusculas(opcionUsuario) == "S" Entonces
			confirmar <- 1
		FinSi
	FinMientras
	
	//falta ver ID libro
	libros[indice, 0] <- tituloLibro
	libros[indice, 1] <- autorLibro
	libros[indice, 2] <- generoLibro
	libros[indice, 3] <- anoPublicacionLibro 
	libros[indice, 4] <- "1" //esta disponible
FinFuncion


Funcion posResul<-filtrarPorCriterio(libros, columna, filtro, resultados)
    Definir i, posResul Como Entero
    i <- 0
    posResul <- 0	
    Mientras i < 200 Hacer
        Si libros[i, 0] <> "" Entonces
            Si libros[i, columna] = filtro Entonces
                resultados[posResul] <- i
                posResul <- posResul + 1
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
	
	Escribir "Elija un criterio de b�squeda"
	Escribir "1. T�tulo"
	Escribir "2. Autor"
	Escribir "3. G�nero"
	Escribir "4. A�o de publicaci�n"
	Escribir "5. Volver"
	Escribir "Ingrese una opci�n (1-5): "
	Leer opcionUsuario
	
	Segun opcionUsuario Hacer
		1:
			columna<-0
			Escribir Sin Saltar "Ingrese t�tulo a buscar: "
			Leer criterio
		2:
			columna<-1
			Escribir Sin Saltar "Ingrese autor a buscar: "
			Leer criterio
		3:
			columna<-2
			Escribir Sin Saltar "Ingrese g�nero a buscar: "
			Leer criterio
		4:
			columna<-3
			Escribir Sin Saltar "Ingrese a�o de publicaci�n a buscar: "
			Leer criterio			
		5:
			Escribir "Volviendo al men� de Libros"
		De Otro Modo:
			Escribir "Eligi� una opci�n inv�lida."
	Fin Segun
	
	
	cantidad<-filtrarPorCriterio(libros, columna, criterio, resultados)
	
	
	// Mostrar resultados solo si hay coincidencias
    Si cantidad = 0 Entonces
        Escribir "No se encontraron libros con ese criterio."
    Sino
        Para i <- 0 Hasta cantidad - 1 Hacer
            indice <- resultados[i]
            Escribir "Libro encontrado:"
            Escribir "T�tulo: ", libros[indice, 0]
            Escribir "Autor: ", libros[indice, 1]
            Escribir "G�nero: ", libros[indice, 2]
            Escribir "A�o: ", libros[indice, 3]
            Escribir "Disponible: ", libros[indice, 4]
            Escribir ""
        FinPara
    FinSi

	
FinFuncion



