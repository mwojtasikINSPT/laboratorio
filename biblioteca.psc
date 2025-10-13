Algoritmo biblioteca	
	
	Definir libros, socios, prestamos, bibliotecarios como Cadena 
	Definir resp, opAcceso Como Caracter
	Definir op, modulo, opLibros, opSocios, i, j Como Entero 
	
	//VARIABLES PRESTAMOS
	Definir cantPrestamos, camposPrestamos Como Entero
	
	//VARIABLES SOCIOS
	Definir cantSocios, camposSocios Como Entero
	
	//VARIABLES LIBROS
	Definir disponible, cantLibros, camposLibros Como Entero
	
	//VARIABLES BIBLIOTECARIOS
	Definir cantBibliotecarios, camposBibliotecarios, intentos, accesoValido Como Entero 
	Definir nombreIngresado, claveIngresada, fechaFinPenalidad Como Cadena
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
	camposSocios <- 6 //dni, nombre, telefono, Condición, fechaPenalizacion, Estado
	Dimension socios[cantSocios, camposSocios]
	
	cantPrestamos <- 200
	camposPrestamos  <- 6 //  idLibro, dniSocio, fechaPrestamo, fechaFin, nombreSocio, nombreLibro
	Dimension prestamos[cantPrestamos, camposPrestamos] 
	
	camposBibliotecarios <- 2 //nombreBibliotecario, claveBibliotecario
	cantBibliotecarios <- 50
    Dimension bibliotecarios[cantBibliotecarios, camposBibliotecarios] 
	
	cantAdministradores <- 10
	camposAdministradores <- 2 //NombreAdmin, clave
    Dimension administradores[cantAdministradores, camposAdministradores]
	i<- 0
	
	//Inicializo matriz de prestamos 
	Para i <- 0 Hasta cantPrestamos - 1 Hacer		
		Para j <- 0 Hasta camposPrestamos - 1 Hacer
			prestamos[i, j] <- ""
		FinPara
	FinPara	
	
	//Precargo Libros para pruebas
	librosPrecargados(libros, cantLibros, camposLibros)
	
	//Precargo Socios para pruebas
	sociosPrecargados(socios, cantSocios, camposSocios)

	// Precargo Bibliotecarios para pruebas
    bibliotecariosPrecargados(bibliotecarios, cantBibliotecarios, camposBibliotecarios)
	
	// Precargo Administradores para pruebas
	administradoresPrecargados(administradores, cantAdministradores, camposAdministradores)
	
	bienvenidaSistema
	
	//Acceso diferenciado por tipo de usuario: Admin, Bibliotecario, Socio
	Repetir
		mostrarMenuAcceso
		Leer opAcceso
		esperarLimpiar("")
		
		Segun opAcceso Hacer
			"1":	//Acceso Admin
				Mientras intentos < 3 Y accesoValido = 0 Hacer
					Escribir "*** ACCESO ADMINISTRADOR ***"	
					espacio
					Escribir "Intento ", intentos + 1, " de 3"
					Escribir Sin Saltar "Ingrese su Nombre: "
					Leer nombreIngresado
					nombreIngresado <- Mayusculas(nombreIngresado)
					Escribir Sin Saltar "Ingrese su Clave: "
					Leer claveIngresada
					
					Si validarAccesoAdministrador(nombreIngresado, claveIngresada, administradores, cantAdministradores) Entonces
						Escribir "Acceso concedido. Bienvenido ", nombreIngresado
						accesoValido <- 1
						esperarLimpiar("")				
					Sino
						Escribir "Nombre o clave incorrectos."
						intentos <- intentos + 1
						esperarLimpiar("")	
					FinSi
				FinMientras
				
				Si accesoValido = 0 Entonces
					esperarLimpiar("Demasiados intentos fallidos. Volviendo al menú principal...")	
				FinSi
				
				administrador(bibliotecarios, cantBibliotecarios, administradores, cantAdministradores, socios, cantSocios) 		
				
			"2":  //Acceso Bibliotecario		
				Mientras intentos < 3 Y accesoValido = 0 Hacer
				Escribir "*** ACCESO BIBLIOTECARIO ***"	
				espacio
				Escribir "Intento ", intentos + 1, " de 3"
				Escribir Sin Saltar "Ingrese su nombre: "
				Leer nombreIngresado
				nombreIngresado <- Mayusculas(nombreIngresado)
				Escribir Sin Saltar "Ingrese su clave: "
				Leer claveIngresada						
				
				Si validarAccesoBibliotecario(nombreIngresado, claveIngresada, bibliotecarios, cantBibliotecarios) Entonces
					accesoValido <- 1
					esperarLimpiar("Acceso concedido. Bienvenido " + nombreIngresado)
				Sino					
					intentos <- intentos + 1
					esperarLimpiar("Nombre o clave incorrectos")
				FinSi
			FinMientras
			
			Si accesoValido = 0 Entonces
				Escribir "Demasiados intentos fallidos. Volviendo al menú principal..."
				Esperar 2 Segundos
				Limpiar Pantalla
			FinSi
				
			bibliotecario(libros, cantLibros, socios, cantSocios, prestamos, cantPrestamos, camposPrestamos)
		"3":
			//Acceso Socios
			Escribir "*** ACCESO SOCIOS ***"			
			socio(libros, cantLibros, prestamos, cantPrestamos, socios, cantSocios)
		"0":
			Escribir "Gracias por usar nuestro Sistema de Gestión de Biblioteca"
			espacio
			esperarLimpiar("Saliendo del Sistema...")
		De Otro Modo:
			esperarLimpiar("Eligió una opción inválida.")
	Fin Segun
	
	Hasta Que opAcceso == "0"
	
FinAlgoritmo

SubProceso espacio
	Escribir ""
FinSubProceso

//******************************************* FUNCIONES AUXILIARES - VALIDACION DE ACCESO *******************************************************
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

//***************************************************************Vista Administrador*********************************************************
SubAlgoritmo administrador(bibliotecarios Por Referencia, cantBibliotecarios, administradores Por Referencia, cantAdministradores, socios Por Referencia, cantSocios)
	Definir i Como Entero
	Definir resp, opAdmin Como Caracter
	Definir dato como Cadena
	//Bibliotecarios
	Definir indice, confirmar, totalBibliotecarios, cantAdmins Como Entero	
    Definir nombreBibliotecario, claveBibliotecario, opUsuario Como Cadena
	//Admins
	Definir nombreIngresado, claveIngresada, nombreAdmin, claveAdmin Como Cadena
	Definir intentos, accesoValido, totalAdministradores Como Entero
	Definir administradorExiste, hayAdministradores, hayBibliotecarios, bibliotecarioExiste Como Logico
	
	cantAdmins <- 3 
	intentos <- 0
	accesoValido <- 0
	totalBibliotecarios <- 3
	
	Repetir
        Escribir "*** MENÚ ADMINISTRADOR ***"
        Escribir "1. Gestionar Bibliotecarios"
        Escribir "2. Gestionar Socios"
        Escribir "3. Gestionar Administradores"
		Escribir "0. Volver al menú principal"
        Escribir "Elija una opción: "
        Leer opAdmin
		esperarLimpiar("")
		
		Segun opAdmin Hacer
			"1":
				//Gestiono Bibliotecarios
				Repetir					
                    Escribir "*** GESTIÓN DE BIBLIOTECARIOS ***"
                    Escribir "1. Agregar Bibliotecario"
                    Escribir "2. Eliminar Bibliotecario"
                    Escribir "3. Listar Bibliotecarios"
                    Escribir "0. Volver"
					espacio
                    Escribir Sin Saltar "Elija una opción: "
                    Leer resp
					esperarLimpiar("")
					
					Segun resp Hacer
						"1": 	//Agrego Bibliotecario
							Repetir
								//Asigno posición en el array
								indice <- -1
								Para i <- 0 Hasta cantBibliotecarios -1 Hacer
									Si bibliotecarios[i, 0] = "" Entonces
										indice <- i
										i <- cantBibliotecarios -1  
									FinSi
								FinPara
								
								Si indice <> -1 Entonces
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
											
											opUsuario <- confirmarInformacion("Confirma el ingreso? (S/N)")
											
											Si Mayusculas(opUsuario) = "S" Entonces
												bibliotecarios[indice, 0] <- nombreBibliotecario
												bibliotecarios[indice, 1] <- claveBibliotecario
												totalBibliotecarios <- totalBibliotecarios + 1
												Escribir "Bibliotecario agregado exitosamente."
												confirmar <- 1
											SiNo
												Escribir "Ingreso de bibliotecario ", nombreBibliotecario " cancelado"
												confirmar <- 1
											FinSi
										FinSi
									FinMientras
								SiNo									
									Escribir "No hay espacio disponible para agregar más bibliotecarios."
								FinSi
								
								opUsuario <- confirmarInformacion("Desea agregar otro bibliotecario? (S/N)")
								
								Si opUsuario = "S" Entonces
									Limpiar Pantalla
								Sino 	
									esperarLimpiar("Volviendo al Menú Anterior..")
								FinSi
								
							Hasta Que Mayusculas(opUsuario) = "N"
							
						"2":	//Elimino Bibliotecario							
                            Escribir "*** ELIMINAR BIBLIOTECARIO ***"
                            espacio
                            // Mostrar bibliotecarios existentes
                            Escribir "Bibliotecarios registrados:"
                            hayBibliotecarios <- Falso
							
                            Para i <- 0 Hasta cantBibliotecarios-1 Hacer
                                Si bibliotecarios[i, 0] <> "" Entonces
                                    Escribir i+1, ". ", bibliotecarios[i, 0], " - Clave: ", bibliotecarios[i, 1]
                                    hayBibliotecarios <- Verdadero
                                FinSi
                            FinPara
                            espacio
                            Si (hayBibliotecarios y totalBibliotecarios >1) Entonces 
								espacio
                                Escribir Sin Saltar "Ingrese el nombre del bibliotecario a eliminar: "
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
                                    
                                    opUsuario <- confirmarInformacion("Confirma que desea eliminar este bibliotecario? (S/N)")
                                    
                                    Si Mayusculas(opUsuario) = "S" Entonces
                                        bibliotecarios[indice, 0] <- ""
                                        bibliotecarios[indice, 1] <- ""
										totalBibliotecarios <- totalBibliotecarios - 1
                                        Escribir "Bibliotecario ", bibliotecarios[indice, 0], " eliminado exitosamente."
                                    Sino
                                        Escribir "Eliminación de bibliotecario ", bibliotecarios[indice, 0], " cancelada."
                                    FinSi
                                FinSi
								pedirTecla
                            Sino
                                Escribir "No puede borrar a todos los Bibliotecarios."
                            FinSi			
							//pedirTecla
						"3":
							//Muestro Bibliotecarios
							espacio
                            Escribir "*** LISTADO DE BIBLIOTECARIOS ***"          
							
                            Para i <- 0 Hasta cantBibliotecarios-1 Hacer
                                Si bibliotecarios[i, 0] <> "" Entonces
                                    Escribir "----------------------------------------"
                                    Escribir "Nombre: ", bibliotecarios[i, 0]
                                    Escribir "Clave: ", bibliotecarios[i, 1]
                                    //totalBibliotecarios <- totalBibliotecarios + 1
                                FinSi
                            FinPara
                            
                            Si totalBibliotecarios = 0 Entonces
                                Escribir "No hay bibliotecarios registrados." //No deberia pasar
                            Sino
								Escribir "----------------------------------------"
                                Escribir "Total de bibliotecarios registrados: ", totalBibliotecarios
								pedirTecla
                            FinSi
                            
						"0":
							esperarLimpiar("Volviendo al menú de Administrador...")
							
						De Otro Modo:
							Escribir "Eligió una opción inválida."
							espacio
							esperarLimpiar("Volviendo al menú Anterior...")
					Fin Segun
				Hasta Que resp == "0"
			"2": //Gestiono Socios
				Repetir
					espacio
					Escribir "*** GESTIÓN DE SOCIOS ***"
					espacio
					Escribir "1. Agregar Socio"
					Escribir "2. Modificar Socio"
					Escribir "3. Dar de Baja Socio"
					Escribir "4. Listar Socios"
					Escribir "0. Volver"
					Escribir Sin Saltar "Elija una opción: "
					Leer resp
					esperarLimpiar("")
					
					Segun resp Hacer
						"1":
							Repetir
								crearSocio(socios, cantSocios)
								opUsuario <- confirmarInformacion("Desea agregar otro socio? (S/N)")
								
								Si opUsuario = "S" Entonces
									Limpiar Pantalla
								Sino 	
									Escribir "Volviendo a Gestión de Socios..."
								FinSi
								
							Mientras Que (opUsuario <> "N")
						"2":
							modificarSocio(socios, cantSocios)
						"3":
							darDeBajaSocio(socios, cantSocios)
						"4":	
							Escribir "Listar socios... (en proceso)"
							Esperar 1 segundos
						"0":	
							esperarLimpiar("Volviendo al menú de Administrador...")
						De Otro Modo:
							esperarLimpiar("Opción incorrecta. Volviendo a Menú Administrador...")
					Fin Segun
					
				Hasta Que resp = "0"			
				
			"3":				
				//Gestiono Admins
				Repetir
					espacio
					Escribir "*** GESTIÓN DE ADMINISTRADORES ***"
					espacio
					Escribir "1. Agregar Administrador"
					Escribir "2. Eliminar Administrador"
					Escribir "3. Listar Administradores"
					Escribir "0. Volver"
					espacio
					Escribir Sin Saltar "Elija una opción "
					Leer resp
					esperarLimpiar("")
					Segun resp Hacer
						"1":  // Agregar Administrador							
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
											claveAdmin <- pedirNumeroComoTexto("Ingrese clave numérica (4 dígitos): ")
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
											espacio
										Sino
											Limpiar Pantalla
											Escribir "*** DATOS DEL NUEVO ADMINISTRADOR ***"
											Escribir "Nombre: ", nombreAdmin
											Escribir "Clave: ", claveAdmin
											
											opUsuario <- confirmarInformacion("Confirma el ingreso? (S/N)")
											
											Si opUsuario == "S" Entonces
												administradores[indice, 0] <- nombreAdmin
												administradores[indice, 1] <- claveAdmin
												Escribir "Administrador agregado exitosamente."
												confirmar <- 1
											SiNo
												Escribir "Ingreso de administrador ", nombreAdmin " cancelado"
												confirmar <- 1
											FinSi
										FinSi
									FinMientras
								FinSi
								
								opUsuario <- confirmarInformacion("Desea agregar otro administrador? (S/N)")
								
								Si opUsuario == "S" Entonces
									Limpiar Pantalla
								Sino 	
									Escribir "Volviendo a Gestión de Administradores..."
								FinSi								
								esperarLimpiar("")
							Hasta Que Mayusculas(opUsuario) = "N"
							
						"2":  // Eliminar Administrador  
							espacio
							Escribir "*** ELIMINAR ADMINISTRADOR ***"
							espacio
							// Mostrar admins existentes
							Escribir "Administradores registrados:"
							hayAdministradores <- Falso
							
							Para i <- 0 Hasta cantAdministradores-1 Hacer
								Si administradores[i, 0] <> "" Entonces
									Escribir i+1, ". ", administradores[i, 0], " - Clave: ", administradores[i, 1]
									hayAdministradores <- Verdadero
									cantAdmins <- i
								FinSi
							FinPara
							
							Si hayAdministradores Entonces
								Si cantAdmins = 1 Entonces
									espacio
									Escribir "NO SE PUEDE ELIMINAR AL ADMIN"
									Escribir "Debe haber al menos un administrador del Sistema"
								SiNo
									espacio
									Escribir "Ingrese el nombre del Administrador a eliminar: "
									Leer nombreAdmin
									nombreAdmin <- Mayusculas(nombreAdmin)
									
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
										dato <-administradores[indice, 0]
										opUsuario <- confirmarInformacion("¿Confirma que desea eliminar al administrador " + dato + "? (S/N)")	
										
										Si Mayusculas(opUsuario) = "S" Entonces
											administradores[indice, 0] <- ""
											administradores[indice, 1] <- ""
											Escribir "Administrador eliminado exitosamente."
										Sino
											Escribir "Eliminación cancelada."
										FinSi
									FinSi
								FinSi										
							FinSi
						"3":   // Listar Administradores
							
							espacio
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
							
							Si totalAdministradores = 0 Entonces //No deberia pasar, ver! 
								Escribir "No hay Administradores registrados."
							Sino
								Escribir "----------------------------------------"
								Escribir "Total de Administradores registrados: ", totalAdministradores
							FinSi
						"0": 
							esperarLimpiar("Volviendo al menú de Administrador...")
						De Otro Modo:
							esperarLimpiar( "Opción incorrecta")
					Fin Segun
				Hasta Que resp == "0"
			"0":	
				esperarLimpiar("Volviendo al Menú principal...")
			De Otro Modo:
				Escribir "Eligió una opción inválida."
		Fin Segun		
		
	Hasta Que opAdmin == "0"	
FinSubAlgoritmo


//Vista Bibliotecario
SubAlgoritmo bibliotecario(libros Por Referencia, cantLibros, socios Por Referencia, cantSocios, prestamos Por Referencia, cantPrestamos, camposPrestamos)
	Definir resp, modulo, op, opLibros, opSocios Como Caracter
	//Definir i, j Como Entero 
	
	Repetir
		mostrarMenuPpalBibliotecario
		Leer modulo		
		esperarLimpiar("")
		
		Segun modulo Hacer
			"1":
				Repetir
					mostrarMenuLibros
					Leer opLibros
					esperarLimpiar("")
					
					Segun opLibros Hacer
						"1": //Agregar Libros
							Repetir
								crearLibro(libros, cantLibros)
								
								resp <- confirmarInformacion("Desea agregar otro libro? (S/N)")
								
								Si resp = "S" Entonces
									Limpiar Pantalla
								Sino 	
									Escribir "Volviendo a Menú de Libros..."
								FinSi
								esperarLimpiar("")
							Mientras Que (resp<>"N")	
						"2": //Consultar Libros
							Repetir
								mostrarSubMenuConsultaLibros
								Leer op 			
								
								Segun op Hacer
									"1":
										buscarLibro(libros, cantLibros)
									"2":
										modificarLibro(libros, cantLibros)
									"3":	
										Limpiar Pantalla
										mostrarLibros(libros, cantLibros)
									"4":
										registrarPrestamo(libros, socios, prestamos, cantLibros, cantSocios, cantPrestamos)		
									"5":	
										mostrarPrestamos(prestamos, cantPrestamos)
									"6":
										registrarDevolucion(libros, socios, prestamos, cantLibros, cantSocios, cantPrestamos, camposPrestamos)
										espacio
									"0":
										esperarLimpiar("Volviendo a menu anterior...")
									De Otro Modo:
										esperarLimpiar("Eligió una opción inválida.")
								Fin Segun
							Hasta Que (op == "0")
						"0":							
							esperarLimpiar("Volviendo al menu principal...")
						De Otro Modo:
							Escribir "Eligió una opción inválida."
					Fin Segun
					
				Mientras que (opLibros <> "0")
			"2":
				Repetir
					mostrarMenuSocios
					Leer opSocios
					esperarLimpiar("")
					
					Segun opSocios Hacer
						"1": //Agregar Socios
							Repetir
								crearSocio(socios, cantSocios)
								
								resp <- confirmarInformacion("¿Desea agregar otro socio? (S/N)")
								
								Si resp = "S" Entonces
									Limpiar Pantalla
								Sino 	
									esperarLimpiar("Volviendo a Menú de Socios...")
								FinSi								
								
							Mientras Que (resp <> "N")
							
						"2": //Consultar Socios
							Repetir
								mostrarSubMenuConsultaSocios
								Leer op 
								esperarLimpiar("")
								Segun op Hacer
									"1":
										buscarSocio(socios, cantSocios)
									"2":
										modificarSocio(socios, cantSocios)
									"3":	
										darDeBajaSocio(socios, cantSocios)
									"4":	
										mostrarSocios(socios, cantSocios)
									"0":	
										esperarLimpiar("Volviendo a menú anterior...")
									De Otro Modo:
										Escribir "Eligió una opción inválida."
								Fin Segun
							Hasta Que (op == "0")
							
						"0": 
							esperarLimpiar("Volviendo a Menú Principal...")	
						De Otro Modo:
							esperarLimpiar("Eligió una opción inválida.")
					Fin Segun
					
				Hasta Que (opSocios == "0") 
			"0":
				esperarLimpiar("Volviendo a Menú de Usuarios...")	
			De Otro Modo:
				esperarLimpiar("Eligió una opción inválida.")
		Fin Segun
	Hasta Que (modulo == "0")
FinSubAlgoritmo

//*******************************************SOCIOS*******************************************************
//Vista Socios 
SubAlgoritmo socio (Libros Por Referencia, cantLibros, prestamos Por Referencia, cantPrestamos, socios Por Referencia, cantSocios)
	Definir op Como Caracter
	
	Repetir		
		
        Escribir "*** MENÚ SOCIOS ***"
		espacio
        Escribir "1. Ver Libros Disponibles"
		Escribir "2. Buscar Libros"
        Escribir "3. Ver mis préstamos activos"
        Escribir "4. Ver mi estado"
		Escribir "0. Volver al menú principal"
		espacio
        Escribir Sin Saltar "Elija una opción: "
        Leer op		
		esperarLimpiar("")
		
		Segun op Hacer
			"1":
				mostrarLibros(libros, cantLibros)
			"2":
				buscarLibro(libros, cantLibros)
			"3":
				mostrarPrestamoSocio(prestamos, cantPrestamos, libros, cantlibros)
			"4":
				mostrarCondicionSocio(socios, cantSocios)				
			"0":	
				esperarLimpiar("Volviendo a Menú anterior...")
			De Otro Modo:
				esperarLimpiar("Opción inválida")
		Fin Segun	
		
	Hasta Que op == "0"		
FinSubAlgoritmo

//*********************************************************FUNCIONES AUXILIARES****************************************************************************
SubProceso esperarLimpiar(mensaje)
	Escribir mensaje
	Esperar 2 segundos
	Limpiar Pantalla
FinSubProceso

SubProceso pedirTecla
	espacio
	Escribir "Presione una tecla para volver..."
	Esperar Tecla
	Esperar 2 Segundos
	Limpiar Pantalla	
FinSubProceso

//Respuesta S/N
Funcion respuesta<-confirmarInformacion(mensaje) 
	Definir respuesta Como Caracter	
	Repetir
		espacio
		Escribir mensaje
		Leer respuesta
		respuesta <- Mayusculas(respuesta)	
		
		Mientras respuesta <> "S" Y respuesta <> "N"
			Escribir "Por favor ingrese S para Sí o N para No."	
			Leer respuesta
			respuesta <- Mayusculas(respuesta)	
		FinMientras
	Hasta Que (respuesta == "S" O respuesta == "N")
FinFuncion


//Asigno posición a nuevo ingreso en matriz
Funcion posicion<-buscarUltimo(matriz, cantDefinida) 
    Definir i, posicion Como Entero
    i <- 0	
    Mientras i < cantDefinida Y matriz[i, 0] <> "" Hacer
        i <- i + 1
    FinMientras	
    Si i < cantDefinida-1 Entonces
        posicion <- i
    Sino
        posicion <- -1
    FinSi
FinFuncion

//Valido Texto (para ingresos por 1ra vez)
Funcion esTextoValido <- ValidarTexto(cadenaAVerificar)
	Definir i Como Entero
	Definir letra Como Caracter
	Definir esTextoValido Como Logico
	esTextoValido <-  Verdadero
	
	//Verifico que no ingrese vacio
	Si Longitud(cadenaAVerificar) = 0 Entonces
        esTextoValido <- Falso        
    FinSi
	
	Para i<-0 Hasta Longitud(cadenaAVerificar)-1 Con Paso 1 Hacer
		letra <- Subcadena(cadenaAVerificar, i ,i)	
		Si (letra < "A" o letra > "Z") y (letra < "a" o letra > "z") y (letra <> "á") y (letra <> "é") y (letra <> "í") y (letra <> "ó") y (letra <> "ú") y (letra <> "Á") y (letra <> "É") y (letra <> "Í") y (letra <> "Ó") y (letra <> "Ú") y (letra <> "ñ") y (letra <> "Ñ") y (letra <> " ") Entonces
			esTextoValido <- Falso            	
		FinSi
	Fin Para	
FinFuncion

//Pido Texto
Funcion txt <- pedirTexto(mensaje)
	Definir input, txt como Cadena
	Definir esTextoValido Como Logico
	esTextoValido <-  Falso
	
	Mientras !esTextoValido Hacer
		espacio
		Escribir Sin Saltar mensaje
		Leer input
		input<-Mayusculas(input)
		
		Si validarTexto(input)=Verdadero Entonces
			esTextoValido <- Verdadero
		SiNo
			Escribir "Ingrese un texto válido"
		FinSi
	Fin Mientras
	txt <- input
FinFuncion

//Pido Texto Opcional (para modificaciones) 
Funcion txtOpcional <- pedirTextoOpcional(mensaje, valorActual)
	
	Definir i Como Entero
	Definir resp, txtOpcional como Cadena
	Definir letra Como Caracter
	Definir esTextoValido Como Logico
	esTextoValido <- Falso
	
	//Verifico: si ingresa vacio, queda el valor anterior. Si no: valida q sea texto el nuevo ingreso	 
	Repetir
		Escribir Sin Saltar mensaje
		Leer resp
		
		Si Longitud(resp) = 0 Entonces
			txtOpcional <- valorActual 
			Escribir "Se mantendrá el valor actual: ", valorActual
			esTextoValido <- Verdadero
		Sino
			Para i<-0 Hasta Longitud(resp)-1 Con Paso 1 Hacer
				letra <- Subcadena(resp, i ,i)	
				Si (letra < "A" o letra > "Z") y (letra < "a" o letra > "z") y (letra <> "á") y (letra <> "é") y (letra <> "í") y (letra <> "ó") y (letra <> "ú") y (letra <> "Á") y (letra <> "É") y (letra <> "Í") y (letra <> "Ó") y (letra <> "Ú") y (letra <> "ñ") y (letra <> "Ñ") y (letra <> " ") Entonces
					esTextoValido <- Falso	
				Sino 
					esTextoValido <- Verdadero
				FinSi
			Fin Para	
			Si !esTextoValido
				Escribir "Error. El nombre sólo puede contener letras"				
			FinSi
		FinSi	
	Hasta Que esTextoValido	
    
	Si esTextoValido
		txtOpcional <- resp		
	FinSi	
FinFuncion

//Valido Números
Funcion esNumero <- EsNumeroEnteroPositivo(cadenaAVerificar)
	Definir i, valorNum, cantMaxDigitos Como Entero
	Definir letra Como Caracter
	Definir esNumero Como Logico
	esNumero <- Falso
	cantMaxDigitos <- 15
	
	Si Longitud(cadenaAVerificar) <= cantMaxDigitos Entonces        
        //esNumero <- Falso
		
		Para i <- 0 Hasta Longitud(cadenaAVerificar) -1 Hacer
			letra <- Subcadena(cadenaAVerificar,i,i) //recorro x caracter
			Si (letra > "0" y letra < "9") y Longitud(cadenaAVerificar) < cantMaxDigitos Entonces 
				esNumero <- Verdadero	
			SiNo
				esNumero <- Falso
			FinSi		
		FinPara
		Si esNumero Entonces
			valorNum <- trunc(ConvertirANumero(cadenaAVerificar))
			Si valorNum>=0
				esNumero <- Verdadero
			SiNo
				esNumero <- Falso
			FinSi	
		FinSi
	FinSi	
FinFuncion


//Pido numeros
Funcion num <- pedirNumero(mensaje)
	definir num, cantMaxDigitos Como Entero
	Definir esNumero Como Logico
	definir numInput, input como cadena
	esNumero <- Falso	
	cantMaxDigitos <- 15
	
	Mientras !esNumero Hacer
		espacio
		Escribir Sin Saltar mensaje
		
		leer numInput
		Si Longitud(numInput)>cantMaxDigitos Entonces
			Escribir "El número es demasiado largo"
		SiNo
			input <- (numInput)		
		FinSi	
		
		Si (EsNumeroEnteroPositivo(numInput)=Verdadero) Entonces
			esNumero <- Verdadero
		SiNo
			Escribir "Ingrese un numero válido"
		FinSi
	FinMientras
	num <- ConvertirANumero(numInput)
FinFuncion

// Pido un número pero lo devuelvo como texto
Funcion numTexto <- pedirNumeroComoTexto(mensaje)
    Definir num Como Entero
    Definir numTexto Como Cadena
    num <- pedirNumero(mensaje) // ya validado como número
	numTexto <- ConvertirATexto(num)    
FinFuncion

//Pido un número (opcional) y devuelvo como texto - para modificaciones
Funcion numTexto <- pedirNumeroComoTextoOpcional(mensaje, valorActual)
    Definir num, cantMaxDigitos Como Entero
    Definir numTexto, resp Como Cadena
    Definir esNumero Como Logico
	cantMaxDigitos <- 15
	
	espacio
    Escribir Sin Saltar mensaje
    Leer resp
	
    Si Longitud(resp) = 0 Entonces
        numTexto <- valorActual
    Sino Si Longitud(resp) > cantMaxDigitos Entonces
			Escribir "El número es demasiado largo"
            numTexto <- pedirNumeroComoTextoOpcional(mensaje, valorActual) 
		sino	
			esNumero <- EsNumeroEnteroPositivo(resp)
			Si esNumero Entonces
				num <- ConvertirANumero(resp)
				numTexto <- ConvertirATexto(num)
			FinSi			
        FinSi
    FinSi
FinFuncion


Funcion fechaDev <- pedirFechaDevolucion
    Definir anio, mes, dia Como Entero
    Definir fechaDev Como Cadena
    
    espacio
    Escribir "*** FECHA DE DEVOLUCIÓN ***"
    anio <- pedirNumero("Ingrese el año de devolución (AAAA): ")
	Mientras  anio<2025 o anio > 2026
		Si anio<2025 Entonces
			Escribir "No puede registrar devolución con fecha anterior"
			anio <- pedirNumero("Ingrese el año de devolución (AAAA): ")
		SiNo si anio > 2026		
				Escribir "No puede registrar devoluciones tan atrasadas"
				anio <- pedirNumero("Ingrese el año de devolución (AAAA): ")		
			FinSi	
		FinSi
	FinMientras
		
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

//Guardo fechaDev como entero para calcularPenalidad
Funcion fechaDevNum <- convertirFechaEntero(fechaDev)
	Definir fechaDevNum, dia, mes, anio Como Entero
	
	//Extraigo datos de cadena fechaDev
	dia <- ConvertirANumero(SubCadena(fechaDev, 0, 1))
    mes <- ConvertirANumero(SubCadena(fechaDev, 3, 4))
    anio <- ConvertirANumero(SubCadena(fechaDev, 6, 9))
	
	// Convierto a formato AAAAMMDD
    fechaDevNum <- anio * 10000 + mes * 100 + dia	
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
Funcion idUnico <- generarId(cantLibros)
	Definir totalGenerados, i, j, nuevoId, repetido, generados Como Entero
	Definir idUnico como Cadena
	Dimension generados[cantLibros]
	totalGenerados <- 0
	
	Repetir	
		nuevoID <- Aleatorio(10000, 99999) 		
		// Verifico si ya existe
		repetido <- 0
		si totalGenerados>0
			Para j <- 1 Hasta cantLibros
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

//*******************************************************FUNCIONES LIBROS*******************************************************
//Crear libro
funcion crearLibro(libros Por Referencia, cantLibros)
	Definir idLibro, tituloLibro, autorLibro, generoLibro, anoPublicacionLibro, stockLibro, opUsuario como caracter
	Definir confirmar, indice, numTemporal, stockTemporal Como Entero
	confirmar <- 0
	indice <- buscarUltimo(libros, cantLibros) 
	Mientras confirmar = 0 Hacer
		espacio
		Escribir "***INGRESO DE NUEVO LIBRO***"
		espacio
		idLibro<-generarId(cantLibros)
		tituloLibro<-pedirTexto("Ingrese Nombre del libro: ")
		autorLibro<-pedirTexto("Ingrese Autor: ")
		generoLibro<-pedirTexto("Ingrese Género: ")
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
		espacio
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
		
		opUsuario <- confirmarInformacion("Confirma ingreso? (S/N)")		
		esperarLimpiar("")
		Si Mayusculas(opUsuario) = "S" Entonces
			confirmar <- 1
			Escribir "Ingreso del libro ", tituloLibro " confirmado"				
		Sino	
			Escribir "Ingreso del libro ", tituloLibro " no confirmado"	
			confirmar <- 1
		FinSi
		
		esperarLimpiar("")
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
//Funcion cantResultados<-filtrarPorCriterio(libros, columna, filtro, resultados, cantLibros)
//    Definir i, cantResultados Como Entero
//    i <- 0
//    cantResultados <- 0	
//    Mientras i < cantLibros Hacer
//        Si libros[i, 0] <> "" Entonces
//            Si libros[i, columna] = filtro Entonces
//                resultados[cantResultados] <- i
//                cantResultados <- cantResultados + 1
//            FinSi
//        FinSi
//        i <- i + 1
//    FinMientras	
//FinFuncion

//Cuenta coincidencias segun filtro parcial en cadena
Funcion cantResultados<-filtrarPorCriterio(matriz, columna, filtro, resultados, cantDefinida)
	Definir i, j, cantResultados, longFiltro, longTexto Como Entero
	Definir txt como Cadena
	Definir encontrado Como Logico
	
	i <- 0
	cantResultados <- 0
	longFiltro <- Longitud(filtro)
	
	Mientras i < cantDefinida Hacer
        Si matriz[i, 0] <> "" Entonces
			//Cuento caracteres de columna no vacía en la que voy a buscar
            longTexto <- Longitud(matriz[i, columna])
            encontrado <- Falso
			//busco subcadena en cada columna (similar al de nros cuando verifico)
			j <- 0
            Mientras j <= longTexto - longFiltro y !encontrado Hacer
                txt <- SubCadena(matriz[i, columna], j, j + longFiltro - 1)
                Si txt = filtro Entonces
                    encontrado <- Verdadero
                FinSi
                j <- j + 1
            FinMientras			
			
            Si encontrado Entonces
                resultados[cantResultados] <- i
                cantResultados <- cantResultados + 1
            FinSi
        FinSi
        i <- i + 1
    FinMientras	
	
FinFuncion


//Buscar Libros
Funcion buscarLibro(libros Por Referencia, cantLibros)
	Definir tituloLibro, autorLibro, generoLibro, anoPublicacionLibro, opUsuario como caracter
	Definir columna, resultados, i, indice, cantidad, opUsuarioNum Como Entero
	Definir criterio como Cadena
	Dimension resultados[cantLibros]
	
	//Inicializo resultados
	Para i <- 0 Hasta cantLibros-1 Hacer		
		resultados[i] <- -1
	FinPara
	
	Repetir
		esperarLimpiar("")
		Escribir "**BÚSQUEDA DE LIBRO**"
		espacio
		Escribir "Elija un criterio de búsqueda"
		Escribir "1. Id"
		Escribir "2. Título"
		Escribir "3. Autor"
		Escribir "4. Género"
		Escribir "5. Año de publicación"
		Escribir "6. Volver"
		espacio
		Escribir Sin Saltar "Ingrese una opción (1-6): "
		Leer opUsuario		
		esperarLimpiar("")
		
		Segun opUsuario Hacer
			"1":
				columna<-0
				Escribir Sin Saltar "Ingrese id a buscar: "
				Leer criterio
			"2":
				columna<-1
				Escribir Sin Saltar "Ingrese título a buscar: "
				Leer criterio			
				criterio<-Mayusculas(criterio)
			"3":
				columna<-2
				Escribir Sin Saltar "Ingrese autor a buscar: "
				Leer criterio			
				criterio<-Mayusculas(criterio)
			"4":
				columna<-3
				Escribir Sin Saltar "Ingrese género a buscar: "
				Leer criterio			
				criterio<-Mayusculas(criterio)
			"5":
				columna<-4
				Escribir Sin Saltar "Ingrese año de publicación a buscar: "
				Leer criterio
			"6":
				Escribir "Volviendo al menú anterior..."
				Limpiar Pantalla
			De Otro Modo:
				esperarLimpiar("Eligió una opción inválida.")
		Fin Segun
		
		Si opUsuario=="1" o opUsuario=="2" o opUsuario=="3" o opUsuario=="4" o  opUsuario=="5"  Entonces
			cantidad<-filtrarPorCriterio(libros, columna, criterio, resultados, cantLibros)	
			
			// Mostrar resultados si hay coincidencias
			Si cantidad = 0 Entonces
				esperarLimpiar("No se encontraron libros con ese criterio.")
			Sino
				Para i <- 0 Hasta cantidad - 1 Hacer
					indice <- resultados[i]
					Escribir""
					Escribir "Libro encontrado:"
					Escribir "Id: ", libros[indice, 0]
					Escribir "Título: ", libros[indice, 1]
					Escribir "Autor: ", libros[indice, 2]
					Escribir "Género: ", libros[indice, 3]
					Escribir "Año: ", libros[indice, 4]
					//Escribir "Disponible: ", libros[indice, 5]
					Escribir "Stock: ", libros[indice, 7]
					espacio
				FinPara
				Escribir "------------------------------------------------------------"
				Escribir "FIN DEL LISTADO DE LIBROS ENCONTRADOS"
				pedirTecla
			FinSi			
		FinSi 
	Mientras Que opUsuario <>"6"		
	 
FinFuncion

//Modificar Libro
Funcion modificarLibro(libros Por Referencia, cantLibros)
    Definir i, idBuscado, indice, confirmar, nuevoDatoNum Como Entero
    Definir opUsuario, nuevoDato, tituloLibro, autorLibro, generoLibro, anoPublicacionLibro, stockLibro Como Cadena
	Definir datoValido Como Logico
	
    // Pedir el ID del libro a modificar
	espacio
	Escribir "**MODIFICACIÓN DE LIBRO**"
	espacio
    Escribir Sin Saltar "Ingrese el ID del libro a modificar: "
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
			espacio
            Escribir "Ingrese los nuevos datos (dejar vacío para no cambiar):"
			espacio
			nuevoDato <- pedirTextoOpcional("Nuevo Título: ", tituloLibro)
			nuevoDato <- Mayusculas(nuevoDato)
			Si Longitud(nuevoDato) > 0 Entonces
				tituloLibro <- nuevoDato
			FinSi	
			
			nuevoDato <- pedirTextoOpcional("Nuevo Autor: ", autorLibro)
			nuevoDato <- Mayusculas(nuevoDato)
			Si Longitud(nuevoDato) > 0 Entonces
				autorLibro <- nuevoDato
			FinSi	
			
			nuevoDato <- pedirTextoOpcional("Nuevo Género: ", generoLibro)
			nuevoDato <- Mayusculas(nuevoDato)
			Si Longitud(nuevoDato) > 0 Entonces
				generoLibro <- nuevoDato
			FinSi	
			
			anoPublicacionLibro <- pedirNumeroComoTextoOpcional("Nuevo Año de Publicacion: ", anoPublicacionLibro)
			
			stockLibro <- pedirNumeroComoTextoOpcional("Nueva cantidad de ejemplares: ", stockLibro)

			esperarLimpiar("")
            Escribir "***DATOS DEL LIBRO MODIFICADOS***"
			espacio
            Escribir "ID: ", libros[indice,0]
            Escribir "Titulo: ", tituloLibro
            Escribir "Autor: ", autorLibro
            Escribir "Genero: ", generoLibro
            Escribir "Año de Publicacion: ", anoPublicacionLibro
			Escribir "Stock: ", stockLibro
			
			opUsuario <- confirmarInformacion( "Confirma los cambios? (S/N)")
			Esperar 1 Segundos
			
            Si Mayusculas(opUsuario) = "S" Entonces
                confirmar <- 1
				Escribir "Cambios confirmados"				
			Sino	
				Escribir "Cambios no confirmados"
				confirmar <- 1
            FinSi
			espacio
			esperarLimpiar("Volviendo a Sub Menu Consulta de Libros...")
        FinMientras
		
        // Guardo cambios en la matriz
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
	espacio
	Para i <- 0 Hasta cantLibros-1		
		Si libros[i,0] <> "" Entonces
			Escribir "----------------------------------------"
			Escribir "ID: ", libros[i,0]
			Escribir "Titulo: ", libros[i,1]
			Escribir "Autor: ", libros[i,2]
			Escribir "Genero: ", libros[i,3]
			Escribir "Año de Publicacion: ", libros[i,4]
			//Escribir "Disponible: ", libros[i,5]
			Escribir "Cantidad de ejemplares disponibles para préstamo: ", libros[i,7]
			Si libros[i,8]="" Entonces
				Escribir "No hay ejemplares de este libro en préstamo"
			Sino 
				Escribir "Cantidad de ejemplares en préstamo: ", libros[i,8]	
			FinSi
		FinSi
	FinPara
	espacio
	Escribir "	--------------FIN DEL LISTADO DE LIBROS CARGADOS-----------------"	
	pedirTecla
FinFuncion


//***************************************************** FUNCIONES SOCIOS****************************************************************
//Crear socio
Funcion crearSocio(socios Por Referencia, cantSocios)
	Definir opUsuario, dniSocio, nombreSocio, telSocio, condSocio, socioRegistrado como caracter
	Definir i, confirmar, indice, numTemporal Como Entero
	Definir existeSocio, confirma Como Logico
	existeSocio <- Falso 
	confirma <- Falso
	indice <- buscarUltimo(socios, cantSocios) 
	
	Mientras !confirma Hacer
		espacio
		Escribir "***INGRESO DE NUEVO SOCIO***"
		espacio
		dniSocio <- pedirNumeroComoTexto("Ingrese DNI del socio: ")
		
		Para i<-0 Hasta cantSocios-1 Con Paso 1 Hacer
			Si dniSocio = socios[i, 0] Entonces
				socioRegistrado <- socios[i, 1]
				existeSocio <- Verdadero				
			FinSi
		Fin Para
		
		Si existeSocio Entonces
			Escribir "Ya existe el socio ", socioRegistrado " registrado con ese DNI"
			confirma <- Verdadero
			esperarLimpiar("")
		Sino	
			nombreSocio<-pedirTexto("Ingrese Nombre y Apellido del socio: ")
			telSocio <- pedirNumeroComoTexto("Ingrese el teléfono: ")
			condSocio <- "HABILITADO"
			Limpiar Pantalla
			
			Escribir "***DATOS DEL NUEVO SOCIO***"
			espacio
			Escribir Sin Saltar "DNI del socio: "
			Escribir dniSocio
			Escribir Sin Saltar "Nombre y Apellido: "
			Escribir nombreSocio
			Escribir sin saltar "Teléfono: "
			Escribir telSocio
			Escribir sin saltar "Condición: "
			Escribir condSocio			
			espacio
			opUsuario <- confirmarInformacion("Confirma ingreso? (S/N)")
			Esperar 1 segundo
			
			Si Mayusculas(opUsuario) = "S" Entonces
				confirma <- Verdadero
				Escribir "Ingreso del Socio ", nombreSocio " confirmado"		
				// Guardo cambios en la matriz
				socios[indice, 0] <- dniSocio
				socios[indice, 1] <- nombreSocio
				socios[indice, 2] <- telSocio
				socios[indice, 3] <- condSocio
			Sino	
				Escribir "Ingreso del Socio ", nombreSocio " cancelado"
				confirmar <- 1
			FinSi
		FinSi
		esperarLimpiar("")		
	FinMientras	
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
		esperarLimpiar("")
		Escribir "**BÚSQUEDA DE SOCIO**"
		espacio
		Escribir "Elija un criterio de búsqueda"
		Escribir "1. DNI"
		Escribir "2. Nombre"
		Escribir "3. Condición"
		Escribir "4. Volver"
		espacio
		Escribir Sin Saltar "Ingrese una opción (1-4): "
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
					Escribir "Ingrese Condición a buscar (H = HABILITADO / I = INHABILITADO / M = MULTADO): "
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
				esperarLimpiar("Volviendo al menú de Socios...")
			De Otro Modo:
				Escribir "Eligió una opción inválida."				
		Fin Segun	
	Hasta Que opUsuario >= 1 Y opUsuario <= 4
	
	Si opUsuario >= 1 Y opUsuario <= 3 Entonces
		cantidad<-filtrarPorCriterio(socios, columna, criterio, resultados, cantSocios)
		// Mostrar resultados si hay coincidencias
		Si cantidad = 0 Entonces
			Escribir "No se encontraron socios con ese criterio."
		Sino
			Para i <- 0 Hasta cantidad - 1 Hacer
				indice <- resultados[i]
				espacio
				Escribir "-------------Socio encontrado-------------"
				espacio
				Escribir "DNI: ", socios[indice, 0]
				Escribir "Nombre y apellido: ", socios[indice, 1]
				Escribir "Teléfono: ", socios[indice, 2]
				Escribir "Condición: ", socios[indice, 3]
				si socios[indice, 3] =  "MULTADO" Entonces
					Escribir "Multado hasta: ", socios[indice, 4]
				FinSi
				Escribir "Estado: ", socios[indice, 5]  
				pedirTecla
				espacio
			FinPara
		FinSi	
	FinSi			
FinFuncion

//Modificar Socio
Funcion modificarSocio(socios Por Referencia, cantSocios)
    Definir i, indice, confirmar Como Entero
    Definir op, opUsuario, nuevoDato, nombreSocio,telSocio,condSocio, penalizacionSocio, idBuscado Como Cadena
	
    // Pedir el dni del socio a modificar
	espacio
	Escribir "**MODIFICACIÓN DE SOCIO**"
	espacio
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
        // Cargo datos actuales en variables temporales
        nombreSocio<- socios[indice,1]
        telSocio <- socios[indice,2]
        condSocio <- socios[indice,3]		
        confirmar <- 0
		
		Si socios[indice, 5]  = "BAJA" Entonces
			espacio 
			op <- confirmarInformacion("El Socio buscado está dado de baja, desea reactivarlo? (S/N)")
			
			Segun op Hacer
			"S":	
				esperarLimpiar("Reactivando socio...")
				socios[indice, 5] <- "ACTIVO"
				condSocio <- "HABILITADO"
				
				Mientras confirmar = 0 Hacer
					esperarLimpiar("")
					Escribir "***DATOS ACTUALES DEL SOCIO***"
					Escribir "DNI: ", socios[indice,0]
					Escribir "Nombre y apellido: ", nombreSocio
					Escribir "Teléfono: ", telSocio
					Escribir "Condición: ", condSocio
					Escribir "Estado: ", socios[indice, 5]  
					Escribir "Ingrese los nuevos datos (dejar vacío para no cambiar):"
					espacio					
					nuevoDato <- pedirTextoOpcional("Nuevo Nombre y apellido: ", nombreSocio)
					nuevoDato <- Mayusculas(nuevoDato)
					Si Longitud(nuevoDato)>0 Entonces
						nombreSocio <-  nuevoDato				
					FinSi			
					
					telSocio <- pedirNumeroComoTextoOpcional("Nuevo Teléfono: ", telSocio)		
					
					Escribir Sin Saltar "Nueva Condición (H = HABILITADO / I = INHABILITADO / M = MULTADO): " //habría que ver, si está inhabilitado o multado es x causa
					Leer nuevoDato	
					nuevoDato <- Mayusculas(nuevoDato)
					Si Longitud(nuevoDato) > 0 Entonces
						Si (nuevoDato <> "H" y nuevoDato <> "I" y nuevoDato <> "M")
							Escribir "Eligió una condición inválida, permanecerá la anterior"
						SiNo					
							condSocio <- nuevoDato
						FinSi
						Segun condSocio Hacer
							"H":
								condSocio <- "HABILITADO"
							"I":
								condSocio <- "INHABILITADO"
							"M":
								condSocio <- "MULTADO"
								Escribir "Ingrese los dias de penalización: "
								leer penalizacionSocio
						Fin Segun
					FinSi			
					esperarLimpiar("")
					Escribir "***DATOS DEL SOCIO MODIFICADOS***"
					Escribir "DNI: ", socios[indice,0]
					Escribir "Nombre y apellido: ", nombreSocio
					Escribir "Teléfono: ", telSocio
					Escribir "Condición: ", condSocio
					Escribir "Estado: ", socios[indice,5]
					espacio
					opUsuario <- confirmarInformacion("Confirma los cambios? (S/N)")            
					espacio
					Esperar 1 segundo
					
					Si Mayusculas(opUsuario) = "S" Entonces
						confirmar <- 1
						Escribir "Cambios del Socio ", nombreSocio " confirmados"				
					Sino	
						Escribir "Cambios no confirmados"
						confirmar <- 1
					FinSi
					esperarLimpiar("")
				FinMientras
				
				pedirTecla
				
			"N":
				Escribir "El socio ", nombreSocio " continúa dado de baja."
				pedirTecla
			FinSegun
			
		FinSi        
		
        // Guardo cambios en la matriz
        socios[indice,1] <- nombreSocio
        socios[indice,2] <- telSocio
        socios[indice,3] <- condSocio
    FinSi
FinFuncion

//Dar de Baja Socio
Funcion darDeBajaSocio(socios Por Referencia, cantSocios)
    Definir dniSocio, opUsuario, nombreSocio Como Caracter
    Definir i, indice Como Entero
	Definir confirmar como Logico
    confirmar <- Falso
    
    Mientras !confirmar Hacer
        espacio
        Escribir "***DAR DE BAJA SOCIO***"
        espacio
        dniSocio <- pedirNumeroComoTexto("Ingrese DNI del socio a dar de baja: ")
        
        // Busco el socio
        indice <- -1
        Para i <- 0 Hasta cantSocios - 1 Hacer
            Si socios[i, 0] = dniSocio Entonces
                indice <- i
                i <- cantSocios 
            FinSi
        FinPara
        
        Si indice = -1 Entonces
            Escribir "No se encontró ningún socio con DNI: ", dniBaja
            esperarLimpiar("Presione una tecla para continuar...")            
        FinSi
        
        nombreSocio <- socios[indice, 1]
        
        // Verifico que no tenga libros en préstamo
        Si socios[indice, 4] <> "" Entonces
            Escribir "El socio ", nombreSocio, " tiene un libro en préstamo."
            Escribir "No se puede dar de baja hasta que devuelva el libro."
            esperarLimpiar("Presione una tecla para continuar...")
		SiNo
			Limpiar Pantalla
			Escribir "***DATOS DEL SOCIO A DAR DE BAJA***"
			espacio
			Escribir Sin Saltar "DNI del socio: "
			Escribir socios[indice, 0]
			Escribir Sin Saltar "Nombre y Apellido: "
			Escribir socios[indice, 1]
			Escribir sin saltar "Teléfono: "
			Escribir socios[indice, 2]
			Escribir sin saltar "Condición actual: "
			Escribir socios[indice, 3]
			Escribir "No tiene Libros en préstamo"
			
			espacio
			opUsuario <- confirmarInformacion("¿Confirma la baja del socio? (S/N)")
			Esperar 1 segundo
			
			Si Mayusculas(opUsuario) = "S" Entonces
				confirmar <- Verdadero
				// Cambio estado
				socios[indice, 3] <- "INHABILITADO"
				socios[indice, 5] <- "BAJA"
				Escribir "Baja del Socio ", nombreSocio, " confirmada"    
				pedirTecla
			Sino    
				Escribir "Baja del Socio ", nombreSocio, " cancelada"
				confirmar <- Verdadero
			FinSi
        FinSi     
        
        esperarLimpiar("")        
    FinMientras
FinFuncion


//Muestro socios cargados
Funcion mostrarSocios(socios Por Referencia, cantSocios)
	Definir i Como Entero
	Escribir "*** LISTA DE SOCIOS CARGADOS ***"	
	Para i <- 0 Hasta cantSocios-1   
		Si socios[i,0] <> "" Entonces
			Escribir "----------------------------------------"
			Escribir "DNI: ", socios[i,0]
			Escribir "Nombre y apellido: ", socios[i,1]
			Escribir "Teléfono: ", socios[i,2]
			Escribir "Condición: ", socios[i,3]
				Si socios[i,3] = "MULTADO" Entonces
					Escribir "Multado hasta: ", socios[i,4]
				FinSi
			Escribir "Estado: ", socios[indice, 5]  
		FinSi
	FinPara
	espacio
	Escribir "				FIN DEL LISTADO DE SOCIOS CARGADOS"
	pedirTecla
FinFuncion


//Fecha préstamo -- fechaFinPrestamo 
Funcion fechasPrestamo(fechaInicio Por Referencia, fechaFinPrestamo Por Referencia)
	Definir fecha, anio, mes, dia, diasASumar, diasMes, diasRestantesMes Como Entero
	Definir diaTemp, mesTemp, anioTemp como Cadena
	
    fecha <- FechaActual() 
    anio <- trunc(fecha / 10000)
    mes <- trunc((fecha MOD 10000) / 100)
    dia <- fecha MOD 100
	
	espacio
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
	espacio
	
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
	
	espacio
	Escribir "-------------Datos del Libro---------------"
	Escribir "ID: ", libros[indiceLibro,0]
	Escribir "Titulo: ", libros[indiceLibro,1]
	Escribir "Autor: ", libros[indiceLibro,2]
	Escribir "Genero: ", libros[indiceLibro,3]
	Escribir "Año de Publicacion: ", libros[indiceLibro,4]
	espacio
FinSubProceso


//Muestro préstamo activo - para Socios
SubProceso mostrarPrestamoSocio(prestamos Por Referencia, cantPrestamos, libros Por Referencia, cantLibros)
	Definir i, indicePrestamo Como Entero
	definir dniSocio, idLibro, fechaPrestamo como Cadena
	indicePrestamo <- -1
	
	Escribir "Ingrese su DNI para ver préstamos activos"
	Leer dniSocio
	
	Para i <- 0 Hasta cantPrestamos-1 Hacer
		Si dniSocio = prestamos[i,1]  Entonces
			indicePrestamo <- i
			idLibro <- prestamos[i,0]
			fechaPrestamo <- prestamos[i,2]
		FinSi
	FinPara
	
	Si indicePrestamo  = -1 Entonces
		Escribir "El socio con DNI ", dniSocio " no tiene préstamos activos."
	SiNo
		//Busco el préstamo activo para el socio
		Escribir "El socio con DNI ", dniSocio " tiene en préstamo:"
		Para i <- 0 Hasta cantLibros-1 Hacer
			Si libros[i,0] = idLibro Entonces
			indiceLibro <- i
			mostrarLibroEncontrado(libros, i)
			FinSi
		FinPara
		pedirTecla
	FinSi			
FinSubProceso

//Mostrar Condición - para socios
SubProceso mostrarCondicionSocio(socios Por Referencia, cantSocios)
	Definir i, indice Como Entero
	definir dniSocio, condSocio como Cadena
	indice <- -1
	
	Escribir sin saltar "Ingrese DNI para ver su condición"
	Leer dniSocio
	
	Para i <- 0 Hasta cantSocios-1 Hacer
		Si dniSocio == socios[i,0]  Entonces
			indice <- i
			condSocio <- socios[i,3]			
		FinSi
	FinPara	
	Si indice = -1 Entonces
		Escribir "No se encontro el socio con DNI ", dniSocio 
	Sino	
		Escribir "La condición del socio DNI ", dniSocio, " es: ", condSocio
	FinSi
	espacio
	esperarLimpiar("Volviendo al menu anterior...")	
FinSubProceso


//Registro préstamo
Funcion registrarPrestamo(libros Por Referencia, socios Por Referencia, prestamos Por Referencia, cantLibros, cantSocios, cantPrestamos)
    Definir i, j, disponible, indiceLibro, indiceSocio, k, p, stockActual Como Entero
    Definir idBuscado, dniBuscado, op, fechaPrestamo, fechaFinPrestamo, fechaFormateada Como Cadena
    disponible <- -1
    indiceSocio <- -1
    p <- 0
	
	esperarLimpiar("")
    Escribir "REGISTRAR PRÉSTAMO DE LIBRO"
	espacio
    Escribir Sin Saltar "Ingrese id del libro a prestar: "
    Leer idBuscado
	espacio
	
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
						
						op <- confirmarInformacion("Desea registrar préstamo (S/N)?")
							
                        Segun op Hacer
                            "S":
                                Escribir "Registrando préstamo..." 
                                esperar 1 segundo
								
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
								
								// Busco la primera fila vacia en prestamos y guardamos el indice en p
								Para k <- 0 Hasta cantPrestamos-1 Hacer
									Si prestamos[k,0] = "" Entonces
										p <- k
									FinSi
								FinPara
								
								//Guardo los datos en la columna del indice p
                                prestamos[p,0] <- idBuscado
								prestamos[p,1] <- dniBuscado
                                prestamos[p,2] <- fechaPrestamo
                                prestamos[p,3] <- fechaFinPrestamo
								prestamos[p,4] <- socios[indiceSocio,1]
								prestamos[p,5] <- libros[indiceLibro,1]
								
                                libros[indiceLibro,6] <- fechaFinPrestamo
                                socios[indiceSocio,3] <- "INHABILITADO" // tiene préstamo activo
								socios[indiceSocio,4] <- "0"  // Reinicio días de penalizacion
                                Escribir "Préstamo del Libro ", libros[indiceLibro,1] " para el socio ", socios[indiceSocio,1] " registrado con éxito"
								espacio
								Escribir "Stock restante del libro: ", stockActual
								pedirTecla
                            "N":
								esperarLimpiar("Volviendo a consultas...")
                            De Otro Modo:
                                Escribir "Opción inválida"
                        Fin Segun
                    "INHABILITADO":
                        Escribir "Socio INHABILITADO, ya tiene un préstamo activo"
						pedirTecla
                    "MULTADO":						
						fechaFormateada <- formatearFecha(socios[indiceSocio,4])
                        Escribir "Socio MULTADO, no puede sacar libros hasta el día ", fechaFormateada
						pedirTecla
                FinSegun
            FinSi
        Sino
			esperarLimpiar("El libro " + libros[indiceLibro,1]  + " No se encuentra disponible para préstamo")
        FinSi
    FinSi
FinFuncion

//Muestro prestamos cargados
Funcion mostrarPrestamos(prestamos Por Referencia, cantPrestamos)	
	Definir i, totalPrestamos Como Entero
	totalPrestamos <- 0
	
	espacio
	Escribir "*** LISTA DE PRÉSTAMOS ***"	
	espacio	
	Para i <- 0 Hasta cantPrestamos-1   
		Si prestamos[i,0] <> "" Entonces
			Escribir "----------------------------------------"
			Escribir "ID libro: ", prestamos[i,0]
			Escribir "DNI socio: ", prestamos[i,1]
			Escribir "Nombre del socio: ", prestamos[i,4]
			Escribir "Fecha de inicio: ", prestamos[i,2]
			Escribir "Fecha de devolucion pactada: ", prestamos[i,3]	
			espacio
			totalPrestamos <- totalPrestamos + 1 
		FinSi
	FinPara
		
	Si totalPrestamos = 0 Entonces
		esperarLimpiar("No hay préstamos activos en este momento.")
	FinSi
	pedirTecla
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
            //Escribir "Días de atraso: ", diasAtraso
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
    Definir fechaFinPenalidad Como Cadena
	Definir fechaFinPena como Entero
    Definir diasPenalidad, diasMes, diasRestantesMes Como Entero
	Definir anio, mes, dia Como Entero
    
    Si diasAtraso > 0 Entonces
        diasPenalidad <- diasAtraso * 2
        
		espacio
        Escribir "***PENALIDAD POR DEVOLUCIÓN TARDÍA***"
		espacio
        Escribir "Días de atraso: ", diasAtraso
        Escribir "No puede retirar libros por ", diasPenalidad, " días"        
		
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
		
        fechaFinPena <- anio * 10000 + mes * 100 + dia
        fechaFinPenalidad <- ConvertirATexto(fechaFinPena) 
        Escribir "Fin de penalidad: ", dia, "/", mes, "/", anio
        Escribir "Podrá retirar libros nuevamente a partir de esta fecha"
        espacio
    FinSi	
FinFuncion

//Reacomodo fechaFinPenalidad para Mostrar como fecha DD/MM/AAAA
Funcion fechaFormateada <- formatearFecha(fechaFinPenalidad)
    Definir fechaFormateada Como Cadena
    Definir anio, mes, dia Como Entero
    
    //Recibo AAAAMMDD
    anio <- trunc (ConvertirANumero(fechaFinPenalidad) / 10000)
    mes <- trunc (ConvertirANumero(fechaFinPenalidad) MOD 10000 / 100)
    dia <- ConvertirANumero(fechaFinPenalidad) MOD 100
    
    Si dia < 10 Entonces
        Si mes < 10 Entonces
            fechaFormateada <- "0" + ConvertirATexto(dia) + "/0" + ConvertirATexto(mes) + "/" + ConvertirATexto(anio)
        Sino
            fechaFormateada <- "0" + ConvertirATexto(dia) + "/" + ConvertirATexto(mes) + "/" + ConvertirATexto(anio)
        FinSi
    Sino
        Si mes < 10 Entonces
            fechaFormateada <- ConvertirATexto(dia) + "/0" + ConvertirATexto(mes) + "/" + ConvertirATexto(anio)
        Sino
            fechaFormateada <- ConvertirATexto(dia) + "/" + ConvertirATexto(mes) + "/" + ConvertirATexto(anio)
        FinSi
    FinSi
	
FinFuncion



//Gestiono devolución
Funcion registrarDevolucion(libros Por Referencia, socios Por Referencia, prestamos Por Referencia, cantLibros, cantSocios, cantPrestamos, camposPrestamos)
    Definir i, j, indiceLibro, indiceSocio, indicePrestamo, diasAtraso, diasPenalidad, stockActual, fechaDevNum Como Entero
    Definir idLibro, dniSocio, op, fechaFinPrestamo, fechaPrestamo, fechaDev Como Cadena
    Definir fechaValida Como Logico
    
    indiceSocio <- -1
    indicePrestamo <- -1
    
    esperarLimpiar("")
    Escribir "***REGISTRAR DEVOLUCIÓN DE LIBRO***"
	espacio
    dniSocio <- pedirNumeroComoTexto("Ingrese el dni del socio que quiere devolver: ")
    
    // BUSCAR SOCIO
    Para i <- 0 Hasta cantSocios -1 Hacer
        Si socios[i,0] = dniSocio Entonces
            indiceSocio <- i     
        FinSi        
    FinPara
    
    Si indiceSocio = -1 Entonces
        Escribir "Error: Socio no encontrado"
    Sino
		// Busco préstamo activo del socio
		Para i <- 0 Hasta cantPrestamos-1 Hacer
			Si prestamos[i,1] = dniSocio Entonces
				indicePrestamo <- i
				idLibro <- prestamos[i,0]
				fechaPrestamo <- prestamos[i,2]
			FinSi
		FinPara
		
        Si indicePrestamo  = -1 Entonces
            Escribir "El socio no tiene préstamos activos."
		SiNo
			// Busco préstamo del libro
			Para i <- 0 Hasta cantLibros-1 Hacer
				Si libros[i,0] = idLibro Entonces
					indiceLibro <- i
					mostrarLibroEncontrado(libros, i)
				FinSi
			FinPara
			
			//Pido confirmación devolución
			op <- confirmarInformacion("Desea registrar devolución (S/N)?")
			
			Si op = "S" Entonces
				Escribir "Registrando Devolución..."
				Esperar 1 Segundo
				
				//Ingreso fecha devolución
				fechaDev <- pedirFechaDevolucion()
				
				//Guardo fecha como numero para calcular penalidad (si corresponde)
				fechaDevNum <- convertirFechaEntero(fechaDev)				
				
				// Verifico fecha devolución no sea anterior a préstamo
				fechaValida <- validarFechaDevolucion(prestamos[indicePrestamo,2], fechaDev)
				
				Si fechaValida Entonces					
					// Calculo penalización si hay atraso
					fechaFinPrestamo <- libros[indiceLibro,6]
					diasAtraso <- chequearPenalidad(fechaFinPrestamo, fechaDev)
					
					// Actualizo Condición del socio
					Si diasAtraso > 0 Entonces
						//diasPenalidad <- diasAtraso * 2 esto está dos veces!
						socios[indiceSocio,3] <- "MULTADO"	
						socios[indiceSocio,4] <- calcularPenalidad(diasAtraso, fechaDevNum)	
					Sino
						socios[indiceSocio,3] <- "HABILITADO"
						socios[indiceSocio,4] <- "0"
						Escribir "Devolución en término. Socio habilitado para nuevos préstamos"
					FinSi
					
					// Elimino el préstamo
					Para j <- 0 Hasta camposPrestamos-1 Hacer
						prestamos[indicePrestamo, j] <- ""
					FinPara
					
					//Actualizo stock y ejemplaresPrestados		
					stockActual <- ConvertirANumero(libros[indiceLibro,7])
					stockActual <- stockActual + 1
					libros[indiceLibro,7] <- ConvertirATexto(stockActual)
					
					//Si no quedaban libros, actualizo dispo							
					Si stockActual = 1 Entonces
						libros[indiceLibro,5] <- "1"
					FinSi					
					espacio
					Escribir "Devolución registrada con éxito."
					Escribir "Stock actualizado del libro con id ", idLibro ": ", stockActual	
				SiNo
					espacio
					Escribir "Error: La fecha de devolución no puede ser anterior a la fecha de préstamo."
					Escribir "Fecha de préstamo: ", prestamos[indicePrestamo,2]				
				FinSi
				pedirTecla
			Sino
				Si op = "N" Entonces
					esperarLimpiar("Volviendo a Menú Anterior...")
				FinSi
			FinSi
		FinSi
	FinSi 
FinFuncion



//*****************************************************MENUES PARA MOSTRAR************************************************************************
SubProceso  mostrarMenuAcceso
	
	Escribir "Indique su tipo de usuario (0 para Salir del Sistema): "
	espacio
	Escribir "	1. ADMIN"
	Escribir "	2. BIBLIOTECARIO"
	Escribir "	3. SOCIO"
	Escribir "	0. Salir"
	espacio
FinSubProceso

SubProceso mostrarMenuPpalAdmin
	
	Escribir "Elija el módulo al que quiere acceder: "
	espacio
	Escribir "	1. ADMINs"
	Escribir "	2. BIBLIOTECARIOS"
	Escribir "	3. SOCIOS"
	Escribir "0. Volver"
	espacio
FinSubProceso

SubProceso mostrarMenuPpalBibliotecario
	espacio
	Escribir "Elija el módulo al que quiere acceder: "
	espacio
	Escribir "	1. LIBROS"
	Escribir "	2. SOCIOS"
	Escribir "	0. Volver"
	espacio
FinSubProceso

SubProceso mostrarMenuLibros
	espacio
	Escribir "**** MENU LIBROS ****"
	espacio
	Escribir "1. Agregar libros"		
	Escribir "2. Consultar libros"
	Escribir "0. Volver al menu principal"
	espacio
	Escribir Sin Saltar "Elija la opcion: "	
FinSubProceso

SubProceso  mostrarSubMenuConsultaLibros
	espacio
	Escribir "***Sub Menu Consulta de Libros***"
	espacio
	Escribir "1. Buscar Libro"
	Escribir "2. Modificar datos de libro"
	Escribir "3. Listado de Libros"
	Escribir "4. Registrar Préstamo"
	Escribir "5. Listado de Préstamos"
	Escribir "6. Registrar Devolución"
	Escribir "0. Volver"
	espacio
	Escribir Sin Saltar "Elija la opcion: "
FinSubProceso

SubProceso mostrarMenuSocios
	espacio
	Escribir "**** MENU SOCIOS ****"
	Escribir "1. Agregar socio"		
	Escribir "2. Consultar socios"
	Escribir "0. Volver al menu principal"
	espacio
	Escribir Sin Saltar "Elija la opcion: "	
FinSubProceso

SubProceso  mostrarSubMenuConsultaSocios		
	Escribir "***Sub Menu Consulta de Socios***"
	espacio
	Escribir "1. Buscar Socio"
	Escribir "2. Modificar datos del Socio"
	Escribir "3. Dar de Baja Socio"
	Escribir "4. Listado de Socios"
	Escribir "0. Volver"
	espacio
	Escribir Sin Saltar "Elija la opcion: "
FinSubProceso


//LIBROS PRECARGADOS
Funcion librosPrecargados(libros Por Referencia, cantLibros, camposLibros)
	Definir i, j Como Entero
	
	//Inicializo matriz de libros 
	Para i <- 0 Hasta cantLibros-1 Hacer		
		Para j <- 0 Hasta camposLibros - 1 Hacer
			libros[i, j] <- ""
		FinPara
	FinPara
	
	//Cargo libros
	libros[0,0] <- "10000"
	libros[0,1] <- "RAFAELA"
	libros[0,2] <- "MARIANA FURIASSE"
	libros[0,3] <- "NOVELA"
	libros[0,4] <- "2002"
	libros[0,5] <- "1"
	libros[0,7] <- "2"
	
	libros[1,0] <- "10001"
	libros[1,1] <- "HAMLET"
	libros[1,2] <- "WILLIAM SHAKESPEARE"
	libros[1,3] <- "TRAGEDIA"
	libros[1,4] <- "1603"
	libros[1,5] <- "1"
	libros[1,7] <- "1"
	
	libros[2,0] <- "10002"
	libros[2,1] <- "CIEN AÑOS DE SOLEDAD"
	libros[2,2] <- "GABRIEL GARCÍA MÁRQUEZ"
	libros[2,3] <- "NOVELA"
	libros[2,4] <- "1967"
	libros[2,5] <- "1"
	libros[2,7] <- "2"
	
	libros[3,0] <- "10003"
	libros[3,1] <- "1984"
	libros[3,2] <- "GEORGE ORWELL"
	libros[3,3] <- "DISTOPÍA"
	libros[3,4] <- "1949"
	libros[3,5] <- "1"
	libros[3,7] <- "3"
	
	libros[4,0] <- "10004"
	libros[4,1] <- "EL PRINCIPITO"
	libros[4,2] <- "ANTOINE DE SAINT-EXUPÉRY"
	libros[4,3] <- "FÁBULA"
	libros[4,4] <- "1943"
	libros[4,5] <- "0"
	libros[4,7] <- "0"
	
	libros[5,0] <- "10005"
	libros[5,1] <- "DON QUIJOTE DE LA MANCHA"
	libros[5,2] <- "MIGUEL DE CERVANTES"
	libros[5,3] <- "NOVELA"
	libros[5,4] <- "1605"
	libros[5,5] <- "1"
	libros[5,7] <- "2"
	
	libros[6,0] <- "10006"
	libros[6,1] <- "LA ODISEA"
	libros[6,2] <- "HOMERO"
	libros[6,3] <- "ÉPICA"
	libros[6,4] <- "800"
	libros[6,5] <- "1"
	libros[6,7] <- "3"
	
	libros[7,0] <- "10007"
	libros[7,1] <- "FLORES PARA ALGERNON"
	libros[7,2] <- "DANIEL KEYES"
	libros[7,3] <- "CIENCIA FICCIÓN"
	libros[7,4] <- "1966"
	libros[7,5] <- "1"
	libros[7,7] <- "2"
	
	libros[8,0] <- "10008"
	libros[8,1] <- "RAYUELA"
	libros[8,2] <- "JULIO CORTÁZAR"
	libros[8,3] <- "NOVELA"
	libros[8,4] <- "1963"
	libros[8,5] <- "0"
	libros[8,7] <- "0"
	
	libros[9,0] <- "10009"
	libros[9,1] <- "LA DIVINA COMEDIA"
	libros[9,2] <- "DANTE ALIGHIERI"
	libros[9,3] <- "POESÍA"
	libros[9,4] <- "1320"
	libros[9,5] <- "1"
	libros[9,7] <- "3"
	
	libros[10,0] <- "10010"
	libros[10,1] <- "FRANKENSTEIN"
	libros[10,2] <- "MARY SHELLEY"
	libros[10,3] <- "TERROR"
	libros[10,4] <- "1818"
	libros[10,5] <- "1"
	libros[10,7] <- "2"
	
	libros[11,0] <- "10011"
	libros[11,1] <- "CRIMEN Y CASTIGO"
	libros[11,2] <- "FIODOR DOSTOYEVSKI"
	libros[11,3] <- "NOVELA"
	libros[11,4] <- "1866"
	libros[11,5] <- "0"
	libros[11,7] <- "0"
	
	libros[12,0] <- "10012"
	libros[12,1] <- "MOBY DICK"
	libros[12,2] <- "HERMAN MELVILLE"
	libros[12,3] <- "AVENTURA"
	libros[12,4] <- "1851"
	libros[12,5] <- "1"
	libros[12,7] <- "3"
	
	libros[13,0] <- "10013"
	libros[13,1] <- "DRÁCULA"
	libros[13,2] <- "BRAM STOKER"
	libros[13,3] <- "TERROR"
	libros[13,4] <- "1897"
	libros[13,5] <- "1"
	libros[13,7] <- "2"
	
	libros[14,0] <- "10014"
	libros[14,1] <- "FAHRENHEIT 451"
	libros[14,2] <- "RAY BRADBURY"
	libros[14,3] <- "CIENCIA FICCIÓN"
	libros[14,4] <- "1953"
	libros[14,5] <- "0"
	libros[14,7] <- "0"
	
	libros[15,0] <- "10015"
	libros[15,1] <- "EL NOMBRE DE LA ROSA"
	libros[15,2] <- "UMBERTO ECO"
	libros[15,3] <- "NOVELA HISTÓRICA"
	libros[15,4] <- "1980"
	libros[15,5] <- "1"
	libros[15,7] <- "3"
	
	libros[16,0] <- "10016"
	libros[16,1] <- "LOS MISERABLES"
	libros[16,2] <- "VICTOR HUGO"
	libros[16,3] <- "NOVELA"
	libros[16,4] <- "1862"
	libros[16,5] <- "1"
	libros[16,7] <- "2"
	
	libros[17,0] <- "10017"
	libros[17,1] <- "LA METAMORFOSIS"
	libros[17,2] <- "FRANZ KAFKA"
	libros[17,3] <- "FICCIÓN"
	libros[17,4] <- "1915"
	libros[17,5] <- "1"
	libros[17,7] <- "1"
	
	libros[18,0] <- "10018"
	libros[18,1] <- "EL PERFUME"
	libros[18,2] <- "PATRICK SÜSKIND"
	libros[18,3] <- "NOVELA"
	libros[18,4] <- "1985"
	libros[18,5] <- "1"
	libros[18,7] <- "2"
	
	libros[19,0] <- "10019"
	libros[19,1] <- "REBELIÓN EN LA GRANJA"
	libros[19,2] <- "GEORGE ORWELL"
	libros[19,3] <- "SÁTIRA POLÍTICA"
	libros[19,4] <- "1945"
	libros[19,5] <- "1"
	libros[19,7] <- "3"
	
	libros[20,0] <- "10020"
	libros[20,1] <- "EL HOBBIT"
	libros[20,2] <- "J. R. R. TOLKIEN"
	libros[20,3] <- "FANTASÍA"
	libros[20,4] <- "1937"
	libros[20,5] <- "0"
	libros[20,7] <- "0"
	
	libros[21,0] <- "10021"
	libros[21,1] <- "EL SEÑOR DE LOS ANILLOS"
	libros[21,2] <- "J. R. R. TOLKIEN"
	libros[21,3] <- "FANTASÍA"
	libros[21,4] <- "1954"
	libros[21,5] <- "1"
	libros[21,7] <- "3"
	
	libros[22,0] <- "10022"
	libros[22,1] <- "LAS AVENTURAS DE SHERLOCK HOLMES"
	libros[22,2] <- "ARTHUR CONAN DOYLE"
	libros[22,3] <- "MISTERIO"
	libros[22,4] <- "1892"
	libros[22,5] <- "1"
	libros[22,7] <- "2"
	
	libros[23,0] <- "10023"
	libros[23,1] <- "ORGULLO Y PREJUICIO"
	libros[23,2] <- "JANE AUSTEN"
	libros[23,3] <- "ROMANCE"
	libros[23,4] <- "1813"
	libros[23,5] <- "1"
	libros[23,7] <- "2"
	
	libros[24,0] <- "10024"
	libros[24,1] <- "ALICIA EN EL PAÍS DE LAS MARAVILLAS"
	libros[24,2] <- "LEWIS CARROLL"
	libros[24,3] <- "FANTASÍA"
	libros[24,4] <- "1865"
	libros[24,5] <- "1"
	libros[24,7] <- "3"
	
	libros[25,0] <- "10025"
	libros[25,1] <- "MATRIX RELOADED"
	libros[25,2] <- "WACHOWSKI"
	libros[25,3] <- "CIENCIA FICCIÓN"
	libros[25,4] <- "2003"
	libros[25,5] <- "1"
	libros[25,7] <- "1"
	
	libros[26,0] <- "10026"
	libros[26,1] <- "HARRY POTTER Y LA PIEDRA FILOSOFAL"
	libros[26,2] <- "J. K. ROWLING"
	libros[26,3] <- "FANTASÍA"
	libros[26,4] <- "1997"
	libros[26,5] <- "1"
	libros[26,7] <- "3"
	
	libros[27,0] <- "10027"
	libros[27,1] <- "HARRY POTTER Y LA CÁMARA SECRETA"
	libros[27,2] <- "J. K. ROWLING"
	libros[27,3] <- "FANTASÍA"
	libros[27,4] <- "1998"
	libros[27,5] <- "1"
	libros[27,7] <- "2"
	
	libros[28,0] <- "10028"
	libros[28,1] <- "HARRY POTTER Y EL PRISIONERO DE AZKABAN"
	libros[28,2] <- "J. K. ROWLING"
	libros[28,3] <- "FANTASÍA"
	libros[28,4] <- "1999"
	libros[28,5] <- "1"
	libros[28,7] <- "2"
	
	libros[29,0] <- "10029"
	libros[29,1] <- "HARRY POTTER Y EL CÁLIZ DE FUEGO"
	libros[29,2] <- "J. K. ROWLING"
	libros[29,3] <- "FANTASÍA"
	libros[29,4] <- "2000"
	libros[29,5] <- "1"
	libros[29,7] <- "2"
	
	libros[30,0] <- "10030"
	libros[30,1] <- "IT"
	libros[30,2] <- "STEPHEN KING"
	libros[30,3] <- "TERROR"
	libros[30,4] <- "1986"
	libros[30,5] <- "1"
	libros[30,7] <- "3"
	
	libros[31,0] <- "10031"
	libros[31,1] <- "EL RESPLANDOR"
	libros[31,2] <- "STEPHEN KING"
	libros[31,3] <- "TERROR"
	libros[31,4] <- "1977"
	libros[31,5] <- "1"
	libros[31,7] <- "3"
	
	libros[32,0] <- "10032"
	libros[32,1] <- "CARRIE"
	libros[32,2] <- "STEPHEN KING"
	libros[32,3] <- "TERROR"
	libros[32,4] <- "1974"
	libros[32,5] <- "1"
	libros[32,7] <- "2"
	
	libros[33,0] <- "10033"
	libros[33,1] <- "DUNE"
	libros[33,2] <- "FRANK HERBERT"
	libros[33,3] <- "CIENCIA FICCIÓN"
	libros[33,4] <- "1965"
	libros[33,5] <- "1"
	libros[33,7] <- "3"
	
	libros[34,0] <- "10034"
	libros[34,1] <- "EL CÓDIGO DA VINCI"
	libros[34,2] <- "DAN BROWN"
	libros[34,3] <- "SUSPENSO"
	libros[34,4] <- "2003"
	libros[34,5] <- "1"
	libros[34,7] <- "2"
	
	libros[35,0] <- "10035"
	libros[35,1] <- "ÁNGELES Y DEMONIOS"
	libros[35,2] <- "DAN BROWN"
	libros[35,3] <- "SUSPENSO"
	libros[35,4] <- "2000"
	libros[35,5] <- "1"
	libros[35,7] <- "2"
	
	libros[36,0] <- "10036"
	libros[36,1] <- "EL ALQUIMISTA"
	libros[36,2] <- "PAULO COELHO"
	libros[36,3] <- "FICCIÓN"
	libros[36,4] <- "1988"
	libros[36,5] <- "1"
	libros[36,7] <- "3"
	
	libros[37,0] <- "10037"
	libros[37,1] <- "VERÓNICA DECIDE MORIR"
	libros[37,2] <- "PAULO COELHO"
	libros[37,3] <- "NOVELA"
	libros[37,4] <- "1998"
	libros[37,5] <- "1"
	libros[37,7] <- "2"
	
	libros[38,0] <- "10038"
	libros[38,1] <- "EL DIARIO DE ANA FRANK"
	libros[38,2] <- "ANA FRANK"
	libros[38,3] <- "BIOGRAFÍA"
	libros[38,4] <- "1947"
	libros[38,5] <- "1"
	libros[38,7] <- "2"
	
	libros[39,0] <- "10039"
	libros[39,1] <- "LOS JUEGOS DEL HAMBRE"
	libros[39,2] <- "SUZANNE COLLINS"
	libros[39,3] <- "DISTOPÍA"
	libros[39,4] <- "2008"
	libros[39,5] <- "1"
	libros[39,7] <- "3"
	
	libros[40,0] <- "10040"
	libros[40,1] <- "EN LLAMAS"
	libros[40,2] <- "SUZANNE COLLINS"
	libros[40,3] <- "DISTOPÍA"
	libros[40,4] <- "2009"
	libros[40,5] <- "1"
	libros[40,7] <- "2"
	
	libros[41,0] <- "10041"
	libros[41,1] <- "SINSAJO"
	libros[41,2] <- "SUZANNE COLLINS"
	libros[41,3] <- "DISTOPÍA"
	libros[41,4] <- "2010"
	libros[41,5] <- "1"
	libros[41,7] <- "2"
	
	libros[42,0] <- "10042"
	libros[42,1] <- "EL JUEGO DE ENDER"
	libros[42,2] <- "ORSOM SCOTT CARD"
	libros[42,3] <- "CIENCIA FICCIÓN"
	libros[42,4] <- "1985"
	libros[42,5] <- "1"
	libros[42,7] <- "3"
	
	libros[43,0] <- "10043"
	libros[43,1] <- "EL GUARDIÁN ENTRE EL CENTENO"
	libros[43,2] <- "J. D. SALINGER"
	libros[43,3] <- "FICCIÓN"
	libros[43,4] <- "1951"
	libros[43,5] <- "1"
	libros[43,7] <- "3"
	
	libros[44,0] <- "10044"
	libros[44,1] <- "EL GRAN GATSBY"
	libros[44,2] <- "F. SCOTT FITZGERALD"
	libros[44,3] <- "NOVELA"
	libros[44,4] <- "1925"
	libros[44,5] <- "1"
	libros[44,7] <- "2"
	
	libros[45,0] <- "10045"
	libros[45,1] <- "DRAGON BALL"
	libros[45,2] <- "AKIRA TORIYAMA"
	libros[45,3] <- "MANGA"
	libros[45,4] <- "1984"
	libros[45,5] <- "1"
	libros[45,7] <- "3"
	
	libros[46,0] <- "10046"
	libros[46,1] <- "NARUTO"
	libros[46,2] <- "MASASHI KISHIMOTO"
	libros[46,3] <- "MANGA"
	libros[46,4] <- "1999"
	libros[46,5] <- "1"
	libros[46,7] <- "3"
	
	libros[47,0] <- "10047"
	libros[47,1] <- "ONE PIECE"
	libros[47,2] <- "EIICHIRO ODA"
	libros[47,3] <- "MANGA"
	libros[47,4] <- "1997"
	libros[47,5] <- "1"
	libros[47,7] <- "3"
	
	libros[48,0] <- "10048"
	libros[48,1] <- "BLEACH"
	libros[48,2] <- "TITE KUBO"
	libros[48,3] <- "MANGA"
	libros[48,4] <- "2001"
	libros[48,5] <- "1"
	libros[48,7] <- "3"
	
	libros[49,0] <- "10049"
	libros[49,1] <- "DEMON SLAYER"
	libros[49,2] <- "KOYOHARU GOTOUGE"
	libros[49,3] <- "MANGA"
	libros[49,4] <- "2016"
	libros[49,5] <- "1"
	libros[49,7] <- "3"
	
	libros[50,0] <- "10050"
	libros[50,1] <- "TOKYO GHOUL"
	libros[50,2] <- "SUI ISHIDA"
	libros[50,3] <- "MANGA"
	libros[50,4] <- "2011"
	libros[50,5] <- "1"
	libros[50,7] <- "3"
FinFuncion

//SOCIOS PRECARGADOS
Funcion sociosPrecargados(socios Por Referencia, cantSocios, camposSocios)
	Definir i, j Como Entero
	//Inicializo matriz de socios 
	Para i <- 0 Hasta cantSocios-1 Hacer		
		Para j <- 0 Hasta camposSocios - 1 Hacer
			socios[i, j] <- ""
		FinPara
	FinPara
	
	//Cargo socios
	socios[0, 0] <- "87562896"
	socios[0, 1] <- "JOSE LOPEZ"
	socios[0, 2] <- "1103160523"
	socios[0, 3] <- "HABILITADO"
	socios[0, 4] <- "6"
	socios[0, 5] <- "ACTIVO"
	
	socios[1, 0] <- "45263568"
	socios[1, 1] <- "MAR GOMEZ"
	socios[1, 2] <- "1161176033"
	socios[1, 3] <- "HABILITADO"
	socios[1, 4] <- ""
	socios[1, 5] <- "ACTIVO"
	
	socios[2, 0] <- "77463568"
	socios[2, 1] <- "MARTIN PIX"
	socios[2, 2] <- "1101176033"
	socios[2, 3] <- "HABILITADO"
	socios[2, 4] <- ""
	socios[2, 5] <- "ACTIVO"
	
	socios[3, 0] <- "7062019"
	socios[3, 1] <- "COPITO WOJTASIK"
	socios[3, 2] <- "1141686306"
	socios[3, 3] <- "HABILITADO"
	socios[3, 4] <- ""
	socios[3, 5] <- "ACTIVO"
	
	socios[4, 0] <- "23122019"
	socios[4, 1] <- "TAMBOR MENDEZ"
	socios[4, 2] <- "1139556061"
	socios[4, 3] <- "HABILITADO"
	socios[4, 4] <- ""
	socios[4, 5] <- "ACTIVO"
	
	socios[5, 0] <- "26091984"
	socios[5, 1] <- "EMA ANCANS"
	socios[5, 2] <- "1163697899"
	socios[5, 3] <- "HABILITADO"
	socios[5, 4] <- ""
	socios[5, 5] <- "ACTIVO"
	
	socios[6, 0] <- "13051985"
	socios[6, 1] <- "TOTA BOLLA"
	socios[6, 2] <- "1165218111"
	socios[6, 3] <- "HABILITADO"
	socios[6, 4] <- ""
	socios[6, 5] <- "ACTIVO"
	
	socios[7, 0] <- "34862157"
	socios[7, 1] <- "LUIS CARRASCO"
	socios[7, 2] <- "1123456789"
	socios[7, 3] <- "HABILITADO"
	socios[7, 4] <- ""
	socios[7, 5] <- "ACTIVO"
	
	socios[8, 0] <- "25987456"
	socios[8, 1] <- "MARTA SALAS"
	socios[8, 2] <- "1134567890"
	socios[8, 3] <- "HABILITADO"
	socios[8, 4] <- ""
	socios[8, 5] <- "ACTIVO"
	
	socios[9, 0] <- "37658942"
	socios[9, 1] <- "DIEGO PEREYRA"
	socios[9, 2] <- "1145678901"
	socios[9, 3] <- "HABILITADO"
	socios[9, 4] <- ""
	socios[9, 5] <- "ACTIVO"
	
	socios[10, 0] <- "40785621"
	socios[10, 1] <- "CARLA ACUÑA"
	socios[10, 2] <- "1156789012"
	socios[10, 3] <- "HABILITADO"
	socios[10, 4] <- "3"
	socios[10, 5] <- "ACTIVO"
	
	socios[11, 0] <- "42235897"
	socios[11, 1] <- "JUAN CRUZ"
	socios[11, 2] <- "1167890123"
	socios[11, 3] <- "HABILITADO"
	socios[11, 4] <- ""
	socios[11, 5] <- "ACTIVO"
	
	socios[12, 0] <- "43987564"
	socios[12, 1] <- "SOFIA NUÑEZ"
	socios[12, 2] <- "1178901234"
	socios[12, 3] <- "HABILITADO"
	socios[12, 4] <- ""
	socios[12, 5] <- "ACTIVO"
	
	socios[13, 0] <- "45896237"
	socios[13, 1] <- "RICARDO DIAZ"
	socios[13, 2] <- "1189012345"
	socios[13, 3] <- "HABILITADO"
	socios[13, 4] <- ""
	socios[13, 5] <- "ACTIVO"
	
	socios[14, 0] <- "46985327"
	socios[14, 1] <- "ANA MARQUEZ"
	socios[14, 2] <- "1190123456"
	socios[14, 3] <- "HABILITADO"
	socios[14, 4] <- "2"
	socios[14, 5] <- "ACTIVO"
	
	socios[15, 0] <- "47856231"
	socios[15, 1] <- "PABLO RAMOS"
	socios[15, 2] <- "1101234567"
	socios[15, 3] <- "HABILITADO"
	socios[15, 4] <- ""
	socios[15, 5] <- "ACTIVO"
	
	socios[16, 0] <- "48975623"
	socios[16, 1] <- "VICTOR HERRERA"
	socios[16, 2] <- "1112345678"
	socios[16, 3] <- "HABILITADO"
	socios[16, 4] <- ""
	socios[16, 5] <- "ACTIVO"
	
	socios[17, 0] <- "49785263"
	socios[17, 1] <- "LAURA VEGA"
	socios[17, 2] <- "1123456788"
	socios[17, 3] <- "HABILITADO"
	socios[17, 4] <- ""
	socios[17, 5] <- "ACTIVO"
	
	socios[18, 0] <- "50789563"
	socios[18, 1] <- "ANDRES PONCE"
	socios[18, 2] <- "1134567898"
	socios[18, 3] <- "HABILITADO"
	socios[18, 4] <- ""
	socios[18, 5] <- "ACTIVO"
	
	socios[19, 0] <- "51628974"
	socios[19, 1] <- "ELENA FARIAS"
	socios[19, 2] <- "1145678908"
	socios[19, 3] <- "HABILITADO"
	socios[19, 4] <- ""
	socios[19, 5] <- "ACTIVO"
	
	socios[20, 0] <- "52369847"
	socios[20, 1] <- "SERGIO RUIZ"
	socios[20, 2] <- "1156789018"
	socios[20, 3] <- "HABILITADO"
	socios[20, 4] <- ""
	socios[20, 5] <- "ACTIVO"
	
	socios[21, 0] <- "53478562"
	socios[21, 1] <- "DANIELA MARTIN"
	socios[21, 2] <- "1167890128"
	socios[21, 3] <- "HABILITADO"
	socios[21, 4] <- ""
	socios[21, 5] <- "ACTIVO"

FinFuncion

//BIBLIOTECARIOS PRECARGADOS
Funcion bibliotecariosPrecargados(bibliotecarios Por Referencia, cantBibliotecarios, camposBibliotecarios)
	Definir i, j Como Entero
	// Inicializo matriz de bibliotecarios
    Para i <- 0 Hasta cantBibliotecarios-1 Hacer
		Para j <- 0 Hasta camposBibliotecarios - 1 Hacer
			bibliotecarios[i, j] <- ""
		FinPara
    FinPara
	
	//Cargo bibliotecarios
	bibliotecarios[0, 0] <- "GUADIX"
    bibliotecarios[0, 1] <- "5678"
	
	bibliotecarios[1, 0] <- "FRANCO"
    bibliotecarios[1, 1] <- "5678"
	
	bibliotecarios[2, 0] <- "MARCE"
    bibliotecarios[2, 1] <- "5678"
FinFuncion


//Admins Precargados
Funcion administradoresPrecargados(administradores Por Referencia, cantAdministradores, camposAdministradores)
	Definir i, j Como Entero
	
	//Inicializo matriz de admins 
	Para i <- 0 Hasta cantAdministradores-1 Hacer		
		Para j <- 0 Hasta camposAdministradores - 1 Hacer
			administradores[i, j] <- ""
		FinPara
	FinPara	
	
	//Cargo bibliotecarios
	administradores[0, 0] <- "GUADIX"
    administradores[0, 1] <- "1234"
	
	administradores[1, 0] <- "FRANCO"
    administradores[1, 1] <- "1234"
	
	administradores[2, 0] <- "MARCE"
    administradores[2, 1] <- "1234"
FinFuncion

// *****************************************************VISUALES*******************************************************************

SubProceso bienvenidaSistema
Definir ancho_pantalla, longitud_linea, i, j,k, espacios, espacios_izquierda, espacios_derecha, max_contenido Como Entero
Definir linea_con_espacios Como Cadena
Definir borde_superior, borde_inferior Como Cadena
Definir lineas Como Cadena
Dimension lineas[32]

ancho_pantalla <- 140
espacios_izquierda <- 10
espacios_derecha <- 10
max_contenido <- ancho_pantalla - espacios_izquierda - espacios_derecha


lineas[0]  <- "$$$$$$$\  $$\                                                   $$\       $$\                                     "
lineas[1]  <- "$$  __$$\ \__|                                                  \__|      $$ |                                    "
lineas[2]  <- "$$ |  $$ |$$\  $$$$$$\  $$$$$$$\ $$\    $$\  $$$$$$\  $$$$$$$\  $$\  $$$$$$$ | $$$$$$\   $$$$$$$\                 "
lineas[3]  <- "$$$$$$$\ |$$ |$$  __$$\ $$  __$$\\$$\  $$  |$$  __$$\ $$  __$$\ $$ |$$  __$$ |$$  __$$\ $$  _____|                "
lineas[4]  <- "$$  __$$\ $$ |$$$$$$$$ |$$ |  $$ |\$$\$$  / $$$$$$$$ |$$ |  $$ |$$ |$$ /  $$ |$$ /  $$ |\$$$$$$\                  "
lineas[5]  <- "$$ |  $$ |$$ |$$   ____|$$ |  $$ | \$$$  /  $$   ____|$$ |  $$ |$$ |$$ |  $$ |$$ |  $$ | \____$$\                 "
lineas[6]  <- "$$$$$$$  |$$ |\$$$$$$$\ $$ |  $$ |  \$  /   \$$$$$$$\ $$ |  $$ |$$ |\$$$$$$$ |\$$$$$$  |$$$$$$$  |                "
lineas[7]  <- "\_______/ \__| \_______|\__|  \__|   \_/     \_______|\__|  \__|\__| \_______| \______/ \_______/                 "
lineas[8]  <- "                                                                                                                  "
lineas[9]  <- "                                                                                                                  "
lineas[10] <- "                                                                                                                  "
lineas[11] <- "          $$\                 $$\             $$\                                                   $$\           "
lineas[12] <- "          $$ |                \__|            $$ |                                                  $$ |          "
lineas[13] <- " $$$$$$\  $$ |       $$$$$$$\ $$\  $$$$$$$\ $$$$$$\    $$$$$$\  $$$$$$\$$$$\   $$$$$$\         $$$$$$$ | $$$$$$\  "
lineas[14] <- " \____$$\ $$ |      $$  _____|$$ |$$  _____|\_$$  _|  $$  __$$\ $$  _$$  _$$\  \____$$\       $$  __$$ |$$  __$$\ "
lineas[15] <- " $$$$$$$ |$$ |      \$$$$$$\  $$ |\$$$$$$\    $$ |    $$$$$$$$ |$$ / $$ / $$ | $$$$$$$ |      $$ /  $$ |$$$$$$$$ |"
lineas[16] <- "$$  __$$ |$$ |       \____$$\ $$ | \____$$\   $$ |$$\ $$   ____|$$ | $$ | $$ |$$  __$$ |      $$ |  $$ |$$   ____|"
lineas[17] <- "\$$$$$$$ |$$ |      $$$$$$$  |$$ |$$$$$$$  |  \$$$$  |\$$$$$$$\ $$ | $$ | $$ |\$$$$$$$ |      \$$$$$$$ |\$$$$$$$\ "
lineas[18] <- " \_______|\__|      \_______/ \__|\_______/    \____/  \_______|\__| \__| \__| \_______|       \_______| \_______|"
lineas[19] <- "                                                                                                                  "
lineas[20] <- "                                                                                                                  "
lineas[21] <- "                                                                                                                  "
lineas[22] <- "$$$$$$$\  $$\ $$\       $$\ $$\            $$\                                                                    "
lineas[23] <- "$$  __$$\ \__|$$ |      $$ |\__|           $$ |                                                                   "
lineas[24] <- "$$ |  $$ |$$\ $$$$$$$\  $$ |$$\  $$$$$$\ $$$$$$\    $$$$$$\   $$$$$$$\ $$$$$$\                                    "
lineas[25] <- "$$$$$$$\ |$$ |$$  __$$\ $$ |$$ |$$  __$$\\_$$  _|  $$  __$$\ $$  _____|\____$$\                                   "
lineas[26] <- "$$  __$$\ $$ |$$ |  $$ |$$ |$$ |$$ /  $$ | $$ |    $$$$$$$$ |$$ /      $$$$$$$ |                                  "
lineas[27] <- "$$ |  $$ |$$ |$$ |  $$ |$$ |$$ |$$ |  $$ | $$ |$$\ $$   ____|$$ |     $$  __$$ |                                  "
lineas[28] <- "$$$$$$$  |$$ |$$$$$$$  |$$ |$$ |\$$$$$$  | \$$$$  |\$$$$$$$\ \$$$$$$$\\$$$$$$$ |                                  "
lineas[29] <- "\_______/ \__|\_______/ \__|\__| \______/   \____/  \_______| \_______|\_______|                                  "
lineas[30] <- "                                                                                                                  "
lineas[31] <- "                                                                                                                  "


borde_superior <- ""
borde_inferior <- ""
Para i <- 1 Hasta ancho_pantalla Hacer
	borde_superior <- borde_superior + "*"
	borde_inferior <- borde_inferior + "*"
FinPara

Escribir(borde_superior)


Para i <- 0 Hasta 31 Hacer
	longitud_linea <- Longitud(lineas[i])
	
	// Si la línea es más corta que el máximo, completarla con espacios
	Si longitud_linea < max_contenido Entonces
		Para k <- 1 Hasta (max_contenido - longitud_linea) Hacer
			lineas[i] <- lineas[i] + " "
		FinPara
		longitud_linea <- max_contenido
	FinSi
	
	// Si la línea es más larga, truncarla
	Si longitud_linea > max_contenido Entonces
		lineas[i] <- SubCadena(lineas[i], 0, max_contenido)
		longitud_linea <- max_contenido
	FinSi
	
	linea_con_espacios <- ""
	
	// Espacios fijos a la izquierda
	Para j <- 1 Hasta espacios_izquierda Hacer
		linea_con_espacios <- linea_con_espacios + " "
	FinPara
	
	// Línea de texto
	linea_con_espacios <- linea_con_espacios + lineas[i]
	
	// Espacios fijos a la derecha
	Para j <- 1 Hasta espacios_derecha Hacer
		linea_con_espacios <- linea_con_espacios + " "
	FinPara
	
	// Imprimir línea con bordes laterales
	Escribir("|" + linea_con_espacios + "|")
FinPara

Escribir(borde_inferior)

Esperar 2 Segundos
Limpiar Pantalla

FinSubproceso
