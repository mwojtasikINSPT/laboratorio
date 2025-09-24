Algoritmo socios
	
	definir credencial, credencialAdmin Como caracter
	credencialAdmin <- "1234"
	
	
	Definir resp Como Caracter
	Definir op, modulo, opSocios, i, j Como Entero 
	
	i<- 0
	
	definir socios como cadena
	Definir camposSocios Como Entero
	camposSocios <- 4 //dni, nombre, telefono, estado 
	Dimension socios[200, camposSocios]

	//Inicializo matriz de socios 
	Para i <- 0 Hasta 199 Hacer		
		Para j <- 0 Hasta camposSocios - 1 Hacer
			socios[i, j] <- ""
		FinPara
	FinPara	
	
	Escribir "****Bienvenido al Sistema de Gestion de Biblioteca****" 
	Repetir
		Escribir "Ingrese la clave de acceso: " 
		Leer credencial
	Hasta Que credencial == credencialAdmin
	
	//Precargo Socios para pruebas
	socios[0, 0] <- "87562896"
	socios[0, 1] <- "Jose Lopez"
	socios[0, 2] <- "1103160523"
	socios[0, 3] <- "HABILITADO"


	socios[1, 0] <- "45263568"
	socios[1, 1] <- "Mar Gomez"
	socios[1, 2] <- "1161176033" 
	socios[1, 3] <- "INHABILITADO" 
	
	socios[2, 0] <- "77463568"
	socios[2, 1] <- "Mar Gomez"
	socios[2, 2] <- "1101176033" 
	socios[2, 3] <- "HABILITADO"
	
	Repetir
		mostrarMenuPpal
		Leer modulo
		
		Segun modulo Hacer
			1:
				Escribir "En proceso - Módulo Libros"
				
			2: // Módulo Socios
				Repetir
					mostrarMenuSocios
					Leer opSocios
					
					Segun opSocios Hacer
						1: //Agregar Socios
							Repetir
								crearSocio(socios)
								Repetir
									Escribir "¿Desea agregar otro socio? (S/N)"
									Leer resp
									resp <- Mayusculas(resp)	
									Si resp <> "S" Y resp <> "N" Entonces
										Escribir "Entrada inválida. Por favor ingrese S para Sí o N para No."	
										Leer resp
										resp <- Mayusculas(resp)	
									FinSi
								Hasta Que (resp = "S" O resp = "N")				
							Mientras Que (resp <> "N")
							
						2: //Consultar Socios
							Repetir
								mostrarSubMenuConsultaSocios
								Leer op 
								Segun op Hacer
									1:
										buscarSocio(socios)
									2:
										modificarSocio(socios)
									3:	
										mostrarSocios(socios)
									4:	
										Escribir "Volviendo a menú anterior..."
										Esperar 1 segundos 
									De Otro Modo:
										Escribir "Eligió una opción inválida."
								Fin Segun
							Hasta Que (op = 4)
							
						3: 
							Escribir "Volviendo al menú principal..."
							Esperar 1 segundos
							
						De Otro Modo:
							Escribir "Eligió una opción inválida."
					Fin Segun
					
				Hasta Que (opSocios = 3) 
				
			0:
				Escribir "Saliendo del sistema..."
				
			De Otro Modo:
				Escribir "Opción inválida."
		Fin Segun
		
	Hasta Que (modulo = 0)

FinAlgoritmo

//Menues para mostrar
SubProceso mostrarMenuPpal
	Escribir ""
	Escribir "Elija el módulo al que quiere acceder (0 para Salir): "
	Escribir ""
	Escribir "	1. LIBROS"
	Escribir "	2. SOCIOS"
	Escribir "	0. Salir"
	Escribir ""
FinSubProceso

SubProceso mostrarMenuSocios
	Escribir ""
	Escribir "**** MENU SOCIOS ****"
	Escribir "1. Agregar socio"		
	Escribir "2. Consultar socios"
	Escribir "3. Volver al menu principal"
	Escribir "Elija la opcion: "	
FinSubProceso

SubProceso  mostrarSubMenuConsultaSocios
	Escribir ""
	Escribir "***Sub Menu Consulta de Socios***"
	Escribir "1. Buscar Socio"
	Escribir "2. Modificar datos del socio"
	Escribir "3. Listado de Socios"
	Escribir "4. Volver"
	Escribir "Elija la opcion: "
FinSubProceso

//Asigno posición a cada socios ingresado
Funcion posicion<-buscarUltimo(socios) 
    Definir i, posicion Como Entero
    i <- 0	
    Mientras i < 200 Y socios[i, 0] <> "" Hacer
        i <- i + 1
    FinMientras	
    Si i < 199 Entonces
        posicion <- i
    Sino
        posicion <- -1
    FinSi
FinFuncion


//Valido Texto
Funcion esTextoValido <- validarTexto(cadenaAVerificar)
	Definir i, esTextoValido Como Entero
	Definir letra Como Caracter
	esTextoValido <-  1
	//verifico que no ingrese vacio
	Si Longitud(cadenaAVerificar) = 0 Entonces
        esTextoValido <- 0        
    FinSi
	
	Para i<-0 Hasta Longitud(cadenaAVerificar)-1 Con Paso 1 Hacer
		letra <- Subcadena(cadenaAVerificar, i ,i)	
		Si (letra < "A" o letra > "Z") y (letra < "a" o letra > "z") y (letra <> "á") y (letra <> "é") y (letra <> "í") y (letra <> "ó") y (letra <> "ú") y (letra <> "Á") y (letra <> "É") y (letra <> "Í") y (letra <> "Ó") y (letra <> "Ú") y (letra <> "ñ") y (letra <> "Ñ") y (letra <> " ") Entonces
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
			Escribir "Ingrese un texto válido"
		FinSi
	Fin Mientras
	txt <- input
FinFuncion


//Valido Números
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
			Escribir "Ingrese un numero válido"
		FinSi
	FinMientras
	num <- ConvertirANumero(input)
FinFuncion

// Pido un número pero lo devuelvo como texto
Funcion numTexto <- pedirNumeroComoTexto(mensaje)
    Definir numero Como Entero
    Definir numTexto Como Cadena
    numero <- pedirNumero(mensaje) // ya validado como número
    numTexto <- ConvertirATexto(numero)
FinFuncion



//Crear socio
Funcion crearSocio(socios Por Referencia)
	Definir opcionUsuario, dniSocio, nombreSocio, telSocio, estadoSocio como caracter
	Definir confirmar, indice, numTemporal Como Entero
	confirmar <- 0
	indice <- buscarUltimo(socios) 
	Mientras confirmar = 0 Hacer
		Escribir ""
		Escribir "***INGRESO DE NUEVO SOCIO***"
		dniSocio <- pedirNumeroComoTexto("Ingrese DNI del socio: ")
		nombreSocio<-pedirTexto("Ingrese Nombre y Apellido del socio: ")
		telSocio <- pedirNumeroComoTexto("Ingrese el teléfono: ")
		Repetir
			estadoSocio<-pedirTexto("Ingrese el Estado (H = HABILITADO / I = INHABILITADO): ")
			estadoSocio <- Mayusculas(estadoSocio)
		Hasta Que (estadoSocio = "H" O estadoSocio = "I")
		Si estadoSocio = "H" Entonces
			estadoSocio <- "HABILITADO"
		SiNo
			estadoSocio <- "INHABILITADO"
		FinSi
		Limpiar Pantalla
		
		Escribir "***DATOS DEL NUEVO SOCIO***"
		Escribir Sin Saltar "DNI del socio: "
		Escribir dniSocio
		Escribir Sin Saltar "Nombre y Apellido: "
		Escribir nombreSocio
		Escribir sin saltar "Telefono: "
		Escribir telSocio
		Escribir sin saltar "Estado: "
		Escribir estadoSocio

		Escribir "Confirma ingreso? (S/N)"
		leer opcionUsuario
		si Mayusculas(opcionUsuario) == "S" Entonces
			confirmar <- 1
		FinSi
	FinMientras
	
	socios[indice, 0] <- dniSocio
	socios[indice, 1] <- nombreSocio
	socios[indice, 2] <- telSocio
	socios[indice, 3] <- estadoSocio
FinFuncion


//Cuenta coincidencias segun filtro
Funcion cantResultados<-filtrarPorCriterio(socios, columna, filtro, resultados)
    Definir i, cantResultados Como Entero
    i <- 0
    cantResultados <- 0	
    Mientras i < 200 Hacer
        Si socios[i, 0] <> "" Entonces
            Si socios[i, columna] = filtro Entonces
                resultados[cantResultados] <- i
                cantResultados <- cantResultados + 1
            FinSi
        FinSi
        i <- i + 1
    FinMientras	
FinFuncion


//Buscar Socio
Funcion buscarSocio(socios Por Referencia)
	Definir opcionUsuario, columna, resultados, i, indice, cantidad Como Entero
	Definir criterio como Cadena
	Dimension resultados[200]
	//Inicializo resultados
	Para i <- 0 Hasta 199 Hacer		
		resultados[i] <- -1
	FinPara
	Escribir ""
	Escribir "**BÚSQUEDA DE SOCIO**"
	Escribir "Elija un criterio de búsqueda"
	Escribir "1. DNI"
	Escribir "2. Estado:"
	Escribir "3. Volver"
	Escribir "Ingrese una opción (1-3): "
	Leer opcionUsuario
	
	Segun opcionUsuario Hacer
		1:
			columna<-0
			criterio <- pedirNumeroComoTexto("Ingrese DNI a buscar: ")
		2:
			columna <- 3
			Repetir
				Escribir "Ingrese Estado a buscar (H = HABILITADO / I = INHABILITADO): "
				Leer criterio
				criterio <- Mayusculas(criterio)
			Hasta Que (criterio = "H" O criterio = "I")
			
			Si criterio = "H" Entonces
				criterio <- "HABILITADO"
			SiNo
				criterio <- "INHABILITADO"
			FinSi
		3:
			Escribir "Volviendo al menú de Socios"
		De Otro Modo:
			Escribir "Eligió una opción inválida."
	Fin Segun
	
	cantidad<-filtrarPorCriterio(socios, columna, criterio, resultados)	
	// Mostrar resultados si hay coincidencias
    Si cantidad = 0 Entonces
        Escribir "No se encontraron socios con ese criterio."
    Sino
        Para i <- 0 Hasta cantidad - 1 Hacer
            indice <- resultados[i]
            Escribir "Socio encontrado:"
			Escribir "DNI: ", socios[indice, 0]
            Escribir "Nombre y apellido: ", socios[indice, 1]
            Escribir "Telefono: ", socios[indice, 2]
            Escribir "Estado: ", socios[indice, 3]
            Escribir ""
        FinPara
    FinSi	
FinFuncion

//Modificar Socio
Funcion modificarSocio(socios Por Referencia)
    Definir i, indice, confirmar Como Entero
    Definir opcionUsuario, nuevoDato, nombreSocio,telSocio,estadoSocio,idBuscado Como Cadena
	
    // Pedir el dni del socio a modificar
	Escribir ""
	Escribir "**MODIFICACIÓN DE SOCIO**"
    idBuscado <- pedirNumeroComoTexto("Ingrese el DNI del socio a modificar: ")
	
    // Buscar el socio en la matriz
    indice <- -1
    Para i <- 0 Hasta 199
        Si socios[i,0] = idBuscado Entonces
            indice <- i
        FinSi
    FinPara
	
    // Verifico si se encontró el socio
    Si indice = -1 Entonces
        Escribir "DNI del socio no encontrado."
    Sino
        // Cargar datos actuales en variables temporales
        nombreSocio<- socios[indice,1]
        telSocio <- socios[indice,2]
        estadoSocio <- socios[indice,3]
		
        confirmar <- 0
        Mientras confirmar = 0 Hacer
            Limpiar Pantalla
            Escribir "***DATOS ACTUALES DEL SOCIO***"
            Escribir "DNI: ", socios[indice,0]
            Escribir "1. Nombre y apellido: ", nombreSocio
            Escribir "2. Telefono: ", telSocio
            Escribir "3. Estado: ", estadoSocio
            Escribir "Ingrese los nuevos datos (dejar vacío para no cambiar):"
			
            Escribir Sin Saltar "Nuevo Nombre y apellido: "
            Leer nuevoDato
            Si Longitud(nuevoDato) > 0 Entonces
                nombreSocio <- nuevoDato
            FinSi			
            Escribir Sin Saltar "Nuevo Telefono: "
			Leer nuevoDato
            Si Longitud(nuevoDato) > 0 Entonces
                telSocio <- nuevoDato
            FinSi			
            Escribir Sin Saltar "Nuevo Estado: "
			Leer nuevoDato
            Si Longitud(nuevoDato) > 0 Entonces
                estadoSocio <- nuevoDato
            FinSi			
			
            Limpiar Pantalla
            Escribir "***DATOS DEL SOCIO MODIFICADOS***"
            Escribir "DNI: ", socios[indice,0]
            Escribir "1. Nombre y apellido: ", nombreSocio
            Escribir "2. Telefono: ", telSocio
            Escribir "3. Estado: ", estadoSocio
			
            Escribir "Confirma los cambios? (s/n)"
            Leer opcionUsuario
            Si Mayusculas(opcionUsuario) = "S" Entonces
                confirmar <- 1
            FinSi
        FinMientras
		
        // Guardar cambios en la matriz
        socios[indice,1] <- nombreSocio
        socios[indice,2] <- telSocio
        socios[indice,3] <- estadoSocio
    FinSi
FinFuncion


//Mostrar socios cargados
Funcion mostrarSocios(socios Por Referencia)
	Definir i Como Entero
	Escribir "*** LISTA DE SOCIOS CARGADOS ***"	
	Para i <- 0 Hasta 199   
		Si socios[i,0] <> "" Entonces
			Escribir "----------------------------------------"
			Escribir "DNI: ", socios[i,0]
			Escribir "Nombre y apellido: ", socios[i,1]
			Escribir "Telefono: ", socios[i,2]
			Escribir "Estado: ", socios[i,3]
		FinSi
	FinPara	
FinFuncion