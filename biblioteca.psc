Algoritmo biblioteca
	
	definir credencial, credencialAdmin Como caracter
	credencialAdmin <- "1234"
	
	Definir libros, socios, prestamos, bibliotecarios como Cadena 
	Definir resp Como Caracter
	Definir op, modulo, opLibros, opSocios, opAcceso, i, j, l, m, n, c Como Entero 
	
	//VARIABLES PRESTAMOS
	Definir cantPrestamos, camposPrestamos Como Entero
	
	//VARIABLES SOCIOS
	Definir cantSocios, camposSocios Como Entero
	
	//VARIABLES LIBROS
	Definir disponible, cantLibros, camposLibros Como Entero
	
	//VARIABLES BIBLIOTECARIOS
	Definir cantBibliotecarios, camposBibliotecarios, intentos, accesoValido Como Entero 
	Definir nombreIngresado, claveIngresada Como CAdena
    intentos <- 0
	accesoValido <- 0
	
	//VARIABLES ADMINISTRADORES
	Definir administradores Como Cadena
    Definir cantAdministradores, camposAdministradores Como Entero
    
	
	//MATRICES
	cantLibros <- 200
	camposLibros <- 9 //id, titulo, autor, genero, anio, disponible, fecha devolucion, stock, ejemplaresPrestados
	Dimension libros[cantLibros, camposLibros]
	
	cantSocios <- 200
	camposSocios <- 5 //dni, nombre, telefono, estado, diasPenalizacion
	Dimension socios[cantSocios, camposSocios]
	
	cantPrestamos <- 200
	camposPrestamos  <- 4 // dniSocio, idLibro, fechaPrestamo, fechaFin 
	Dimension prestamos[cantPrestamos, camposPrestamos] 
	
	camposBibliotecarios <- 2 //nombreBibliotecario, claveBibliotecario
	cantBibliotecarios <- 50
    Dimension bibliotecarios[cantBibliotecarios, camposBibliotecarios] 
	
	cantAdministradores <- 10
	camposAdministradores <- 2 //NombreAdmin, clave
    Dimension administradores[cantAdministradores, camposAdministradores]
	i<- 0
	
	//Inicializo matriz de libros 
	Para i <- 0 Hasta cantLibros-1 Hacer		
		Para j <- 0 Hasta camposLibros - 1 Hacer
			libros[i, j] <- ""
		FinPara
	FinPara	
	
	//Inicializo matriz de socios 
	Para l <- 0 Hasta cantSocios-1 Hacer		
		Para m <- 0 Hasta camposSocios - 1 Hacer
			socios[l, m] <- ""
		FinPara
	FinPara
	
	//Inicializo matriz de prestamos 
	Para n <- 0 Hasta 199 Hacer		
		Para c <- 0 Hasta camposPrestamos - 1 Hacer
			prestamos[n, c] <- ""
		FinPara
	FinPara
	
	// Inicializo matriz de bibliotecarios
    Para i <- 0 Hasta cantBibliotecarios-1 Hacer
		Para j <- 0 Hasta camposBibliotecarios - 1 Hacer
			bibliotecarios[i, j] <- ""
		FinPara
    FinPara
	
	//Inicializo matriz de admins 
	Para i <- 0 Hasta cantAdministradores-1 Hacer		
		Para j <- 0 Hasta camposAdministradores - 1 Hacer
			administradores[i, j] <- ""
		FinPara
	FinPara	
    
	//Precargo Libros para pruebas
	libros[0, 0] <- "10000"
	libros[0, 1] <- "DON QUIJOTE"
	libros[0, 2] <- "MIGUEL DE CERVANTES"
	libros[0, 3] <- "NOVELA"
	libros[0, 4] <- "1605" 
	libros[0, 5] <- "1" 
	libros[0, 7] <- "2" 
	
	libros[1, 0] <- "10001"
	libros[1, 1] <- "HAMLET"
	libros[1, 2] <- "WILLIAM SHAKESPEARE"
	libros[1, 3] <- "TRAGEDIA"
	libros[1, 4] <- "1603"
	libros[1, 5] <- "1"
	libros[1, 7] <- "1"
	
	libros[2, 0] <- "10002"
	libros[2, 1] <- "CIEN AÑOS DE SOLEDAD"
	libros[2, 2] <- "GABRIEL GARCÍA MÁRQUEZ"
	libros[2, 3] <- "NOVELA"
	libros[2, 4] <- "1967"
	libros[2, 5] <- "1"
	libros[2, 7] <- "2"
	
	libros[3, 0] <- "10003"
	libros[3, 1] <- "1984"
	libros[3, 2] <- "GEORGE ORWELL"
	libros[3, 3] <- "DISTOPÍA"
	libros[3, 4] <- "1949"
	libros[3, 5] <- "1"
	libros[3, 7] <- "3"
	
	libros[4, 0] <- "10004"
	libros[4, 1] <- "EL PRINCIPITO"
	libros[4, 2] <- "ANTOINE DE SAINT-EXUPÉRY"
	libros[4, 3] <- "FÁBULA"
	libros[4, 4] <- "1943"
	libros[4, 5] <- "0"
	libros[4, 7] <- "0"
	
	libros[5, 0] <- "10005"
	libros[5, 1] <- "DON QUIJOTE DE LA MANCHA"
	libros[5, 2] <- "MIGUEL DE CERVANTES"
	libros[5, 3] <- "NOVELA"
	libros[5, 4] <- "1605"
	libros[5, 5] <- "1"
	libros[5, 7] <- "2"
	
	libros[6, 0] <- "10006"
	libros[6, 1] <- "LA ODISEA"
	libros[6, 2] <- "HOMERO"
	libros[6, 3] <- "ÉPICA"
	libros[6, 4] <- "800"
	libros[6, 5] <- "1"
	libros[6, 7] <- "3"
	
	libros[7, 0] <- "10007"
	libros[7, 1] <- "FLORES PARA ALGERNON"
	libros[7, 2] <- "DANIEL KEYES"
	libros[7, 3] <- "CIENCIA FICCIÓN"
	libros[7, 4] <- "1966"
	libros[7, 5] <- "1"
	libros[7, 7] <- "2"
	
	libros[8, 0] <- "10008"
	libros[8, 1] <- "RAYUELA"
	libros[8, 2] <- "JULIO CORTÁZAR"
	libros[8, 3] <- "NOVELA"
	libros[8, 4] <- "1963"
	libros[8, 5] <- "0"
	libros[8, 7] <- "0"
	
	libros[9, 0] <- "10009"
	libros[9, 1] <- "LA DIVINA COMEDIA"
	libros[9, 2] <- "DANTE ALIGHIERI"
	libros[9, 3] <- "POESÍA"
	libros[9, 4] <- "1320"
	libros[9, 5] <- "1"
	libros[9, 7] <- "3"
	
	libros[10, 0] <- "10010"
	libros[10, 1] <- "FRANKENSTEIN"
	libros[10, 2] <- "MARY SHELLEY"
	libros[10, 3] <- "TERROR"
	libros[10, 4] <- "1818"
	libros[10, 5] <- "1"
	libros[10, 7] <- "2"
	
	libros[11, 0] <- "10011"
	libros[11, 1] <- "CRIMEN Y CASTIGO"
	libros[11, 2] <- "FIODOR DOSTOYEVSKI"
	libros[11, 3] <- "NOVELA"
	libros[11, 4] <- "1866"
	libros[11, 5] <- "0"
	libros[11, 7] <- "0"
	
	libros[12, 0] <- "10012"
	libros[12, 1] <- "MOBY DICK"
	libros[12, 2] <- "HERMAN MELVILLE"
	libros[12, 3] <- "AVENTURA"
	libros[12, 4] <- "1851"
	libros[12, 5] <- "1"
	libros[12, 7] <- "3"
	
	libros[13, 0] <- "10013"
	libros[13, 1] <- "DRÁCULA"
	libros[13, 2] <- "BRAM STOKER"
	libros[13, 3] <- "TERROR"
	libros[13, 4] <- "1897"
	libros[13, 5] <- "1"
	libros[13, 7] <- "2"
	
	libros[14, 0] <- "10014"
	libros[14, 1] <- "FAHRENHEIT 451"
	libros[14, 2] <- "RAY BRADBURY"
	libros[14, 3] <- "CIENCIA FICCIÓN"
	libros[14, 4] <- "1953"
	libros[14, 5] <- "0"
	libros[14, 7] <- "0"
	
	libros[15, 0] <- "10015"
	libros[15, 1] <- "EL NOMBRE DE LA ROSA"
	libros[15, 2] <- "UMBERTO ECO"
	libros[15, 3] <- "NOVELA HISTÓRICA"
	libros[15, 4] <- "1980"
	libros[15, 5] <- "1"
	libros[15, 7] <- "3"
	
	libros[16, 0] <- "10016"
	libros[16, 1] <- "LOS MISERABLES"
	libros[16, 2] <- "VICTOR HUGO"
	libros[16, 3] <- "NOVELA"
	libros[16, 4] <- "1862"
	libros[16, 5] <- "1"
	libros[16, 7] <- "2"
	
	libros[17, 0] <- "10017"
	libros[17, 1] <- "LA METAMORFOSIS"
	libros[17, 2] <- "FRANZ KAFKA"
	libros[17, 3] <- "FICCIÓN"
	libros[17, 4] <- "1915"
	libros[17, 5] <- "1"
	libros[17, 7] <- "1"
	
	libros[18, 0] <- "10018"
	libros[18, 1] <- "EL PERFUME"
	libros[18, 2] <- "PATRICK SÜSKIND"
	libros[18, 3] <- "NOVELA"
	libros[18, 4] <- "1985"
	libros[18, 5] <- "1"
	libros[18, 7] <- "2"
	
	libros[19, 0] <- "10019"
	libros[19, 1] <- "REBELIÓN EN LA GRANJA"
	libros[19, 2] <- "GEORGE ORWELL"
	libros[19, 3] <- "SATIRA POLÍTICA"
	libros[19, 4] <- "1945"
	libros[19, 5] <- "1"
	libros[19, 7] <- "3"
	
	libros[20, 0] <- "10020"
	libros[20, 1] <- "EL HOBBIT"
	libros[20, 2] <- "J. R. R. TOLKIEN"
	libros[20, 3] <- "FANTASÍA"
	libros[20, 4] <- "1937"
	libros[20, 5] <- "0"
	libros[20, 7] <- "0"

	
	//Precargo Socios para pruebas
	socios[0, 0] <- "87562896"
	socios[0, 1] <- "JOSE LOPEZ"
	socios[0, 2] <- "1103160523"
	socios[0, 3] <- "MULTADO"
	socios[0, 4] <- "6"	
	
	socios[1, 0] <- "45263568"
	socios[1, 1] <- "MAR GOMEZ"
	socios[1, 2] <- "1161176033" 
	socios[1, 3] <- "INHABILITADO" 
	socios[1, 4] <- ""	
	
	socios[2, 0] <- "77463568"
	socios[2, 1] <- "MARTIN PIX"
	socios[2, 2] <- "1101176033" 
	socios[2, 3] <- "HABILITADO"
	socios[2, 4] <- ""
	
	socios[3, 0] <- "07062019"
	socios[3, 1] <- "COPITO WOJTASIK"
	socios[3, 2] <- "1141686306" 
	socios[3, 3] <- "HABILITADO"
	socios[3, 4] <- ""
	
	socios[4, 0] <- "23122019"
	socios[4, 1] <- "TAMBOR MENDEZ"
	socios[4, 2] <- "1139556061" 
	socios[4, 3] <- "HABILITADO"
	socios[4, 4] <- ""
	
	socios[5, 0] <- "26091984"
	socios[5, 1] <- "EMA ANCANS"
	socios[5, 2] <- "1163697899" 
	socios[5, 3] <- "HABILITADO"
	socios[5, 4] <- ""
	
	socios[5, 0] <- "13051985"
	socios[5, 1] <- "TOTA BOLLA"
	socios[5, 2] <- "1165218111" 
	socios[5, 3] <- "HABILITADO"
	socios[5, 4] <- ""
	
	// Precargo bibliotecarios para pruebas
    bibliotecarios[0, 0] <- "GUADIX"
    bibliotecarios[0, 1] <- "5678"
	
	bibliotecarios[1, 0] <- "FRANCO"
    bibliotecarios[1, 1] <- "5678"
	
	bibliotecarios[2, 0] <- "MARCE"
    bibliotecarios[2, 1] <- "5678"
	
	//Precargo Administradores para pruebas
	administradores[0, 0] <- "MARCE"
    administradores[0, 1] <- "1234"
	
	administradores[1, 0] <- "GUADIX"
    administradores[1, 1] <- "1234"
	
	administradores[2, 0] <- "FRANCO"
    administradores[2, 1] <- "1234"
	
	Escribir "****Bienvenido al Sistema de Gestión de Biblioteca****" 	
	
	//Acceso diferenciado por tipo de usuario: Admin, Bibliotecario, Socio
	Repetir
		mostrarMenuAcceso
		Leer opAcceso
		
		Segun opAcceso Hacer
			1:	//Acceso Admin	
				//mostrarMenuPpalAdmin
				administrador(bibliotecarios, cantBibliotecarios, administradores, cantAdministradores) 		
				
			2:  //Acceso Bibliotecario		
				Mientras intentos < 3 Y accesoValido = 0 Hacer
				Escribir "*** ACCESO BIBLIOTECARIO ***"
				Escribir Sin Saltar "Indique su nombre: "
				Leer nombreIngresado
				nombreIngresado <- Mayusculas(nombreIngresado)
				Escribir Sin Saltar "Ingrese su clave: "
				Leer claveIngresada		
				Escribir "Intento ", intentos + 1, " de 3"
				
				Si validarAccesoBibliotecario(nombreIngresado, claveIngresada, bibliotecarios, cantBibliotecarios) Entonces
					Escribir "Acceso concedido. Bienvenido ", nombreIngresado
					accesoValido <- 1
					Esperar 1 Segundos
					Limpiar Pantalla
					//sigue con lo que hace el biblio 
				Sino
					Escribir "Nombre o clave incorrectos."
					intentos <- intentos + 1
					Esperar 1 Segundos
					Limpiar Pantalla
				FinSi
			FinMientras
			
			Si accesoValido = 0 Entonces
				Escribir "Demasiados intentos fallidos. Volviendo al menú principal..."
				Esperar 2 Segundos
				Limpiar Pantalla
			FinSi
			
			//Menu Bibliotecario				
			Repetir
				mostrarMenuPpalBibliotecario
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
												Escribir "Entrada inválida. Por favor ingrese S para Sí o N para No."	
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
												buscarLibro(libros, cantLibros)
											2:
												modificarLibro(libros, cantLibros)
											3:	
												Limpiar Pantalla
												mostrarLibros(libros, cantLibros)
											4:
												registrarPrestamo(libros, socios, prestamos, cantLibros, cantSocios)		
											5:	
												mostrarPrestamos(prestamos, cantPrestamos)
											6:
												registrarDevolucion(libros, socios, prestamos, cantLibros, cantSocios)
												Escribir ""
											7:
												Escribir "Volviendo a menu anterior..."
												Esperar 1 segundos 
												Limpiar Pantalla
											De Otro Modo:
												Escribir "Eligió una opción inválida."
										Fin Segun
									Hasta Que (op==7)
								3:
									Escribir "Volviendo al menu principal..."
									Esperar 1 segundo
									Limpiar Pantalla
								De Otro Modo:
									Escribir "Eligió una opción inválida."
							Fin Segun
							
						Mientras que (opLibros<>3)
					2:
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
												buscarSocio(socios, cantSocios)
											2:
												modificarSocio(socios, cantSocios)
											3:	
												Limpiar Pantalla
												mostrarSocios(socios, cantSocios)
											4:	
												Escribir "Volviendo a menú anterior..."
												Esperar 1 segundos 
												Limpiar Pantalla
											De Otro Modo:
												Escribir "Eligió una opción inválida."
										Fin Segun
									Hasta Que (op = 4)
									
								3: 
									Escribir "Volviendo al menú principal..."
									Esperar 1 segundos
									Limpiar Pantalla
									
								De Otro Modo:
									Escribir "Eligió una opción inválida."
							Fin Segun
							
						Hasta Que (opSocios = 3) 
					3:
						Escribir "Volviendo a Menu de Usuarios..."
						Esperar 1 Segundos
						Limpiar Pantalla
					De Otro Modo:
						Escribir "Eligió una opción inválida."
				Fin Segun
			Hasta Que (modulo==3)
			
		3:
			//Acceso Socio -  HAY Q HACER
			Escribir "Acceso socios (en proceso...)"
		0:
			Escribir "Saliendo del Sistema..."
			Esperar 1 segundo
		De Otro Modo:
			Escribir "Eligió una opción inválida."
	Fin Segun
	
	Hasta Que opAcceso == 0
	
FinAlgoritmo

//*******************************************ADMINS*******************************************************
Funcion esValido <- validarAccesoAdministrador(nombreIngresado, claveIngresada, administradores, cantAdministradores)
    Definir esValido Como Logico
    Definir i Como Entero
    esValido <- Falso
    
    Para i <- 0 Hasta cantAdministradores-1 Hacer
        Si administradores[i, 0] = nombreIngresado Y administradores[i, 1] = claveIngresada Entonces
            esValido <- Verdadero
            i <- cantAdministradores 
        FinSi
    FinPara
FinFuncion

//Valido acceso Bibliotecario
Funcion esValido <- validarAccesoBibliotecario(nombreIngresado, claveIngresada, bibliotecarios, cantBibliotecarios)
	Definir esValido Como Logico
	Definir i Como Entero
	esValido <- Falso
	
	Para i <- 0 Hasta cantBibliotecarios-1 Hacer
		Si bibliotecarios[i, 0] = nombreIngresado Y bibliotecarios[i, 1] = claveIngresada Entonces
			esValido <- Verdadero
			i <- cantBibliotecarios
		FinSi
	FinPara
FinFuncion

//Vista Administrador
SubAlgoritmo administrador(bibliotecarios Por Referencia, cantBibliotecarios, administradores Por Referencia, cantAdministradores)
	//Bibliotecarios
	Definir opAdmin, opGestion, i, indice, confirmar, totalBibliotecarios Como Entero	
    Definir nombreBibliotecario, claveBibliotecario, opUsuario Como Cadena
	//Admins
	Definir nombreIngresado, claveIngresada, nombreAdmin, claveAdmin Como Cadena
	Definir intentos, accesoValido, totalAdministradores Como Entero
	Definir administradorExiste, hayAdministradores Como Logico
	intentos <- 0
	accesoValido <- 0
	
	Repetir
		Limpiar Pantalla
		Escribir ""
        Escribir "*** MENÚ ADMINISTRADOR ***"
        Escribir "1. Gestionar Bibliotecarios"
        Escribir "2. Gestionar Socios"
        Escribir "3. Gestionar Administradores"
		Escribir "4. Volver al menú principal"
        Escribir "Elija una opción (1-4): "
        Leer opAdmin
		
		Segun opAdmin Hacer
			1:
				//Gestiono Bibliotecarios
				Repetir
					Escribir ""
                    Escribir "*** GESTIÓN DE BIBLIOTECARIOS ***"
                    Escribir "1. Agregar Bibliotecario"
                    Escribir "2. Eliminar Bibliotecario"
                    Escribir "3. Listar Bibliotecarios"
                    Escribir "4. Volver"
                    Escribir "Elija una opción (1-4): "
					Esperar Tecla
                    Leer opGestion
					
					Segun opGestion Hacer
						1: 	//Agrego Bibliotecario
							Repetir
								//Asigno posición en el array
								indice <- -1
								Para i <- 0 Hasta cantBibliotecarios -1 Hacer
									Si bibliotecarios[i, 0] = "" Entonces
										indice <- i
										i <- cantBibliotecarios -1  
									FinSi
								FinPara
								
								Si indice = -1 Entonces
									Escribir "No hay espacio disponible para agregar más bibliotecarios."
								Sino
									confirmar <- 0
									Mientras confirmar = 0 Hacer
										nombreBibliotecario <- pedirTexto("Ingrese nombre del bibliotecario: ")
										claveBibliotecario <- pedirNumeroComoTexto("Ingrese clave numérica (4 dígitos): ")
										
										// Valido que la clave tenga 4 dígitos
										Mientras Longitud(claveBibliotecario) <> 4
											Escribir "La clave debe tener exactamente 4 dígitos."
											claveBibliotecario <- pedirNumeroComoTexto("Ingrese clave numérica (4 dígitos): ")
										FinMientras
										
										// Verifico si el usuario ya existe
										Definir bibliotecarioExiste Como Logico
										bibliotecarioExiste <- Falso
										Para i <- 0 Hasta cantBibliotecarios-1 Hacer
											Si bibliotecarios[i, 0] = nombreBibliotecario Entonces
												bibliotecarioExiste <- Verdadero
											FinSi
										FinPara
										
										Si bibliotecarioExiste Entonces
											Escribir "Ese Bibliotecario ya se encuentra registrado."
										Sino
											Limpiar Pantalla
											Escribir "*** DATOS DEL NUEVO BIBLIOTECARIO ***"
											Escribir "Nombre: ", nombreBibliotecario
											Escribir "Clave: ", claveBibliotecario
											Escribir "Confirma el ingreso? (S/N)"
											Leer opUsuario
											
											Si Mayusculas(opUsuario) = "S" Entonces
												bibliotecarios[indice, 0] <- nombreBibliotecario
												bibliotecarios[indice, 1] <- claveBibliotecario
												Escribir "Bibliotecario agregado exitosamente."
												confirmar <- 1
											SiNo
												Escribir "Ingreso de bibliotecario ", nombreBibliotecario " cancelado"
												confirmar <- 1
											FinSi
										FinSi
									FinMientras
								FinSi
								
								Escribir "¿Desea agregar otro bibliotecario? (S/N)"
								Leer opUsuario
								//Esperar 1 segundo
							Hasta Que Mayusculas(opUsuario) = "N"
							
							Escribir "Volviendo a Gestión de Bibliotecarios..."
							Esperar 2 segundos
							Limpiar Pantalla
							
						2:	//Elimino Bibliotecario							
							Escribir ""
                            Escribir "*** ELIMINAR BIBLIOTECARIO ***"
                            Escribir ""
                            // Mostrar bibliotecarios existentes
                            Escribir "Bibliotecarios registrados:"
                            Definir hayBibliotecarios Como Logico
                            hayBibliotecarios <- Falso
                            Para i <- 0 Hasta cantBibliotecarios-1 Hacer
                                Si bibliotecarios[i, 0] <> "" Entonces
                                    Escribir i+1, ". ", bibliotecarios[i, 0], " - Clave: ", bibliotecarios[i, 1]
                                    hayBibliotecarios <- Verdadero
                                FinSi
                            FinPara
                            
                            Si hayBibliotecarios Entonces
                                Escribir "Ingrese el nombre del bibliotecario a eliminar: "
                                Leer nombreBibliotecario
								nombreBibliotecario <- Mayusculas(nombreBibliotecario)
                                
                                // Busco bibliotecario por nombre
                                indice <- -1
                                Para i <- 0 Hasta cantBibliotecarios-1  Hacer
                                    Si bibliotecarios[i, 0] = nombreBibliotecario Entonces
                                        indice <- i
                                    FinSi
                                FinPara
                                
                                Si indice = -1 Entonces
                                    Escribir "No se encontró un bibliotecario con ese nombre."
                                Sino
                                    Escribir "Bibliotecario encontrado: ", bibliotecarios[indice, 0]
                                    Escribir "¿Confirma que desea eliminar este bibliotecario? (S/N)"
                                    Leer opUsuario
                                    
                                    Si Mayusculas(opUsuario) = "S" Entonces
                                        bibliotecarios[indice, 0] <- ""
                                        bibliotecarios[indice, 1] <- ""
                                        Escribir "Bibliotecario eliminado exitosamente."
                                    Sino
                                        Escribir "Eliminación de bibliotecario ", bibliotecarios[indice, 0], " cancelada."
                                    FinSi
                                FinSi
                            Sino
                                Escribir "No hay bibliotecarios registrados."
                            FinSi			
							
						3:
							//Muestro Bibliotecarios
							Escribir ""
                            Escribir "*** LISTADO DE BIBLIOTECARIOS ***"                            
                            totalBibliotecarios <- 0
							
                            Para i <- 0 Hasta cantBibliotecarios-1 Hacer
                                Si bibliotecarios[i, 0] <> "" Entonces
                                    Escribir "----------------------------------------"
                                    Escribir "Nombre: ", bibliotecarios[i, 0]
                                    Escribir "Clave: ", bibliotecarios[i, 1]
                                    totalBibliotecarios <- totalBibliotecarios + 1
                                FinSi
                            FinPara
                            
                            Si totalBibliotecarios = 0 Entonces
                                Escribir "No hay bibliotecarios registrados."
                            Sino
								Escribir "----------------------------------------"
                                Escribir "Total de bibliotecarios registrados: ", totalBibliotecarios
                            FinSi
                            
						4:
							Escribir "Volviendo al menú de Administrador..."
							Esperar 1 Segundos
							Limpiar Pantalla
							
						De Otro Modo:
							Escribir "Eligió una opción inválida."
					Fin Segun				
					
				Hasta Que opGestion == 4
			2: //Gestiono Socios
				Escribir "En proceso"
			3:
				// Acceso Admins			
				Mientras intentos < 3 Y accesoValido = 0 Hacer
					Escribir "*** ACCESO ADMINISTRADOR ***"					
					Escribir Sin Saltar "Nombre: "
					Leer nombreIngresado
					nombreIngresado <- Mayusculas(nombreIngresado)
					Escribir Sin Saltar "Clave: "
					Leer claveIngresada
					Escribir "Intento ", intentos + 1, " de 3"
					
					Si validarAccesoAdministrador(nombreIngresado, claveIngresada, administradores, cantAdministradores) Entonces
						Escribir "Acceso concedido. Bienvenido ", nombreIngresado
						accesoValido <- 1
						Esperar 1 Segundos
						Limpiar Pantalla
						//mostrarMenuPpalAdmin
						//administrador(bibliotecarios, cantBibliotecarios, administradores, cantAdministradores)
					Sino
						Escribir "Nombre o clave incorrectos."
						intentos <- intentos + 1
						Esperar 2 Segundos
						Limpiar Pantalla
					FinSi
				FinMientras
				
				Si accesoValido = 0 Entonces
					Escribir "Demasiados intentos fallidos. Volviendo al menú principal."
					Esperar 2 Segundos
				FinSi
				
				//Gestiono Admins
				Repetir
					Escribir ""
					Escribir "*** GESTIÓN DE ADMINISTRADORES ***"
					Escribir "1. Agregar Administrador"
					Escribir "2. Eliminar Administrador"
					Escribir "3. Listar Administradores"
					Escribir "4. Volver"
					Escribir "Elija una opción (1-4): "
					Leer opGestion
					
					Segun opGestion Hacer
						1:  // Agregar Administrador							
							Repetir
								//Asigno posición en el array
								indice <- -1
								Para i <- 0 Hasta cantAdministradores -1 Hacer
									Si administradores[i, 0] = "" Entonces
										indice <- i
										i <- cantAdministradores -1  
									FinSi
								FinPara
								
								Si indice = -1 Entonces
									Escribir "No hay espacio disponible para agregar más administradores."
								Sino
									confirmar <- 0
									Mientras confirmar = 0 Hacer
										nombreAdmin <- pedirTexto("Ingrese nombre del administrador: ")
										claveAdmin <- pedirNumeroComoTexto("Ingrese clave numérica (4 dígitos): ")
										
										Mientras Longitud(claveAdmin) <> 4
											Escribir "La clave debe tener exactamente 4 dígitos."
											claveAdministrador <- pedirNumeroComoTexto("Ingrese clave numérica (4 dígitos): ")
										FinMientras
										
										// Verifico si el usuario ya existe
										
										administradorExiste <- Falso
										Para i <- 0 Hasta cantAdministradores-1 Hacer
											Si administradores[i, 0] = nombreAdmin Entonces
												administradorExiste <- Verdadero
											FinSi
										FinPara
										
										Si administradorExiste Entonces
											Escribir "Ese Administrador ya se encuentra registrado."
										Sino
											Limpiar Pantalla
											Escribir "*** DATOS DEL NUEVO ADMINISTRADOR ***"
											Escribir "Nombre: ", nombreAdmin
											Escribir "Clave: ", claveAdmin
											Escribir "Confirma el ingreso? (S/N)"
											Leer opUsuario
											
											Si Mayusculas(opUsuario) = "S" Entonces
												administradores[indice, 0] <- nombreAdmin
												administradores[indice, 1] <- claveAdmin
												Escribir "Administrador agregado exitosamente."
												confirmar <- 1
											FinSi
										FinSi
									FinMientras
								FinSi
								
								Escribir "¿Desea agregar otro administrador? (S/N)"
								Leer opUsuario
							Hasta Que Mayusculas(opUsuario) = "N"
							
						2:  // Eliminar Administrador  
							Escribir ""
							Escribir "*** ELIMINAR ADMINISTRADOR ***"
							
							// Mostrar admins existentes
							Escribir "Administradores registrados:"
							hayAdministradores <- Falso
							Para i <- 0 Hasta cantAdministradores-1 Hacer
								Si administradores[i, 0] <> "" Entonces
									Escribir i+1, ". ", administradores[i, 0], " - Clave: ", administradores[i, 1]
									hayAdministradores <- Verdadero
								FinSi
							FinPara
							
							Si hayAdministradores Entonces
								Escribir "Ingrese el nombre del Administrador a eliminar: "
								Leer nombreAdmin
								nombreAdmin <- Mayusculas(nombreAdmin)
								
								// Busco admin por nombre
								indice <- -1
								Para i <- 0 Hasta cantAdministradores-1  Hacer
									Si administradores[i, 0] = nombreAdmin Entonces
										indice <- i
									FinSi
								FinPara
								
								Si indice = -1 Entonces
									Escribir "No se encontró un Administrador con ese nombre."
								Sino
									Escribir "Administrador encontrado: ", administradores[indice, 0]
									Escribir "¿Confirma que desea eliminar este administrador? (S/N)"
									Leer opUsuario
									
									Si Mayusculas(opUsuario) = "S" Entonces
										administradores[indice, 0] <- ""
										administradores[indice, 1] <- ""
										Escribir "Administrador eliminado exitosamente."
									Sino
										Escribir "Eliminación cancelada."
									FinSi
								FinSi
							Sino
								Escribir "No hay administradores registrados."
							FinSi
						3:   // Listar Administradores
							
							Escribir ""
							Escribir "*** LISTADO DE ADMINISTRADORES ***"                            
							totalAdministradores <- 0
							
							Para i <- 0 Hasta cantAdministradores-1 Hacer
								Si administradores[i, 0] <> "" Entonces
									Escribir "----------------------------------------"
									Escribir "Nombre: ", administradores[i, 0]
									Escribir "Clave: ", administradores[i, 1]
									totalAdministradores <- totalAdministradores + 1
								FinSi
							FinPara
							
							Si totalAdministradores = 0 Entonces
								Escribir "No hay Administradores registrados."
							Sino
								Escribir "----------------------------------------"
								Escribir "Total de Administradores registrados: ", totalAdministradores
							FinSi
						4:  
							Escribir "Volviendo al menú de Administrador..."
							Esperar 1 Segundos
							Limpiar Pantalla
					Fin Segun
				Hasta Que opGestion = 4
			4:	
				Escribir "Volviendo al menú principal..."
				Esperar 1 Segundos
				Limpiar Pantalla
			De Otro Modo:
				Escribir "Eligió una opción inválida."
		Fin Segun		
		
	Hasta Que opAdmin == 4	
FinSubAlgoritmo


//*******************************************MENUES PARA MOSTRAR*******************************************************
SubProceso  mostrarMenuAcceso
	Escribir ""
	Escribir "Indique su tipo de usuario (0 para Salir): "
	Escribir ""
	Escribir "	1. ADMIN"
	Escribir "	2. BIBLIOTECARIO"
	Escribir "	2. SOCIO"
	Escribir "	0. Salir"
	Escribir ""
FinSubProceso

SubProceso mostrarMenuPpalAdmin
	Escribir ""
	Escribir "Elija el módulo al que quiere acceder (4 para Volver): "
	Escribir ""
	Escribir "	1. ADMINs"
	Escribir "	2. BIBLIOTECARIOS"
	Escribir "	3. SOCIOS"
	Escribir "4. Volver"
	Escribir ""
FinSubProceso

SubProceso mostrarMenuPpalBibliotecario
	Escribir ""
	Escribir "Elija el módulo al que quiere acceder (3 para Volver): "
	Escribir ""
	Escribir "	1. LIBROS"
	Escribir "	2. SOCIOS"
	Escribir "	3. Volver"
	Escribir ""
FinSubProceso

SubProceso mostrarMenuLibros
	Escribir ""
	Escribir "**** MENU LIBROS ****"
	Escribir "1. Agregar libros"		
	Escribir "2. Consultar libros"
	Escribir "3. Volver al menu principal"
	Escribir "Elija la opcion: "	
FinSubProceso

SubProceso  mostrarSubMenuConsultaLibros
	Escribir ""
	Escribir "***Sub Menu Consulta de Libros***"
	Escribir "1. Buscar Libro"
	Escribir "2. Modificar datos de libro"
	Escribir "3. Listado de Libros"
	Escribir "4. Registrar Préstamo"
	Escribir "5. Listado de Préstamos"
	Escribir "6. Registrar Devolución"
	Escribir "7. Volver"
	Escribir "Elija la opcion: "
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

//*******************************************FUNCIONES AUXILIARES*******************************************************
//Asigno posición a cada libro ingresado
Funcion posicion<-buscarUltimo(libros) 
    Definir i, posicion Como Entero
    i <- 0	
    Mientras i < cantLibros Y libros[i, 0] <> "" Hacer
        i <- i + 1
    FinMientras	
    Si i < cantLibros-1 Entonces
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

Funcion fechaDev <- pedirFechaDevolucion
    Definir anio, mes, dia Como Entero
    Definir fechaDev Como Cadena
    
    Escribir ""
    Escribir "*** FECHA DE DEVOLUCIÓN ***"
    anio <- pedirNumero("Ingrese el año de devolución (AAAA): ")
    mes <- pedirNumero("Ingrese el mes de devolución (1-12): ")
    
    Mientras mes < 1 O mes > 12
        Escribir "Mes inválido. Ingrese un mes entre 1 y 12:"
        mes <- pedirNumero("Ingrese el mes de devolución (1-12): ")
    FinMientras
    
    dia <- pedirNumero("Ingrese el día de devolución (1-31): ")
    
    Mientras dia < 1 O dia > 31
        Escribir "Día inválido. Ingrese un día entre 1 y 31:"
        dia <- pedirNumero("Ingrese el día de devolución (1-31): ")
    FinMientras
    
    // Validación básica de días por mes
    Si (mes = 4 O mes = 6 O mes = 9 O mes = 11) Y dia > 30 Entonces
        Escribir "Este mes solo tiene 30 días. Se ajustará a 30."
        dia <- 30
    FinSi
    
    Si mes = 2 Entonces
        Si (anio MOD 4 = 0 Y anio MOD 100 <> 0) O (anio MOD 400 = 0) Entonces
            Si dia > 29 Entonces
                Escribir "Febrero no puede tener más de 29 días en año bisiesto. Se ajustará a 29."
                dia <- 29
            FinSi
        Sino
            Si dia > 28 Entonces
                Escribir "Febrero no puede tener más de 28 días. Se ajustará a 28."
                dia <- 28
            FinSi
        FinSi
    FinSi
    
    // Formatear como DD/MM/AAAA
    Si dia < 10 Entonces
        Si mes < 10 Entonces
            fechaDev <- "0" + ConvertirATexto(dia) + "/0" + ConvertirATexto(mes) + "/" + ConvertirATexto(anio)
        Sino
            fechaDev <- "0" + ConvertirATexto(dia) + "/" + ConvertirATexto(mes) + "/" + ConvertirATexto(anio)
        FinSi
    Sino
        Si mes < 10 Entonces
            fechaDev <- ConvertirATexto(dia) + "/0" + ConvertirATexto(mes) + "/" + ConvertirATexto(anio)
        Sino
            fechaDev <- ConvertirATexto(dia) + "/" + ConvertirATexto(mes) + "/" + ConvertirATexto(anio)
        FinSi
    FinSi
    
    Escribir "Fecha de devolución: ", fechaDev
FinFuncion

Funcion esValida <- validarFechaDevolucion(fechaPrestamo, fechaDevolucion)
    Definir esValida Como Logico
    Definir diaP, mesP, anioP, diaD, mesD, anioD Como Entero
    
    // Convertir fecha préstamo (DD/MM/AAAA)
    diaP <- ConvertirANumero(Subcadena(fechaPrestamo, 0, 1))
    mesP <- ConvertirANumero(Subcadena(fechaPrestamo, 3, 4))
    anioP <- ConvertirANumero(Subcadena(fechaPrestamo, 6, 9))
    
    // Convertir fecha devolución (DD/MM/AAAA)
    diaD <- ConvertirANumero(Subcadena(fechaDevolucion, 0, 1))
    mesD <- ConvertirANumero(Subcadena(fechaDevolucion, 3, 4))
    anioD <- ConvertirANumero(Subcadena(fechaDevolucion, 6, 9))
    
    // Comparar fechas
    Si anioD > anioP Entonces
        esValida <- Verdadero
    Sino 
        Si anioD = anioP Entonces
            Si mesD > mesP Entonces
                esValida <- Verdadero
            Sino 
                Si mesD = mesP Entonces
                    Si diaD >= diaP Entonces
                        esValida <- Verdadero
                    Sino
                        esValida <- Falso
                    FinSi
                Sino
                    esValida <- Falso
                FinSi
            FinSi
        Sino
            esValida <- Falso
        FinSi
    FinSi
FinFuncion


//Genero Ids - sin Repetir
Funcion idUnico <- generarId
	Definir totalGenerados, i, j, nuevoId, repetido, generados Como Entero
	Definir idUnico como Cadena
	Dimension generados[cantLibros]
	totalGenerados <- 0
	
	Repetir	
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

//*******************************************LIBROS*******************************************************
//Crear libro
funcion crearLibro(libros Por Referencia)
	Definir idLibro, tituloLibro, autorLibro, generoLibro, anoPublicacionLibro, stockLibro, opcionUsuario como caracter
	Definir confirmar, indice, numTemporal, stockTemporal Como Entero
	confirmar <- 0
	indice <- buscarUltimo(libros) 
	Mientras confirmar = 0 Hacer
		Escribir ""
		Escribir "***INGRESO DE NUEVO LIBRO***"
		idLibro<-generarId
		tituloLibro<-pedirTexto("Ingrese Nombre del libro: ")
		autorLibro<-pedirTexto("Ingrese Autor: ")
		generoLibro<-pedirTexto("Ingrese Género: ")
		//anoPublicacionLibro <- pedirNumero("Año de publicacion: ")
		numTemporal<-pedirNumero("Año de publicacion: ")
		anoPublicacionLibro <- ConvertirATexto(numTemporal)
		stockTemporal<-pedirNumero("Cantidad de ejemplares: ") 
		Mientras stockTemporal <=0
			Escribir "Ingrese una cantidad válida"
			stockTemporal<-pedirNumero("Cantidad de ejemplares: ")
		FinMientras
		stockLibro<- ConvertirATexto(stockTemporal) 
		
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
		Escribir sin saltar "Año de publicacion: "
		Escribir anoPublicacionLibro
		Escribir sin saltar "Stock: "
		Escribir stockLibro 
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
	libros[indice, 7] <- stockLibro
FinFuncion


//Cuenta coincidencias segun filtro
Funcion cantResultados<-filtrarPorCriterio(libros, columna, filtro, resultados, cantLibros)
    Definir i, cantResultados Como Entero
    i <- 0
    cantResultados <- 0	
    Mientras i < cantLibros Hacer
        Si libros[i, 0] <> "" Entonces
            Si libros[i, columna] = filtro Entonces
                resultados[cantResultados] <- i
                cantResultados <- cantResultados + 1
            FinSi
        FinSi
        i <- i + 1
    FinMientras	
FinFuncion


//Buscar Libros
Funcion buscarLibro(libros Por Referencia, cantLibros)
	Definir tituloLibro, autorLibro, generoLibro, anoPublicacionLibro como caracter
	Definir opUsuario, columna, resultados, i, indice, cantidad Como Entero
	Definir criterio como Cadena
	Dimension resultados[cantLibros]
	
	//Inicializo resultados
	Para i <- 0 Hasta cantLibros-1 Hacer		
		resultados[i] <- -1
	FinPara
	
	Repetir
		Escribir ""
		Escribir "**BÚSQUEDA DE LIBRO**"
		Escribir "Elija un criterio de búsqueda"
		Escribir "1. Id"
		Escribir "2. Título"
		Escribir "3. Autor"
		Escribir "4. Género"
		Escribir "5. Año de publicación"
		Escribir "6. Volver"
		Escribir "Ingrese una opción (1-6): "
		Leer opUsuario
		
		Segun opUsuario Hacer
			1:
				columna<-0
				Escribir Sin Saltar "Ingrese id a buscar: "
				Leer criterio
			2:
				columna<-1
				Escribir Sin Saltar "Ingrese título a buscar: "
				Leer criterio			
				criterio<-Mayusculas(criterio)
			3:
				columna<-2
				Escribir Sin Saltar "Ingrese autor a buscar: "
				Leer criterio			
				criterio<-Mayusculas(criterio)
			4:
				columna<-3
				Escribir Sin Saltar "Ingrese género a buscar: "
				Leer criterio			
				criterio<-Mayusculas(criterio)
			5:
				columna<-4
				Escribir Sin Saltar "Ingrese año de publicación a buscar: "
				Leer criterio
			6:
				Escribir "Volviendo al menú de Libros..."
				Limpiar Pantalla
			De Otro Modo:
				Escribir "Eligió una opción inválida."
		Fin Segun
	Hasta Que opUsuario>=1 y opUsuario<=6
	
	
	Si opUsuario >=1 y opUsuario <=5 Entonces
		cantidad<-filtrarPorCriterio(libros, columna, criterio, resultados, cantLibros)	
		
		// Mostrar resultados si hay coincidencias
		Si cantidad = 0 Entonces
			Escribir "No se encontraron libros con ese criterio."
		Sino
			Para i <- 0 Hasta cantidad - 1 Hacer
				indice <- resultados[i]
				Escribir "Libro encontrado:"
				Escribir "Id: ", libros[indice, 0]
				Escribir "Título: ", libros[indice, 1]
				Escribir "Autor: ", libros[indice, 2]
				Escribir "Género: ", libros[indice, 3]
				Escribir "Año: ", libros[indice, 4]
				Escribir "Disponible: ", libros[indice, 5]
				Escribir "Stock: ", libros[indice, 7]
				Escribir ""
			FinPara
		FinSi			
	FinSi  
FinFuncion

//Modificar Libro
Funcion modificarLibro(libros Por Referencia, cantLibros)
    Definir i, idBuscado, indice, confirmar Como Entero
    Definir opcionUsuario, nuevoDato, tituloLibro, autorLibro, generoLibro, anoPublicacionLibro, stockLibro Como Cadena
	
    // Pedir el ID del libro a modificar
	Escribir ""
	Escribir "**MODIFICACIÓN DE LIBRO**"
    Escribir "Ingrese el ID del libro a modificar: "
    Leer idBuscado
	
    // Buscar el libro en la matriz
    indice <- -1
    Para i <- 0 Hasta cantLibros-1
        Si libros[i,0] = ConvertirATexto(idBuscado) Entonces
            indice <- i
        FinSi
    FinPara
	
    // Verifico si se encontró el libro
    Si indice = -1 Entonces
        Escribir "Id de Libro no encontrado."
    Sino
        // Cargar datos actuales en variables temporales
        tituloLibro <- libros[indice,1]
        autorLibro <- libros[indice,2]
        generoLibro <- libros[indice,3]
        anoPublicacionLibro <- libros[indice,4]
		stockLibro <- libros[indice,7]
		
        confirmar <- 0
        Mientras confirmar = 0 Hacer
            Limpiar Pantalla
            Escribir "***DATOS ACTUALES DEL LIBRO***"
            Escribir "ID: ", libros[indice,0]
            Escribir "Titulo: ", tituloLibro
            Escribir "Autor: ", autorLibro
            Escribir "Genero: ", generoLibro
            Escribir "Año de Publicacion: ", anoPublicacionLibro
			Escribir "Ejemplares disponibles: ", stockLibro
			
            Escribir "Ingrese los nuevos datos (dejar vacío para no cambiar):"
			
            Escribir Sin Saltar "Nuevo Título: "
            Leer nuevoDato
            Si Longitud(nuevoDato) > 0 Entonces
                tituloLibro <- nuevoDato
            FinSi			
            Escribir Sin Saltar "Nuevo Autor: "
			Leer nuevoDato
            Si Longitud(nuevoDato) > 0 Entonces
                autorLibro <- nuevoDato
            FinSi			
            Escribir Sin Saltar "Nuevo Género: "
			Leer nuevoDato
            Si Longitud(nuevoDato) > 0 Entonces
                generoLibro <- nuevoDato
            FinSi			
            Escribir Sin Saltar "Nuevo Año de Publicacion: "
			Leer nuevoDato
            Si Longitud(nuevoDato) > 0 Entonces
                anoPublicacionLibro <- nuevoDato
            FinSi
			Escribir Sin Saltar "Nueva cantidad de ejemplares: "
			Leer nuevoDato
            Si Longitud(nuevoDato) > 0 Entonces
                stockLibro <- nuevoDato
            FinSi
			
            Limpiar Pantalla
            Escribir "***DATOS DEL LIBRO MODIFICADOS***"
            Escribir "ID: ", libros[indice,0]
            Escribir "Titulo: ", tituloLibro
            Escribir "Autor: ", autorLibro
            Escribir "Genero: ", generoLibro
            Escribir "Año de Publicacion: ", anoPublicacionLibro
			Escribir "Stock: ", stockLibro
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
		libros[indice,7] <- stockLibro
    FinSi
FinFuncion


//Mostrar libros cargados
Funcion mostrarLibros(libros Por Referencia, cantLibros)	
	Definir i Como Entero
	
	Escribir "*** LISTA DE LIBROS CARGADOS ***"	
	Para i <- 0 Hasta cantLibros-1		
		Si libros[i,0] <> "" Entonces
			Escribir "----------------------------------------"
			Escribir "ID: ", libros[i,0]
			Escribir "Titulo: ", libros[i,1]
			Escribir "Autor: ", libros[i,2]
			Escribir "Genero: ", libros[i,3]
			Escribir "Año de Publicacion: ", libros[i,4]
			Escribir "Disponible: ", libros[i,5]
			//Escribir "Fecha prevista de devolucion: ", libros[i,6] //Ver sacar esta 
			Escribir "Cantidad de ejemplares disponibles para préstamo: ", libros[i,7]
			Escribir "Cantidad de ejemplares en préstamo: ", libros[i,8]
		FinSi
	FinPara
FinFuncion

//*******************************************SOCIOS*******************************************************
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
		estadoSocio <- "HABILITADO"
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

//Buscar Socio
Funcion buscarSocio(socios Por Referencia, cantSocios)
	Definir opUsuario, columna, resultados, i, indice, cantidad Como Entero
	Definir criterio como Cadena
	Dimension resultados[cantSocios]
	//Inicializo resultados
	Para i <- 0 Hasta cantSocios-1 Hacer		
		resultados[i] <- -1
	FinPara
	
	Repetir
		Escribir ""
		Escribir "**BÚSQUEDA DE SOCIO**"
		Escribir "Elija un criterio de búsqueda"
		Escribir "1. DNI"
		Escribir "2. Nombre"
		Escribir "3. Estado"
		Escribir "4. Volver"
		Escribir "Ingrese una opción (1-4): "
		Leer opUsuario
		
		Segun opUsuario Hacer
			1:
				columna<-0
				criterio <- pedirNumeroComoTexto("Ingrese DNI a buscar: ")
			2:
				columna<-1
				Escribir Sin Saltar "Ingrese nombre a buscar: "
				Leer criterio				
				criterio <- Mayusculas(criterio)				
			3:
				columna <- 3
				Repetir
					Escribir "Ingrese Estado a buscar (H = HABILITADO / I = INHABILITADO / M = MULTADO): "
					Leer criterio
					criterio <- Mayusculas(criterio)
				Hasta Que (criterio = "H" O criterio = "I" O criterio = "M")
				
				Segun criterio Hacer
					"H":
						criterio <- "HABILITADO"
					"I":
						criterio <- "INHABILITADO"
					De Otro Modo:
						criterio <- "MULTADO"
				Fin Segun
			4:	
				Escribir "Volviendo al menú de Socios..."
				Esperar 1 Segundos
				Limpiar Pantalla
			De Otro Modo:
				Escribir "Eligió una opción inválida."				
		Fin Segun	
	Hasta Que opUsuario >= 1 Y opUsuario <= 4
	
	Si opUsuario >= 1 Y opUsuario <= 3 Entonces
		cantidad<-filtrarPorCriterio(socios, columna, criterio, resultados, cantLibros)
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
	FinSi
			
FinFuncion

//Modificar Socio
Funcion modificarSocio(socios Por Referencia, cantSocios)
    Definir i, indice, confirmar Como Entero
    Definir opcionUsuario, nuevoDato, nombreSocio,telSocio,estadoSocio, penalizacionSocio, idBuscado Como Cadena
	
    // Pedir el dni del socio a modificar
	Escribir ""
	Escribir "**MODIFICACIÓN DE SOCIO**"
    idBuscado <- pedirNumeroComoTexto("Ingrese el DNI del socio a modificar: ")
	
    // Buscar el socio en la matriz
    indice <- -1
    Para i <- 0 Hasta cantSocios-1
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
            Escribir "Nombre y apellido: ", nombreSocio
            Escribir "Telefono: ", telSocio
            Escribir "Estado: ", estadoSocio
            Escribir "Ingrese los nuevos datos (dejar vacío para no cambiar):"
	
            Escribir Sin Saltar "Nuevo Nombre y apellido: "
            Leer nuevoDato
            Si Longitud(nuevoDato) > 0 Entonces
				nuevoDato <- pedirTexto("Ingrese Nombre y Apellido del socio: ")
				nombreSocio <-  nuevoDato
            FinSi			
            Escribir Sin Saltar "Nuevo Telefono: "
			Leer nuevoDato
            Si Longitud(nuevoDato) > 0 Entonces
                nuevoDato <- pedirNumeroComoTexto("Ingrese el teléfono: ")
				telSocio <-  nuevoDato
            FinSi			
            Escribir Sin Saltar "Nuevo Estado: "
			Leer nuevoDato
            Si Longitud(nuevoDato) > 0 Entonces
				Repetir
					nuevoDato <- pedirTexto("Ingrese el Estado (H = HABILITADO / I = INHABILITADO / M = MULTADO): ")
					estadoSocio <- nuevoDato
					estadoSocio <- Mayusculas(estadoSocio)
				Hasta Que (estadoSocio = "H" O estadoSocio = "I" O estadoSocio = "M")
				Segun estadoSocio Hacer
					"H":
						estadoSocio <- "HABILITADO"
					"I":
						estadoSocio <- "INHABILITADO"
					De Otro Modo:
						estadoSocio <- "MULTADO"
						Escribir "Ingrese los dias de penalización: "
						leer penalizacionSocio
				Fin Segun
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
Funcion mostrarSocios(socios Por Referencia, cantSocios)
	Definir i Como Entero
	Escribir "*** LISTA DE SOCIOS CARGADOS ***"	
	Para i <- 0 Hasta cantSocios-1   
		Si socios[i,0] <> "" Entonces
			Escribir "----------------------------------------"
			Escribir "DNI: ", socios[i,0]
			Escribir "Nombre y apellido: ", socios[i,1]
			Escribir "Telefono: ", socios[i,2]
			Escribir "Estado: ", socios[i,3]
				Si socios[i,3] = "MULTADO" Entonces
					Escribir "Días de penalización: ", socios[i,4]
				FinSi
		FinSi
	FinPara	
FinFuncion


//Fecha préstamo -- fechaFinPrestamo 
Funcion fechasPrestamo(fechaInicio Por Referencia, fechaFinPrestamo Por Referencia)
	Definir fecha, anio, mes, dia, diasASumar, diasMes, diasRestantesMes Como Entero
	Definir diaTemp, mesTemp, anioTemp como Cadena
	
    // TOMA AUTOMÁTICAMENTE LA FECHA DEL SISTEMA
    fecha <- FechaActual() 
    anio <- trunc(fecha / 10000)
    mes <- trunc((fecha MOD 10000) / 100)
    dia <- fecha MOD 100
	
	Escribir "Fecha de inicio del préstamo: ", dia, "/", mes, "/", anio
	si (dia<10) Entonces
		diaTemp <- "0"+ConvertirATexto(dia)
	SiNo
		diaTemp <- ConvertirATexto(dia)
	FinSi
	Si mes < 10 Entonces
        mesTemp <- "0" + ConvertirATexto(mes)
    Sino
        mesTemp <- ConvertirATexto(mes)
    FinSi
	
	fechaInicio<-diaTemp+"/"+mesTemp+"/"+ConvertirATexto(anio) 
    
    // Días de validez del préstamo (una semana)
    diasASumar <- 7
    Mientras diasASumar > 0 Hacer
        Segun mes Hacer
            1,3,5,7,8,10,12:
                diasMes <- 31
            4,6,9,11:
                diasMes <- 30
            2:
                Si (anio MOD 4 = 0 Y anio MOD 100 <> 0) O (anio MOD 400 = 0) Entonces
                    diasMes <- 29
                Sino
                    diasMes <- 28
                FinSi
        FinSegun
		
        diasRestantesMes <- diasMes - dia
		
        Si diasASumar <= diasRestantesMes Entonces
            dia <- dia + diasASumar
            diasASumar <- 0
        Sino
            diasASumar <- diasASumar - diasRestantesMes - 1
            dia <- 1
            mes <- mes + 1
            Si mes > 12 Entonces
                mes <- 1
                anio <- anio + 1
            FinSi
        FinSi
    FinMientras
	
    Escribir "Fecha de finalización del préstamo: ", dia, "/", mes, "/", anio
	
    // Convierto fechas numéricas a texto
	si (dia<10) Entonces
		diaTemp <- "0"+ConvertirATexto(dia)
	SiNo
		diaTemp <- ConvertirATexto(dia)
	FinSi
	Si mes < 10 Entonces
        mesTemp <- "0" + ConvertirATexto(mes)
    Sino
        mesTemp <- ConvertirATexto(mes)
    FinSi
	
	fechaFinPrestamo<-diaTemp+"/"+mesTemp+"/"+ConvertirATexto(anio) 
FinFuncion


//Muestro Libro - para préstamos y devoluciones
SubProceso mostrarLibroEncontrado(libros Por Referencia, indiceLibro)
	
	Escribir ""
	Escribir "-------------Datos del Libro---------------"
	Escribir "ID: ", libros[indiceLibro,0]
	Escribir "Titulo: ", libros[indiceLibro,1]
	Escribir "Autor: ", libros[indiceLibro,2]
	Escribir "Genero: ", libros[indiceLibro,3]
	Escribir "Año de Publicacion: ", libros[indiceLibro,4]
	Escribir ""
FinSubProceso

//Registrar préstamo
Funcion registrarPrestamo(libros Por Referencia, socios Por Referencia, prestamos Por Referencia, cantLibros, cantSocios)
    Definir i, j, disponible, indiceLibro, indiceSocio, p, stockActual Como Entero
    Definir idBuscado, dniBuscado, op, fechaPrestamo, fechaFinPrestamo Como Cadena
    disponible <- -1
    indiceSocio <- -1
    p <- 0
	
    Escribir "REGISTRAR PRÉSTAMO DE LIBRO"
    Escribir Sin Saltar "Ingrese id del libro a prestar: "
    Leer idBuscado
	
    // Buscar libro
    Para i <- 0 Hasta cantLibros-1 Hacer
        Si libros[i,0] = idBuscado Entonces
            indiceLibro <- i
			stockActual <- ConvertirANumero(libros[i,7])  
            Si libros[i,5] = "1" y stockActual > 0 Entonces
                disponible <- 1
            SiNo
                disponible <- 0
            FinSi
        FinSi
    FinPara
	
    Si disponible = -1 Entonces
        Escribir "ID no encontrado"
    SiNo
        Si disponible = 1 Entonces
            Escribir "El libro ", libros[indiceLibro, 1] " está disponible para préstamo"
			Escribir "Stock disponible: ", stockActual
			mostrarLibroEncontrado(libros, indiceLibro)
			
            Escribir "Ingrese DNI del socio: "
            Leer dniBuscado
			
            // Buscar socio
            Para j <- 0 Hasta cantSocios-1 Hacer
                Si socios[j,0] = dniBuscado Entonces
                    indiceSocio <- j
                FinSi
            FinPara
			
            Si indiceSocio = -1 Entonces
                Escribir "Socio no encontrado"
            SiNo
                Segun socios[indiceSocio,3] Hacer
                    "HABILITADO":
                        Escribir "Socio ", socios[indiceSocio,1] " habilitado para préstamo"
                        Escribir "Desea registrar préstamo (S-N)?"
                        Leer op
                        op <- Mayusculas(op)
                        Segun op Hacer
                            "S":
                                Escribir "Registrando préstamo..."
                                Esperar 1 segundo
								
								//Actualizo stock
								stockActual <- stockActual - 1
                                libros[indiceLibro,7] <- ConvertirATexto(stockActual)
								//Cambio estado si no hay mas stock
								Si stockActual == 0 Entonces
									libros[indiceLibro,5] <- "0"											
								FinSi
								//Agrego cantidad de prestados a matriz libro
								libros[indiceLibro,8] <- ConvertirATexto(ConvertirANumero(libros[indiceLibro,8]) + 1)
								
                                fechasPrestamo(fechaPrestamo, fechaFinPrestamo)
								// Guardar en prestamos en la fila p
                                prestamos[p,0] <- idBuscado
								prestamos[p,1] <- dniBuscado
                                prestamos[p,2] <- fechaPrestamo
                                prestamos[p,3] <- fechaFinPrestamo
                                libros[indiceLibro,6] <- fechaFinPrestamo
                                socios[indiceSocio,3] <- "INHABILITADO" // tiene préstamo activo
								socios[indiceSocio,4] <- "0"  // Reiniciar días de penalizacion
                                Escribir "Préstamo registrado con éxito"
								Escribir "Stock restante del libro: ", stockActual
                            "N":
                                Escribir "Volviendo a consultas..."
								Esperar 1 Segundos
								Limpiar Pantalla
                            De Otro Modo:
                                Escribir "Opción inválida"
                        Fin Segun
                    "INHABILITADO":
                        Escribir "Socio INHABILITADO: ya tiene un préstamo activo"
                    "MULTADO":
                        Escribir "Socio MULTADO: no puede sacar libros por ", socios[indiceSocio,4], " días"
                FinSegun
            FinSi
        Sino
			Escribir "El libro ", libros[indiceLibro,1]  " No se encuentra disponible para préstamo"
			

        FinSi
    FinSi
FinFuncion

//Mostrar prestamos cargados
Funcion mostrarPrestamos(prestamos Por Referencia, cantPrestamos)	
	Definir i, totalPrestamos Como Entero
	totalPrestamos <- 0
	
	Escribir "*** LISTA DE PRÉSTAMOS ***"	
		
	Para i <- 0 Hasta cantPrestamos-1   
		Si prestamos[i,0] <> "" Entonces
			Escribir "----------------------------------------"
			Escribir "ID LIBRO: ", prestamos[i,0]
			Escribir "DNI SOCIO: ", prestamos[i,1]
			Escribir "Fecha de inicio: ", prestamos[i,2]
			Escribir "Fecha de devolucion pactada: ", prestamos[i,3]	
			Escribir ""
			totalPrestamos <- totalPrestamos + 1 
		FinSi
	FinPara
	
	Si totalPrestamos = 0 Entonces
		Escribir ""
		Escribir "No hay préstamos activos en este momento."
	FinSi	
FinFuncion


//Calculo atraso 
Funcion diasAtraso <- chequearPenalidad(fechaFinPrestamo, fechaDev)
    Definir diasAtraso, fechaFin, fechaDevNum Como Entero
    Definir diaCad, mesCad, anioCad Como Cadena
    
    diasAtraso <- 0
    
    // Convertir fechaDev (DD/MM/AAAA) a número AAAAMMDD
    diaCad <- Subcadena(fechaDev, 0, 1)
    mesCad <- Subcadena(fechaDev, 3, 4)
    anioCad <- Subcadena(fechaDev, 6, 9)
    fechaDevNum <- ConvertirANumero(anioCad) * 10000 + ConvertirANumero(mesCad) * 100 + ConvertirANumero(diaCad)
    
    Si fechaFinPrestamo <> "" Y Longitud(fechaFinPrestamo) >= 10 Entonces
        // Convertir fechaFinPrestamo (DD/MM/AAAA) a número AAAAMMDD
        diaCad <- Subcadena(fechaFinPrestamo, 0, 1)
        mesCad <- Subcadena(fechaFinPrestamo, 3, 4)
        anioCad <- Subcadena(fechaFinPrestamo, 6, 9)
        
        fechaFin <- ConvertirANumero(anioCad) * 10000 + ConvertirANumero(mesCad) * 100 + ConvertirANumero(diaCad)
        
        // Calcular días de atraso
        Si fechaDevNum > fechaFin Entonces
            diasAtraso <- (fechaDevNum - fechaFin)
            Escribir "Días de atraso: ", diasAtraso
        Sino
            diasAtraso <- 0
            Escribir "No hay penalidad - Devolución a tiempo"
        FinSi
    Sino
        diasAtraso <- 0
        Escribir "Error: Fecha de fin de préstamo no válida"
    FinSi
FinFuncion


//Calculo penalidad
Funcion fechaFinPenalidad <- calcularPenalidad(diasAtraso, fechaDevolucion)
    Definir fechaFinPenalidad Como Entero
    Definir diasPenalidad, diasMes, diasRestantesMes Como Entero
	Definir anio, mes, dia Como Entero
    
    Si diasAtraso > 0 Entonces
        diasPenalidad <- diasAtraso * 2
        
        Escribir "=== PENALIDAD POR DEVOLUCIÓN TARDÍA ==="
        Escribir "Días de atraso: ", diasAtraso
        Escribir "Penalidad: No puede retirar libros por ", diasPenalidad, " días"        
		
		anio <- trunc(fechaDevolucion / 10000)
		mes <- trunc((fechaDevolucion MOD 10000) / 100)  
		dia <- fechaDevolucion MOD 100        
        
        Mientras diasPenalidad > 0 Hacer
			Segun mes Hacer
				1,3,5,7,8,10,12:
					diasMes <- 31
				4,6,9,11:
					diasMes <- 30
				2:
					Si (anio MOD 4 = 0 Y anio MOD 100 <> 0) O (anio MOD 400 = 0) Entonces
						diasMes <- 29
					Sino
						diasMes <- 28
					FinSi
			FinSegun
			
			diasRestantesMes <- diasMes - dia
			
			Si diasPenalidad <= diasRestantesMes Entonces
				dia <- dia + diasPenalidad
				diasPenalidad <- 0
			Sino
				diasPenalidad <- diasPenalidad - diasRestantesMes - 1
				dia <- 1
				mes <- mes + 1
				Si mes > 12 Entonces
					mes <- 1
					anio <- anio + 1
				FinSi
			FinSi
		FinMientras
		
        fechaFinPenalidad <- anio * 10000 + mes * 100 + dia
        
        Escribir "Fin de penalidad: ", dia, "/", mes, "/", anio
        Escribir "Podrá retirar libros nuevamente a partir de esta fecha"
        Escribir ""
		//    Sino
		//        fechaFinPenalidad <- fechaDevolucion
		//        Escribir "No hay penalidad - Devolución a tiempo"
    FinSi
FinFuncion

//Gestiono devolución
Funcion registrarDevolucion(libros Por Referencia, socios Por Referencia, prestamos Por Referencia, cantLibros, cantSocios)
    Definir i, j, prestado, indiceLibro, indiceSocio, indicePrestamo, diasAtraso, diasPenalidad, stockActual Como Entero
    Definir idBuscado, dniSocio, op, fechaFinPrestamo, fechaDev Como Cadena
    Definir fechaValida Como Logico
    
    prestado <- -1
    indiceSocio <- -1
    indicePrestamo <- -1
    
    Escribir ""
    Escribir "REGISTRAR DEVOLUCIÓN DE LIBRO"
    idBuscado <- pedirNumeroComoTexto("Ingrese id del libro a devolver: ")
    
    // Buscar libro
    Para i <- 0 Hasta cantLibros-1 Hacer
        Si libros[i,0] = idBuscado Entonces
            indiceLibro <- i
            Si libros[i,8] > "0" Entonces 
                prestado <- 1
            Sino
                prestado <- 0
            FinSi            
        FinSi        
    FinPara
    
    Si prestado = -1 Entonces
        Escribir "Id No encontrado"
    Sino
        Si prestado = 1 Entonces
            Escribir "El libro se encuentra en préstamo"
            mostrarLibroEncontrado(libros, indiceLibro)
            
            // BUSCAR EL PRÉSTAMO ACTIVO PARA ESTE LIBRO
            Para i <- 0 Hasta cantLibros-1 Hacer
                Si prestamos[i,0] = idBuscado Y prestamos[i,1] <> "" Entonces
                    indicePrestamo <- i
                    dniSocio <- prestamos[i,1]
                    i <- cantLibros
                FinSi
            FinPara
            
            Si indicePrestamo = -1 Entonces
                Escribir "Error: No se encontró un préstamo asociado a este libro"
            Sino
                // BUSCAR EL SOCIO POR DNI
                Para j <- 0 Hasta cantSocios-1 Hacer
                    Si socios[j,0] = dniSocio Entonces
                        indiceSocio <- j
                        j <- cantSocios
                    FinSi
                FinPara
                
                Si indiceSocio = -1 Entonces
                    Escribir "Error: Socio no encontrado"
                Sino
                    Escribir "Socio: ", socios[indiceSocio,1], " (DNI: ", dniSocio, ")"
                    Escribir "Desea registrar devolución (S-N)?"
                    Leer op
                    op <- Mayusculas(op)
                    
                    Si op = "S" Entonces
                        Escribir "Registrando Devolución..."
                        Esperar 1 Segundo
                        
                        // PEDIR FECHA DE DEVOLUCIÓN Y VALIDAR
                        fechaDev <- pedirFechaDevolucion()
                        
                        // Verifico que fecha devolucion no sea anterior a la del prestamo
                        fechaValida <- validarFechaDevolucion(prestamos[indicePrestamo,2], fechaDev)
                        
                        Si No fechaValida Entonces
                            Escribir "Error: La fecha de devolución no puede ser anterior a la fecha de préstamo."
                            Escribir "Fecha de préstamo: ", prestamos[indicePrestamo,2]
                        Sino                            
                            //Calculo penalización si hay atraso
                            fechaFinPrestamo <- libros[indiceLibro,6]
                            diasAtraso <- chequearPenalidad(fechaFinPrestamo, fechaDev)
                            
                            //Actualizo estado del socio
                            Si diasAtraso > 0 Entonces
                                diasPenalidad <- diasAtraso * 2
                                socios[indiceSocio,3] <- "MULTADO"
                                socios[indiceSocio,4] <- ConvertirATexto(diasPenalidad)
                                Escribir "Socio multado por ", diasPenalidad, " días"
                            Sino
                                socios[indiceSocio,3] <- "HABILITADO"
                                socios[indiceSocio,4] <- "0"
                                Escribir "Socio habilitado para nuevos préstamos"
                            FinSi
                            
                            // 4. LIMPIAR FECHA DE DEVOLUCIÓN DEL LIBRO 
							//VER!!! Puede haber mas de un ejemplar prestado... 
                            libros[indiceLibro,6] <- ""
                            
                            // Elimino el préstamo
                            prestamos[indicePrestamo,0] <- ""
                            prestamos[indicePrestamo,1] <- ""
                            prestamos[indicePrestamo,2] <- ""
                            prestamos[indicePrestamo,3] <- ""
							
							//Actualizo stock y ejemplaresPrestados		
							stockActual <- ConvertirANumero(libros[indiceLibro,7])
							stockActual <- stockActual + 1
							libros[indiceLibro,7] <- ConvertirATexto(stockActual)
							//Si no quedaban libros, actualizo dispo							
							Si stockActual = 1 Entonces
								libros[indiceLibro,5] <- "1"
							FinSi
							
							Escribir "Devolución registrada con éxito. Stock actualizado: ", stockActual
                            
                        FinSi
                    Sino
                        Si op = "N" Entonces
                            Escribir "Volviendo a consultas..."
							Esperar 1 Segundos
							Limpiar Pantalla
                        Sino
                            Escribir "Opción inválida"
                        FinSi
                    FinSi
                FinSi
            FinSi
        Sino
            Escribir "El libro NO se encuentra en préstamo"
        FinSi        
    FinSi
FinFuncion

