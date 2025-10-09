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
	camposPrestamos  <- 4 //  idLibro, dniSocio, fechaPrestamo, fechaFin 
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
		
		Segun opAcceso Hacer
			"1":	//Acceso Admin
				Mientras intentos < 3 Y accesoValido = 0 Hacer
					Escribir "*** ACCESO ADMINISTRADOR ***"	
					Escribir ""
					Escribir "Intento ", intentos + 1, " de 3"
					Escribir Sin Saltar "Ingrese su Nombre: "
					Leer nombreIngresado
					nombreIngresado <- Mayusculas(nombreIngresado)
					Escribir Sin Saltar "Ingrese su Clave: "
					Leer claveIngresada
					
					Si validarAccesoAdministrador(nombreIngresado, claveIngresada, administradores, cantAdministradores) Entonces
						Escribir "Acceso concedido. Bienvenido ", nombreIngresado
						accesoValido <- 1
						Esperar 1 Segundos
						Limpiar Pantalla						
					Sino
						Escribir "Nombre o clave incorrectos."
						intentos <- intentos + 1
						Esperar 2 Segundos
						Limpiar Pantalla
					FinSi
				FinMientras
				
				Si accesoValido = 0 Entonces
					Escribir "Demasiados intentos fallidos. Volviendo al men� principal."
					Esperar 2 Segundos
				FinSi
				
				administrador(bibliotecarios, cantBibliotecarios, administradores, cantAdministradores, socios, cantSocios) 		
				
			"2":  //Acceso Bibliotecario		
				Mientras intentos < 3 Y accesoValido = 0 Hacer
				Escribir "*** ACCESO BIBLIOTECARIO ***"	
				EScribir ""
				Escribir "Intento ", intentos + 1, " de 3"
				Escribir Sin Saltar "Ingrese su nombre: "
				Leer nombreIngresado
				nombreIngresado <- Mayusculas(nombreIngresado)
				Escribir Sin Saltar "Ingrese su clave: "
				Leer claveIngresada						
				
				Si validarAccesoBibliotecario(nombreIngresado, claveIngresada, bibliotecarios, cantBibliotecarios) Entonces
					Escribir "Acceso concedido. Bienvenido ", nombreIngresado
					accesoValido <- 1
					Esperar 1 Segundos
					Limpiar Pantalla
				Sino
					Escribir "Nombre o clave incorrectos."
					intentos <- intentos + 1
					Esperar 1 Segundos
					Limpiar Pantalla
				FinSi
			FinMientras
			
			Si accesoValido = 0 Entonces
				Escribir "Demasiados intentos fallidos. Volviendo al men� principal..."
				Esperar 2 Segundos
				Limpiar Pantalla
			FinSi
				
			bibliotecario(libros, cantLibros, socios, cantSocios, prestamos, cantPrestamos, camposPrestamos)
		"3":
			//Acceso Socios -  HAY Q COMPLETAR...
			Escribir "*** ACCESO SOCIOS ***"
			
			sociosVista(libros, cantLibros, prestamos, cantPrestamos)
		"0":
			Escribir "Saliendo del Sistema..."
			Esperar 1 segundo
		De Otro Modo:
			Escribir "Eligi� una opci�n inv�lida."
	Fin Segun
	
	Hasta Que opAcceso == "0"
	
FinAlgoritmo


//******************************************* FUNCIONES AUXILIARES VALIDACION DE ACCESO *******************************************************
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
	Definir indice, confirmar, totalBibliotecarios Como Entero	
    Definir nombreBibliotecario, claveBibliotecario, opUsuario Como Cadena
	//Admins
	Definir nombreIngresado, claveIngresada, nombreAdmin, claveAdmin Como Cadena
	Definir intentos, accesoValido, totalAdministradores Como Entero
	Definir administradorExiste, hayAdministradores Como Logico
	definir cantAdmins Como Entero
	cantAdmins <- 0
	intentos <- 0
	accesoValido <- 0
	
	Repetir
		Limpiar Pantalla
		Escribir ""
        Escribir "*** MEN� ADMINISTRADOR ***"
        Escribir "1. Gestionar Bibliotecarios"
        Escribir "2. Gestionar Socios"
        Escribir "3. Gestionar Administradores"
		Escribir "4. Volver al men� principal"
        Escribir "Elija una opci�n (1-4): "
        Leer opAdmin
		
		Segun opAdmin Hacer
			"1":
				//Gestiono Bibliotecarios
				Repetir
					Escribir ""
                    Escribir "*** GESTI�N DE BIBLIOTECARIOS ***"
                    Escribir "1. Agregar Bibliotecario"
                    Escribir "2. Eliminar Bibliotecario"
                    Escribir "3. Listar Bibliotecarios"
                    Escribir "4. Volver"
                    Escribir "Elija una opci�n (1-4): "
                    Leer resp
					
					Segun resp Hacer
						"1": 	//Agrego Bibliotecario
							Repetir
								//Asigno posici�n en el array
								indice <- -1
								Para i <- 0 Hasta cantBibliotecarios -1 Hacer
									Si bibliotecarios[i, 0] = "" Entonces
										indice <- i
										i <- cantBibliotecarios -1  
									FinSi
								FinPara
								
								Si indice = -1 Entonces
									Escribir "No hay espacio disponible para agregar m�s bibliotecarios."
								Sino
									confirmar <- 0
									Mientras confirmar = 0 Hacer
										nombreBibliotecario <- pedirTexto("Ingrese nombre del bibliotecario: ")
										claveBibliotecario <- pedirNumeroComoTexto("Ingrese clave num�rica (4 d�gitos): ")
										
										// Valido que la clave tenga 4 d�gitos
										Mientras Longitud(claveBibliotecario) <> 4
											Escribir "La clave debe tener exactamente 4 d�gitos."
											claveBibliotecario <- pedirNumeroComoTexto("Ingrese clave num�rica (4 d�gitos): ")
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
											
											opUsuario <- confirmarInformacion("Confirma el ingreso? (S/N)")
											
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
								
								opUsuario <- confirmarInformacion("Desea agregar otro bibliotecario? (S/N)")
								
								Si opUsuario = "S" Entonces
									Limpiar Pantalla
								Sino 	
									Escribir "Volviendo a Gesti�n de Bibliotecarios..."
								FinSi
								
							Hasta Que Mayusculas(opUsuario) = "N"
								
							
							Escribir "Volviendo a Gesti�n de Bibliotecarios..."
							Esperar 2 segundos
							Limpiar Pantalla
							
						"2":	//Elimino Bibliotecario							
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
                                    Escribir "No se encontr� un bibliotecario con ese nombre."
                                Sino
                                    Escribir "Bibliotecario encontrado: ", bibliotecarios[indice, 0]
                                    
                                    opUsuario <- confirmarInformacion("Confirma que desea eliminar este bibliotecario? (S/N)")
                                    
                                    Si Mayusculas(opUsuario) = "S" Entonces
                                        bibliotecarios[indice, 0] <- ""
                                        bibliotecarios[indice, 1] <- ""
                                        Escribir "Bibliotecario eliminado exitosamente."
                                    Sino
                                        Escribir "Eliminaci�n de bibliotecario ", bibliotecarios[indice, 0], " cancelada."
                                    FinSi
                                FinSi
                            Sino
                                Escribir "No hay bibliotecarios registrados."
                            FinSi			
							
						"3":
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
                            
						"4":
							Escribir "Volviendo al men� de Administrador..."
							Esperar 1 Segundos
							Limpiar Pantalla
							
						De Otro Modo:
							Escribir "Eligi� una opci�n inv�lida."
					Fin Segun
				Hasta Que resp == "4"
			"2": //Gestiono Socios
				Escribir "Gesti�n de Socios En proceso..." //Terminar
				Repetir
					Escribir ""
					Escribir "*** GESTI�N DE SOCIOS ***"
					Escribir "1. Agregar Socio"
					Escribir "2. Modificar Socio"
					Escribir "3. Eliminar Socio"
					Escribir "4. Listar Socios"
					Escribir "5. Volver"
					Escribir "Elija una opci�n (1-5): "
					Leer resp
					
					Segun resp Hacer
						"1":
							Repetir
								Escribir "Crear socio (en proceso...)"
								crearSocio(socios, cantSocios)
								opUsuario <- confirmarInformacion("Desea agregar otro socio? (S/N)")
								
								Si opUsuario = "S" Entonces
									Limpiar Pantalla
								Sino 	
									Escribir "Volviendo a Gesti�n de Socios..."
								FinSi
								
							Mientras Que (opUsuario <> "N")
						"2":
							Escribir "Modificar socio... (en proceso)"
							Esperar 1 segundos
						"3":
							Escribir "Eliminar socio... (en proceso)"
							Esperar 1 segundos
						"4":	
							Escribir "Listar socios... (en proceso)"
							Esperar 1 segundos
						"5":	
							Escribir "Volviendo al men� de Administrador..."
							Esperar 1 Segundos
							Limpiar Pantalla
						De Otro Modo:
							Escribir "Opci�n incorrecta. Volviendo a Men� Administrador..."
							Esperar 1 segundo
					Fin Segun
					
				Hasta Que resp = "5"			
				
				Esperar 2 segundos
			"3":				
				//Gestiono Admins
				Repetir
					Escribir ""
					Escribir "*** GESTI�N DE ADMINISTRADORES ***"
					Escribir "1. Agregar Administrador"
					Escribir "2. Eliminar Administrador"
					Escribir "3. Listar Administradores"
					Escribir "4. Volver"
					Escribir "Elija una opci�n (1-4): "
					Leer resp
					
					Segun resp Hacer
						"1":  // Agregar Administrador							
							Repetir
								//Asigno posici�n en el array
								indice <- -1
								Para i <- 0 Hasta cantAdministradores -1 Hacer
									Si administradores[i, 0] = "" Entonces
										indice <- i
										i <- cantAdministradores -1  
									FinSi
								FinPara
								
								Si indice = -1 Entonces
									Escribir "No hay espacio disponible para agregar m�s administradores."
								Sino
									confirmar <- 0
									Mientras confirmar = 0 Hacer
										nombreAdmin <- pedirTexto("Ingrese nombre del administrador: ")
										claveAdmin <- pedirNumeroComoTexto("Ingrese clave num�rica (4 d�gitos): ")
										
										Mientras Longitud(claveAdmin) <> 4
											Escribir "La clave debe tener exactamente 4 d�gitos."
											claveAdmin <- pedirNumeroComoTexto("Ingrese clave num�rica (4 d�gitos): ")
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
											Escribir ""
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
								
								Escribir ""			
								
								opUsuario <- confirmarInformacion("Desea agregar otro administrador? (S/N)")
								
								Si opUsuario == "S" Entonces
									Limpiar Pantalla
								Sino 	
									Escribir "Volviendo a Gesti�n de Administradores..."
								FinSi								
								
								Esperar 2 segundo
								Limpiar Pantalla
							Hasta Que Mayusculas(opUsuario) = "N"
							
						"2":  // Eliminar Administrador  
							Escribir ""
							Escribir "*** ELIMINAR ADMINISTRADOR ***"
							Escribir ""
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
								Si cantAdmins = 0 Entonces
									Escribir ""
									Escribir "NO SE PUEDE ELIMINAR AL ADMIN"
									Escribir "Debe haber al menos un administrador del Sistema"
								SiNo
									Escribir ""
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
										Escribir "No se encontr� un Administrador con ese nombre."
									Sino
										Escribir "Administrador encontrado: ", administradores[indice, 0]
										dato <-administradores[indice, 0]
										opUsuario <- confirmarInformacion("�Confirma que desea eliminar al administrador " + dato + "? (S/N)")	
										
										Si Mayusculas(opUsuario) = "S" Entonces
											administradores[indice, 0] <- ""
											administradores[indice, 1] <- ""
											Escribir "Administrador eliminado exitosamente."
										Sino
											Escribir "Eliminaci�n cancelada."
										FinSi
									FinSi
								FinSi										
							FinSi
						"3":   // Listar Administradores
							
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
							
							Si totalAdministradores = 0 Entonces //No deberia pasar, ver! 
								Escribir "No hay Administradores registrados."
							Sino
								Escribir "----------------------------------------"
								Escribir "Total de Administradores registrados: ", totalAdministradores
							FinSi
						"4":  
							Escribir "Volviendo al men� de Administrador..."
							Esperar 1 Segundos
							Limpiar Pantalla
						De Otro Modo:
							Escribir "Opci�n incorrecta"
							Esperar 1 segundo
					Fin Segun
				Hasta Que resp == "4"
			"4":	
				Escribir "Volviendo al Men� principal..."
				Esperar 2 Segundos
				Limpiar Pantalla
			De Otro Modo:
				Escribir "Eligi� una opci�n inv�lida."
		Fin Segun		
		
	Hasta Que opAdmin == "4"	
FinSubAlgoritmo


//Vista Bibliotecario
SubAlgoritmo bibliotecario(libros Por Referencia, cantLibros, socios Por Referencia, cantSocios, prestamos Por Referencia, cantPrestamos, camposPrestamos)
	Definir resp Como Caracter
	Definir op, modulo, opLibros, opSocios, opAcceso, i, j Como Entero 
	
	Repetir
		mostrarMenuPpalBibliotecario
		Leer modulo
		
		Segun modulo Hacer
			1:
				Repetir
					mostrarMenuLibros
					Leer opLibros
					Esperar 2 Segundos
					Limpiar Pantalla
					
					Segun opLibros Hacer
						1: //Agregar Libros
							Repetir
								crearLibro(libros, cantLibros)
								
								resp <- confirmarInformacion("Desea agregar otro libro? (S/N)")
								
								Si resp = "S" Entonces
									Limpiar Pantalla
								Sino 	
									Escribir "Volviendo a Men� de Libros..."
								FinSi
									
								Esperar 1 Segundos
								Limpiar Pantalla
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
										registrarPrestamo(libros, socios, prestamos, cantLibros, cantSocios, cantPrestamos)		
									5:	
										mostrarPrestamos(prestamos, cantPrestamos)
									6:
										registrarDevolucion(libros, socios, prestamos, cantLibros, cantSocios, cantPrestamos, camposPrestamos)
										Escribir ""
									7:
										Escribir "Volviendo a menu anterior..."
										Esperar 1 segundos 
										Limpiar Pantalla
									De Otro Modo:
										Escribir "Eligi� una opci�n inv�lida."
								Fin Segun
							Hasta Que (op==7)
						3:
							Escribir "Volviendo al menu principal..."
							Esperar 1 segundo
							Limpiar Pantalla
						De Otro Modo:
							Escribir "Eligi� una opci�n inv�lida."
					Fin Segun
					
				Mientras que (opLibros<>3)
			2:
				Repetir
					mostrarMenuSocios
					Leer opSocios
					Esperar 1 segundos
					
					Segun opSocios Hacer
						1: //Agregar Socios
							Repetir
								crearSocio(socios, cantSocios)
								
								resp <- confirmarInformacion("�Desea agregar otro socio? (S/N)")
								
								Si resp = "S" Entonces
									Limpiar Pantalla
								Sino 	
									Escribir "Volviendo a Men� de Socios..."
								FinSi								
								
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
										Escribir "Volviendo a men� anterior..."
										Esperar 1 segundos 
										Limpiar Pantalla
									De Otro Modo:
										Escribir "Eligi� una opci�n inv�lida."
								Fin Segun
							Hasta Que (op = 4)
							
						3: 
							Escribir "Volviendo al men� principal..."
							Esperar 1 segundos
							Limpiar Pantalla
							
						De Otro Modo:
							Escribir "Eligi� una opci�n inv�lida."
					Fin Segun
					
				Hasta Que (opSocios = 3) 
			3:
				Escribir "Volviendo a Menu de Usuarios..."
				Esperar 1 Segundos
				Limpiar Pantalla
			De Otro Modo:
				Escribir "Eligi� una opci�n inv�lida."
		Fin Segun
	Hasta Que (modulo==3)
FinSubAlgoritmo

//*******************************************SOCIOS*******************************************************
//Vista Socios -- En proceso!!!
SubAlgoritmo sociosVista (Libros Por Referencia, cantLibros, prestamos Por Referencia, cantPrestamos)
	Definir op Como Entero
	
	Repetir		
		Escribir ""
        Escribir "*** MEN� SOCIOS ***"
        Escribir "1. Ver Libros Disponibles"
        Escribir "2. Ver mis pr�stamos activos"
        Escribir "3. Ver mi estado"
		Escribir "4. Volver al men� principal"
        Escribir "Elija una opci�n (1-4): "
        Leer op
		Esperar 1 segundos
		
		Segun op Hacer
			1:
				mostrarLibros(libros, cantLibros)
				Escribir ""
				Escribir "Presione una tecla para Volver..."
				Esperar Tecla
				Limpiar Pantalla
			2:
				Escribir ""
				mostrarPrestamoSocio(prestamos, cantPrestamos, libros, cantlibros)
				Escribir "Ac� podr� ver pr�stamos..."
				Esperar 2 Segundos
				Limpiar Pantalla
			3:
				//Ver Estado
				Escribir "Ac� podr� ver su estado.."
				Esperar 2 Segundos
				Limpiar Pantalla
			4:	
				Escribir "Volviendo a Men� anterior..."
				Esperar 1 segundo
			De Otro Modo:
				Escribir "Opci�n inv�lida"
		Fin Segun	
		
	Hasta Que op=4
		
FinSubAlgoritmo

//Respuesta S/N
Funcion respuesta<-confirmarInformacion(mensaje) 
	Definir respuesta Como Caracter	
	Repetir
		Escribir mensaje
		Leer respuesta
		respuesta <- Mayusculas(respuesta)	
		
		Mientras respuesta <> "S" Y respuesta <> "N"
			Escribir "Por favor ingrese S para S� o N para No."	
			Leer respuesta
			respuesta <- Mayusculas(respuesta)	
		FinMientras
	Hasta Que (respuesta == "S" O respuesta == "N")
FinFuncion



//*******************************************MENUES PARA MOSTRAR*******************************************************
SubProceso  mostrarMenuAcceso
	Escribir ""
	Escribir "Indique su tipo de usuario (0 para Salir del Sistema): "
	Escribir ""
	Escribir "	1. ADMIN"
	Escribir "	2. BIBLIOTECARIO"
	Escribir "	3. SOCIO"
	Escribir "	0. Salir"
	Escribir ""
FinSubProceso

SubProceso mostrarMenuPpalAdmin
	Escribir ""
	Escribir "Elija el m�dulo al que quiere acceder (4 para Volver): "
	Escribir ""
	Escribir "	1. ADMINs"
	Escribir "	2. BIBLIOTECARIOS"
	Escribir "	3. SOCIOS"
	Escribir "4. Volver"
	Escribir ""
FinSubProceso

SubProceso mostrarMenuPpalBibliotecario
	Escribir ""
	Escribir "Elija el m�dulo al que quiere acceder (3 para Volver): "
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
	Escribir ""
	Escribir Sin Saltar "Elija la opcion: "	
FinSubProceso

SubProceso  mostrarSubMenuConsultaLibros
	Escribir ""
	Escribir "***Sub Menu Consulta de Libros***"
	Escribir "1. Buscar Libro"
	Escribir "2. Modificar datos de libro"
	Escribir "3. Listado de Libros"
	Escribir "4. Registrar Pr�stamo"
	Escribir "5. Listado de Pr�stamos"
	Escribir "6. Registrar Devoluci�n"
	Escribir "7. Volver"
	Escribir ""
	Escribir Sin Saltar "Elija la opcion: "
FinSubProceso

SubProceso mostrarMenuSocios
	Escribir ""
	Escribir "**** MENU SOCIOS ****"
	Escribir "1. Agregar socio"		
	Escribir "2. Consultar socios"
	Escribir "3. Volver al menu principal"
	Escribir ""
	Escribir Sin Saltar "Elija la opcion: "	
FinSubProceso

SubProceso  mostrarSubMenuConsultaSocios	
	Escribir ""
	Escribir "***Sub Menu Consulta de Socios***"
	Escribir "1. Buscar Socio"
	Escribir "2. Modificar datos del socio"
	Escribir "3. Listado de Socios"
	Escribir "4. Volver"
	Escribir ""
	Escribir Sin Saltar "Elija la opcion: "
FinSubProceso

//*******************************************FUNCIONES AUXILIARES*******************************************************
//Asigno posici�n a cada libro ingresado
Funcion posicion<-buscarUltimo(libros, cantLibros) 
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
		Si (letra < "A" o letra > "Z") y (letra < "a" o letra > "z") y (letra <> "�") y (letra <> "�") y (letra <> "�") y (letra <> "�") y (letra <> "�") y (letra <> "�") y (letra <> "�") y (letra <> "�") y (letra <> "�") y (letra <> "�") y (letra <> "�") y (letra <> "�") y (letra <> " ") Entonces
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
		Escribir Sin Saltar mensaje
		Leer input
		input<-Mayusculas(input)
		
		Si validarTexto(input)=Verdadero Entonces
			esTextoValido <- Verdadero
		SiNo
			Escribir "Ingrese un texto v�lido"
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
			esTextoValido <- Verdadero
		Sino
			Para i<-0 Hasta Longitud(resp)-1 Con Paso 1 Hacer
				letra <- Subcadena(resp, i ,i)	
				Si (letra < "A" o letra > "Z") y (letra < "a" o letra > "z") y (letra <> "�") y (letra <> "�") y (letra <> "�") y (letra <> "�") y (letra <> "�") y (letra <> "�") y (letra <> "�") y (letra <> "�") y (letra <> "�") y (letra <> "�") y (letra <> "�") y (letra <> "�") y (letra <> " ") Entonces
					esTextoValido <- Falso	
				Sino 
					esTextoValido <- Verdadero
				FinSi
			Fin Para	
			Si !esTextoValido
				Escribir "Error. El nombre s�lo puede contener letras"				
			FinSi
		FinSi	
	Hasta Que esTextoValido	
    
	Si esTextoValido
		txtOpcional <- resp		
	FinSi
	
	
FinFuncion

//Valido N�meros
Funcion esNumero <- EsNumeroEnteroPositivo(cadenaAVerificar)
	Definir i, valorNum Como Entero
	Definir letra Como Caracter
	Definir esNumero Como Logico
	esNumero <- Verdadero
	
	Para i <- 0 Hasta Longitud(cadenaAVerificar) -1 Hacer
		letra <- Subcadena(cadenaAVerificar,i,i) //recorro x caracter
		Si (letra > "9" o letra < "0") Entonces
			esNumero <- Falso		
		FinSi		
	FinPara
	
	Si esNumero Entonces
		valorNum <- ConvertirANumero(cadenaAVerificar)
		Si valorNum>=0
			esNumero <- Verdadero
		SiNo
			esNumero <- Falso
		FinSi	
	FinSi
	
FinFuncion


//Pido numeros
Funcion num <- pedirNumero(mensaje)
	definir num Como Entero
	Definir esNumero Como Logico
	definir numInput, input como cadena
	esNumero <- Falso	
	
	Mientras !esNumero Hacer
		Escribir Sin Saltar mensaje
		
		leer numInput
		Si Longitud(numInput)>11 Entonces
			Escribir "El n�mero debe tener hasta 11 d�gitos"
		SiNo
			input <- (numInput)		
		FinSi	
		
		Si (EsNumeroEnteroPositivo(input)=Verdadero) Entonces
			esNumero <- Verdadero
		SiNo
			Escribir "Ingrese un numero v�lido"
		FinSi
	FinMientras
	num <- ConvertirANumero(input)
FinFuncion

// Pido un n�mero pero lo devuelvo como texto
Funcion numTexto <- pedirNumeroComoTexto(mensaje)
    Definir num Como Entero
    Definir numTexto Como Cadena
    num <- pedirNumero(mensaje) // ya validado como n�mero
	numTexto <- ConvertirATexto(num)
    
FinFuncion

//Pido un n�mero (opcional) y devuelvo como texto - para modificaciones
Funcion numTexto <- pedirNumeroComoTextoOpcional(mensaje, valorActual)
    Definir num Como Entero
    Definir numTexto, resp Como Cadena
    Definir esNumero Como Logico
	
    Escribir Sin Saltar mensaje
    Leer resp
	
    Si Longitud(resp) = 0 Entonces
        numTexto <- valorActual
    Sino
        esNumero <- EsNumeroEnteroPositivo(resp)
        Si esNumero Entonces
            numero <- ConvertirANumero(resp)
            numTexto <- ConvertirATexto(num)
        Sino
            Escribir "Entrada inv�lida. Ingrese un n�mero. "
            numTexto <- pedirNumeroComoTextoOpcional(mensaje, valorActual) 
        FinSi
    FinSi
FinFuncion


Funcion fechaDev <- pedirFechaDevolucion
    Definir anio, mes, dia Como Entero
    Definir fechaDev Como Cadena
    
    Escribir ""
    Escribir "*** FECHA DE DEVOLUCI�N ***"
    anio <- pedirNumero("Ingrese el a�o de devoluci�n (AAAA): ")
    mes <- pedirNumero("Ingrese el mes de devoluci�n (1-12): ")
    
    Mientras mes < 1 O mes > 12
        Escribir "Mes inv�lido. Ingrese un mes entre 1 y 12:"
        mes <- pedirNumero("Ingrese el mes de devoluci�n (1-12): ")
    FinMientras
    
    dia <- pedirNumero("Ingrese el d�a de devoluci�n (1-31): ")
    
    Mientras dia < 1 O dia > 31
        Escribir "D�a inv�lido. Ingrese un d�a entre 1 y 31:"
        dia <- pedirNumero("Ingrese el d�a de devoluci�n (1-31): ")
    FinMientras
    
    // Validaci�n b�sica de d�as por mes
    Si (mes = 4 O mes = 6 O mes = 9 O mes = 11) Y dia > 30 Entonces
        Escribir "Este mes solo tiene 30 d�as. Se ajustar� a 30."
        dia <- 30
    FinSi
    
    Si mes = 2 Entonces
        Si (anio MOD 4 = 0 Y anio MOD 100 <> 0) O (anio MOD 400 = 0) Entonces
            Si dia > 29 Entonces
                Escribir "Febrero no puede tener m�s de 29 d�as en a�o bisiesto. Se ajustar� a 29."
                dia <- 29
            FinSi
        Sino
            Si dia > 28 Entonces
                Escribir "Febrero no puede tener m�s de 28 d�as. Se ajustar� a 28."
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
    
    Escribir "Fecha de devoluci�n: ", fechaDev
FinFuncion

Funcion esValida <- validarFechaDevolucion(fechaPrestamo, fechaDevolucion)
    Definir esValida Como Logico
    Definir diaP, mesP, anioP, diaD, mesD, anioD Como Entero
    
    // Convertir fecha pr�stamo (DD/MM/AAAA)
    diaP <- ConvertirANumero(Subcadena(fechaPrestamo, 0, 1))
    mesP <- ConvertirANumero(Subcadena(fechaPrestamo, 3, 4))
    anioP <- ConvertirANumero(Subcadena(fechaPrestamo, 6, 9))
    
    // Convertir fecha devoluci�n (DD/MM/AAAA)
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

//*******************************************LIBROS*******************************************************
//Crear libro
funcion crearLibro(libros Por Referencia, cantLibros)
	Definir idLibro, tituloLibro, autorLibro, generoLibro, anoPublicacionLibro, stockLibro, opUsuario como caracter
	Definir confirmar, indice, numTemporal, stockTemporal Como Entero
	confirmar <- 0
	indice <- buscarUltimo(libros, cantLibros) 
	Mientras confirmar = 0 Hacer
		Escribir ""
		Escribir "***INGRESO DE NUEVO LIBRO***"
		idLibro<-generarId(cantLibros)
		tituloLibro<-pedirTexto("Ingrese Nombre del libro: ")
		autorLibro<-pedirTexto("Ingrese Autor: ")
		generoLibro<-pedirTexto("Ingrese G�nero: ")
		numTemporal<-pedirNumero("A�o de publicacion: ")
		anoPublicacionLibro <- ConvertirATexto(numTemporal)
		stockTemporal<-pedirNumero("Cantidad de ejemplares: ") 
		Mientras stockTemporal <=0
			Escribir "Ingrese una cantidad v�lida"
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
		Escribir sin saltar "A�o de publicacion: "
		Escribir anoPublicacionLibro
		Escribir sin saltar "Stock: "
		Escribir stockLibro 
		
		opUsuario <- confirmarInformacion("Confirma ingreso? (S/N)")
		
		Esperar 1 segundo
		Si Mayusculas(opUsuario) = "S" Entonces
			confirmar <- 1
			Escribir "Ingreso del libro ", tituloLibro " confirmado"				
		Sino	
			Escribir "Ingreso del libro ", tituloLibro " no confirmado"	
			confirmar <- 1
		FinSi
		Escribir""
		Esperar 1 segundo
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
		Escribir "**B�SQUEDA DE LIBRO**"
		Escribir "Elija un criterio de b�squeda"
		Escribir "1. Id"
		Escribir "2. T�tulo"
		Escribir "3. Autor"
		Escribir "4. G�nero"
		Escribir "5. A�o de publicaci�n"
		Escribir "6. Volver"
		Escribir ""
		Escribir Sin Saltar "Ingrese una opci�n (1-6): "
		Leer opUsuario
		
		Segun opUsuario Hacer
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
				Escribir "Volviendo al men� de Libros..."
				Limpiar Pantalla
			De Otro Modo:
				Escribir "Eligi� una opci�n inv�lida."
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
				Escribir "T�tulo: ", libros[indice, 1]
				Escribir "Autor: ", libros[indice, 2]
				Escribir "G�nero: ", libros[indice, 3]
				Escribir "A�o: ", libros[indice, 4]
				Escribir "Disponible: ", libros[indice, 5]
				Escribir "Stock: ", libros[indice, 7]
				Escribir ""
			FinPara
		FinSi			
	FinSi  
FinFuncion

//Modificar Libro
Funcion modificarLibro(libros Por Referencia, cantLibros)
    Definir i, idBuscado, indice, confirmar, nuevoDatoNum Como Entero
    Definir opUsuario, nuevoDato, tituloLibro, autorLibro, generoLibro, anoPublicacionLibro, stockLibro Como Cadena
	Definir datoValido Como Logico
	
    // Pedir el ID del libro a modificar
	Escribir ""
	Escribir "**MODIFICACI�N DE LIBRO**"
    Escribir "Ingrese el ID del libro a modificar: "
    Leer idBuscado
	
    // Buscar el libro en la matriz
    indice <- -1
    Para i <- 0 Hasta cantLibros-1
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
		stockLibro <- libros[indice,7]
		
        confirmar <- 0
        Mientras confirmar = 0 Hacer
            Limpiar Pantalla
            Escribir "***DATOS ACTUALES DEL LIBRO***"
            Escribir "ID: ", libros[indice,0]
            Escribir "Titulo: ", tituloLibro
            Escribir "Autor: ", autorLibro
            Escribir "Genero: ", generoLibro
            Escribir "A�o de Publicacion: ", anoPublicacionLibro
			Escribir "Ejemplares disponibles: ", stockLibro
			
            Escribir "Ingrese los nuevos datos (dejar vac�o para no cambiar):"
			
			nuevoDato <- pedirTextoOpcional("Nuevo T�tulo: ", tituloLibro)
			nuevoDato <- Mayusculas(nuevoDato)
			Si Longitud(nuevoDato) > 0 Entonces
				tituloLibro <- nuevoDato
			FinSi	
			
			nuevoDato <- pedirTextoOpcional("Nuevo Autor: ", autorLibro)
			nuevoDato <- Mayusculas(nuevoDato)
			Si Longitud(nuevoDato) > 0 Entonces
				autorLibro <- nuevoDato
			FinSi	
			
			nuevoDato <- pedirTextoOpcional("Nuevo G�nero: ", generoLibro)
			nuevoDato <- Mayusculas(nuevoDato)
			Si Longitud(nuevoDato) > 0 Entonces
				generoLibro <- nuevoDato
			FinSi	
			
			anoPublicacionLibro <- pedirNumeroComoTextoOpcional("Nuevo A�o de Publicacion: ", anoPublicacionLibro)
			
			stockLibro <- pedirNumeroComoTextoOpcional("Nueva cantidad de ejemplares: ", stockLibro)

			Esperar 2 segundos
            Limpiar Pantalla
            Escribir "***DATOS DEL LIBRO MODIFICADOS***"
            Escribir "ID: ", libros[indice,0]
            Escribir "Titulo: ", tituloLibro
            Escribir "Autor: ", autorLibro
            Escribir "Genero: ", generoLibro
            Escribir "A�o de Publicacion: ", anoPublicacionLibro
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
			Escribir""
			Escribir"Volviendo a Sub Menu Consulta de Libros..."
			Esperar 2 segundo
			Limpiar Pantalla
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
	Para i <- 0 Hasta cantLibros-1		
		Si libros[i,0] <> "" Entonces
			Escribir "----------------------------------------"
			Escribir "ID: ", libros[i,0]
			Escribir "Titulo: ", libros[i,1]
			Escribir "Autor: ", libros[i,2]
			Escribir "Genero: ", libros[i,3]
			Escribir "A�o de Publicacion: ", libros[i,4]
			Escribir "Disponible: ", libros[i,5]
			Escribir "Cantidad de ejemplares disponibles para pr�stamo: ", libros[i,7]
			Si libros[i,8]="" Entonces
				Escribir "No hay ejemplares de este libro en pr�stamo"
			Sino 
				Escribir "Cantidad de ejemplares en pr�stamo: ", libros[i,8]	
			FinSi
		FinSi
	FinPara
	Escribir ""
	Escribir "				FIN DEL LISTADO DE LIBROS CARGADOS"
	Escribir "				Presione una tecla para volver al men� de Consulta de Libros"
	Esperar Tecla
	Esperar 1 segundo
	Limpiar Pantalla
FinFuncion


//*******************************************SOCIOS*******************************************************
//Crear socio
Funcion crearSocio(socios Por Referencia, cantSocios)
	Definir opUsuario, dniSocio, nombreSocio, telSocio, estadoSocio como caracter
	Definir confirmar, indice, numTemporal Como Entero
	confirmar <- 0
	indice <- buscarUltimo(socios, cantSocios) 
	Mientras confirmar = 0 Hacer
		Escribir ""
		Escribir "***INGRESO DE NUEVO SOCIO***"
		dniSocio <- pedirNumeroComoTexto("Ingrese DNI del socio: ")
		nombreSocio<-pedirTexto("Ingrese Nombre y Apellido del socio: ")
		telSocio <- pedirNumeroComoTexto("Ingrese el tel�fono: ")
		estadoSocio <- "HABILITADO"
		Limpiar Pantalla
		
		Escribir "***DATOS DEL NUEVO SOCIO***"
		Escribir Sin Saltar "DNI del socio: "
		Escribir dniSocio
		Escribir Sin Saltar "Nombre y Apellido: "
		Escribir nombreSocio
		Escribir sin saltar "Tel�fono: "
		Escribir telSocio
		Escribir sin saltar "Estado: "
		Escribir estadoSocio
		
		Escribir ""
		opUsuario <- confirmarInformacion("Confirma ingreso? (S/N)")
		Esperar 1 segundo
		
		Si Mayusculas(opUsuario) = "S" Entonces
			confirmar <- 1
			Escribir "Ingreso del Socio ", nombreSocio " confirmado"				
		Sino	
			Escribir "Ingreso del Socio ", nombreSocio " cancelado"
			confirmar <- 1
		FinSi
		Escribir""
		Esperar 1 segundo
		
	FinMientras
	
	// Guardo cambios en la matriz
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
		Escribir "**B�SQUEDA DE SOCIO**"
		Escribir "Elija un criterio de b�squeda"
		Escribir "1. DNI"
		Escribir "2. Nombre"
		Escribir "3. Estado"
		Escribir "4. Volver"
		Escribir ""
		Escribir Sin Saltar "Ingrese una opci�n (1-4): "
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
				Escribir "Volviendo al men� de Socios..."
				Esperar 1 Segundos
				Limpiar Pantalla
			De Otro Modo:
				Escribir "Eligi� una opci�n inv�lida."				
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
				Escribir "Socio encontrado:"
				Escribir "DNI: ", socios[indice, 0]
				Escribir "Nombre y apellido: ", socios[indice, 1]
				Escribir "Tel�fono: ", socios[indice, 2]
				Escribir "Estado: ", socios[indice, 3]
				Escribir ""
			FinPara
		FinSi	
	FinSi			
FinFuncion

//Modificar Socio
Funcion modificarSocio(socios Por Referencia, cantSocios)
    Definir i, indice, confirmar Como Entero
    Definir opUsuario, nuevoDato, nombreSocio,telSocio,estadoSocio, penalizacionSocio, idBuscado Como Cadena
	
    // Pedir el dni del socio a modificar
	Escribir ""
	Escribir "**MODIFICACI�N DE SOCIO**"
    idBuscado <- pedirNumeroComoTexto("Ingrese el DNI del socio a modificar: ")
	
    // Buscar el socio en la matriz
    indice <- -1
    Para i <- 0 Hasta cantSocios-1
        Si socios[i,0] = idBuscado Entonces
            indice <- i
        FinSi
    FinPara
	
    // Verifico si se encontr� el socio
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
			Escribir ""
            Escribir "***DATOS ACTUALES DEL SOCIO***"
            Escribir "DNI: ", socios[indice,0]
            Escribir "Nombre y apellido: ", nombreSocio
            Escribir "Tel�fono: ", telSocio
            Escribir "Estado: ", estadoSocio
            Escribir "Ingrese los nuevos datos (dejar vac�o para no cambiar):"
			Escribir ""
			
			nuevoDato <- pedirTextoOpcional("Nuevo Nombre y apellido: ", nombreSocio)
			nuevoDato <- Mayusculas(nuevoDato)
			Si Longitud(nuevoDato)>0 Entonces
				nombreSocio <-  nuevoDato				
			FinSi
			
			
			telSocio <- pedirNumeroComoTextoOpcional("Nuevo Tel�fono: ", telSocio)		
			
            Escribir Sin Saltar "Nuevo Estado (H = HABILITADO / I = INHABILITADO / M = MULTADO): "
			Leer nuevoDato	
			nuevoDato <- Mayusculas(nuevoDato)
            Si Longitud(nuevoDato) > 0 Entonces
				Si (nuevoDato <> "H" y nuevoDato <> "I" y nuevoDato <> "M")
					Escribir "Eligi� un estado inv�lido, permanecer� el anterior"
				SiNo					
					estadoSocio <- nuevoDato
				FinSi
				Segun estadoSocio Hacer
					"H":
						estadoSocio <- "HABILITADO"
					"I":
						estadoSocio <- "INHABILITADO"
					"M":
						estadoSocio <- "MULTADO"
						Escribir "Ingrese los dias de penalizaci�n: "
						leer penalizacionSocio
				Fin Segun
            FinSi			
			Esperar 2 segundos
            Limpiar Pantalla
            Escribir "***DATOS DEL SOCIO MODIFICADOS***"
            Escribir "DNI: ", socios[indice,0]
            Escribir "1. Nombre y apellido: ", nombreSocio
            Escribir "2. Tel�fono: ", telSocio
            Escribir "3. Estado: ", estadoSocio
			
			Escribir ""
			opUsuario <- confirmarInformacion("Confirma los cambios? (S/N)")
            
			Esperar 1 segundo
            Si Mayusculas(opUsuario) = "S" Entonces
                confirmar <- 1
				Escribir "Cambios del Socio ", nombreSocio " confirmados"				
			Sino	
				Escribir "Cambios no confirmados"
				confirmar <- 1
            FinSi
			Escribir""
			Esperar 1 segundo
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
			Escribir "Tel�fono: ", socios[i,2]
			Escribir "Estado: ", socios[i,3]
				Si socios[i,3] = "MULTADO" Entonces
					Escribir "D�as de penalizaci�n: ", socios[i,4]
				FinSi
		FinSi
	FinPara
	Escribir ""
	Escribir "				FIN DEL LISTADO DE SOCIOS CARGADOS"
	Escribir "				Presione una tecla para volver al men� de Consulta de Socios"
	Esperar Tecla
	Esperar 1 segundo
	Limpiar Pantalla
FinFuncion


//Fecha pr�stamo -- fechaFinPrestamo 
Funcion fechasPrestamo(fechaInicio Por Referencia, fechaFinPrestamo Por Referencia)
	Definir fecha, anio, mes, dia, diasASumar, diasMes, diasRestantesMes Como Entero
	Definir diaTemp, mesTemp, anioTemp como Cadena
	
    fecha <- FechaActual() 
    anio <- trunc(fecha / 10000)
    mes <- trunc((fecha MOD 10000) / 100)
    dia <- fecha MOD 100
	
	Escribir "Fecha de inicio del pr�stamo: ", dia, "/", mes, "/", anio
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
    
    // D�as de validez del pr�stamo (una semana)
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
	
    Escribir "Fecha de finalizaci�n del pr�stamo: ", dia, "/", mes, "/", anio
	
    // Convierto fechas num�ricas a texto
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


//Muestro Libro - para pr�stamos y devoluciones
SubProceso mostrarLibroEncontrado(libros Por Referencia, indiceLibro)
	
	Escribir ""
	Escribir "-------------Datos del Libro---------------"
	Escribir "ID: ", libros[indiceLibro,0]
	Escribir "Titulo: ", libros[indiceLibro,1]
	Escribir "Autor: ", libros[indiceLibro,2]
	Escribir "Genero: ", libros[indiceLibro,3]
	Escribir "A�o de Publicacion: ", libros[indiceLibro,4]
	Escribir ""
FinSubProceso


//Muestro pr�stamo activo - para Socios
SubProceso mostrarPrestamoSocio(prestamos Por Referencia, cantPrestamos, libros Por Referencia, cantLibros)
	Definir i, indicePrestamo Como Entero
	definir dniSocio, idLibro, fechaPrestamo como Cadena
	indicePrestamo <- -1
	
	Escribir "Ingrese su DNI para ver pr�stamos activos"
	Leer dniSocio
	Escribir prestamos[0,0] 
	
	Para i <- 0 Hasta cantPrestamos-1 Hacer
		Si dniSocio = prestamos[i,1]  Entonces
			indicePrestamo <- i
			idLibro <- prestamos[i,0]
			fechaPrestamo <- prestamos[i,2]
		FinSi
	FinPara
	
	Si indicePrestamo  = -1 Entonces
		Escribir "El socio con DNI ", dniSocio " no tiene pr�stamos activos."
	SiNo
		//Busco el pr�stamo activo para el socio
		Escribir "El socio con DNI ", dniSocio " tiene en pr�stamo:"
		Para i <- 0 Hasta cantLibros-1 Hacer
			Si libros[i,0] = idLibro Entonces
			indiceLibro <- i
			mostrarLibroEncontrado(libros, i)
			FinSi
		FinPara
		Escribir "Presione una tecla para volver"
		Esperar Tecla
	FinSi		
	
FinSubProceso


//Registrar pr�stamo
Funcion registrarPrestamo(libros Por Referencia, socios Por Referencia, prestamos Por Referencia, cantLibros, cantSocios, cantPrestamos)
    Definir i, j, disponible, indiceLibro, indiceSocio, k, p, stockActual Como Entero
    Definir idBuscado, dniBuscado, op, fechaPrestamo, fechaFinPrestamo Como Cadena
    disponible <- -1
    indiceSocio <- -1
    p <- 0
	
    Escribir "REGISTRAR PR�STAMO DE LIBRO"
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
            Escribir "El libro ", libros[indiceLibro, 1] " est� disponible para pr�stamo"
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
                        Escribir "Socio ", socios[indiceSocio,1] " habilitado para pr�stamo"
						
						op <- confirmarInformacion("Desea registrar pr�stamo (S/N)?")
							
                        Segun op Hacer
                            "S":
                                Escribir "Registrando pr�stamo..."
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
								// Buscamos la primera fila vacia en prestamos y guardamos el indice en p
								Para k <- 0 Hasta cantPrestamos-1 Hacer
									Si prestamos[k,0] = "" Entonces
										p <- k
									FinSi
								FinPara
								//Guardamos los datos en la columna del indice p
                                prestamos[p,0] <- idBuscado
								prestamos[p,1] <- dniBuscado
                                prestamos[p,2] <- fechaPrestamo
                                prestamos[p,3] <- fechaFinPrestamo
                                libros[indiceLibro,6] <- fechaFinPrestamo
                                socios[indiceSocio,3] <- "INHABILITADO" // tiene pr�stamo activo
								socios[indiceSocio,4] <- "0"  // Reiniciar d�as de penalizacion
                                Escribir "Pr�stamo registrado con �xito"
								Escribir "Stock restante del libro: ", stockActual
                            "N":
                                Escribir "Volviendo a consultas..."
								Esperar 1 Segundos
								Limpiar Pantalla
                            De Otro Modo:
                                Escribir "Opci�n inv�lida"
                        Fin Segun
                    "INHABILITADO":
                        Escribir "Socio INHABILITADO: ya tiene un pr�stamo activo"
                    "MULTADO":
                        Escribir "Socio MULTADO: no puede sacar libros por ", socios[indiceSocio,4], " d�as"
                FinSegun
            FinSi
        Sino
			Escribir "El libro ", libros[indiceLibro,1]  " No se encuentra disponible para pr�stamo"
			Esperar 2 Segundos
			Limpiar Pantalla
        FinSi
    FinSi
FinFuncion

//Mostrar prestamos cargados
Funcion mostrarPrestamos(prestamos Por Referencia, cantPrestamos)	
	Definir i, totalPrestamos Como Entero
	totalPrestamos <- 0
	
	Escribir ""
	Escribir "*** LISTA DE PR�STAMOS ***"	
		
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
		Escribir "No hay pr�stamos activos en este momento."
	FinSi
	Esperar 3 segundos
FinFuncion


//Calculo atraso 
Funcion diasAtraso <- chequearPenalidad(fechaFinPrestamo, fechaDev)
    Definir diasAtraso, fechaFin, fechaDevNum Como Entero
    Definir diaCad, mesCad, anioCad Como Cadena
    
    diasAtraso <- 0
    
    // Convertir fechaDev (DD/MM/AAAA) a n�mero AAAAMMDD
    diaCad <- Subcadena(fechaDev, 0, 1)
    mesCad <- Subcadena(fechaDev, 3, 4)
    anioCad <- Subcadena(fechaDev, 6, 9)
    fechaDevNum <- ConvertirANumero(anioCad) * 10000 + ConvertirANumero(mesCad) * 100 + ConvertirANumero(diaCad)
    
    Si fechaFinPrestamo <> "" Y Longitud(fechaFinPrestamo) >= 10 Entonces
        // Convertir fechaFinPrestamo (DD/MM/AAAA) a n�mero AAAAMMDD
        diaCad <- Subcadena(fechaFinPrestamo, 0, 1)
        mesCad <- Subcadena(fechaFinPrestamo, 3, 4)
        anioCad <- Subcadena(fechaFinPrestamo, 6, 9)
        
        fechaFin <- ConvertirANumero(anioCad) * 10000 + ConvertirANumero(mesCad) * 100 + ConvertirANumero(diaCad)
        
        // Calcular d�as de atraso
        Si fechaDevNum > fechaFin Entonces
            diasAtraso <- (fechaDevNum - fechaFin)
            Escribir "D�as de atraso: ", diasAtraso
        Sino
            diasAtraso <- 0
            Escribir "No hay penalidad - Devoluci�n a tiempo"
        FinSi
    Sino
        diasAtraso <- 0
        Escribir "Error: Fecha de fin de pr�stamo no v�lida"
    FinSi
FinFuncion


//Calculo penalidad
Funcion fechaFinPenalidad <- calcularPenalidad(diasAtraso, fechaDevolucion)
    Definir fechaFinPenalidad Como Entero
    Definir diasPenalidad, diasMes, diasRestantesMes Como Entero
	Definir anio, mes, dia Como Entero
    
    Si diasAtraso > 0 Entonces
        diasPenalidad <- diasAtraso * 2
        
        Escribir "PENALIDAD POR DEVOLUCI�N TARD�A"
        Escribir "D�as de atraso: ", diasAtraso
        Escribir "Penalidad: No puede retirar libros por ", diasPenalidad, " d�as"        
		
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
        Escribir "Podr� retirar libros nuevamente a partir de esta fecha"
        Escribir ""
    FinSi
FinFuncion


//Gestiono devoluci�n
Funcion registrarDevolucion(libros Por Referencia, socios Por Referencia, prestamos Por Referencia, cantLibros, cantSocios, cantPrestamos, camposPrestamos)
    Definir i, j, indiceLibro, indiceSocio, indicePrestamo, diasAtraso, diasPenalidad, stockActual Como Entero
    Definir idLibro, dniSocio, op, fechaFinPrestamo, fechaPrestamo, fechaDev Como Cadena
    Definir fechaValida Como Logico
    
    indiceSocio <- -1
    indicePrestamo <- -1
    
    Escribir ""
    Escribir "REGISTRAR DEVOLUCI�N DE LIBRO"
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
		// BUSCAR PR�STAMO ACTIVO DEL SOCIO
		Para i <- 0 Hasta cantPrestamos-1 Hacer
			Si prestamos[i,1] = dniSocio Entonces
				indicePrestamo <- i
				idLibro <- prestamos[i,0]
				fechaPrestamo <- prestamos[i,2]
			FinSi
		FinPara
        Si indicePrestamo  = -1 Entonces
            Escribir "El socio no tiene pr�stamos activos."
		SiNo
			// BUSCAR EL PR�STAMO ACTIVO PARA ESTE LIBRO
			Para i <- 0 Hasta cantLibros-1 Hacer
				Si libros[i,0] = idLibro Entonces
					indiceLibro <- i
					mostrarLibroEncontrado(libros, i)
				FinSi
			FinPara
			
			op <- confirmarInformacion("Desea registrar devoluci�n (S/N)?")
				
			Si op = "S" Entonces
				Escribir "Registrando Devoluci�n..."
				Esperar 1 Segundo
				
				// PEDIR FECHA DE DEVOLUCI�N Y VALIDAR
				fechaDev <- pedirFechaDevolucion()
				
				// VERIFICAR QUE LA FECHA DE DEVOLUCI�N NO SEA ANTERIOR AL PR�STAMO
				fechaValida <- validarFechaDevolucion(prestamos[indicePrestamo,2], fechaDev)
				
				Si No fechaValida Entonces
					Escribir "Error: La fecha de devoluci�n no puede ser anterior a la fecha de pr�stamo."
					Escribir "Fecha de pr�stamo: ", prestamos[indicePrestamo,2]
				Sino
					// 2. CALCULAR PENALIZACI�N SI HAY ATRASO
					fechaFinPrestamo <- libros[indiceLibro,6]
					diasAtraso <- chequearPenalidad(fechaFinPrestamo, fechaDev)
					
					// 3. ACTUALIZAR ESTADO Y PENALIZACI�N DEL SOCIO
					Si diasAtraso > 0 Entonces
						diasPenalidad <- diasAtraso * 2
						socios[indiceSocio,3] <- "MULTADO"
						socios[indiceSocio,4] <- ConvertirATexto(diasPenalidad)
						Escribir "Devoluci�n con atraso. Socio multado por ", diasPenalidad, " d�as"
					Sino
						socios[indiceSocio,3] <- "HABILITADO"
						socios[indiceSocio,4] <- "0"
						Escribir "Devoluci�n en t�rmino. Socio habilitado para nuevos pr�stamos"
					FinSi
					
					// 4. LIMPIAR FECHA DE DEVOLUCI�N DEL LIBRO 
					//libros[indiceLibro,6] <- "" 
					
					// Elimino el pr�stamo
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
					
					Escribir ""
					Escribir "Devoluci�n registrada con �xito."
					Escribir "Stock actualizado del libro con id ", idLibro ": ", stockActual	
				FinSi
			Sino
				Si op = "N" Entonces
					Escribir "Volviendo a consultas..."
					Esperar 1 Segundos
					Limpiar Pantalla
				FinSi
			FinSi
		FinSi
	FinSi 
FinFuncion


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
	libros[0,1] <- "DON QUIJOTE"
	libros[0,2] <- "MIGUEL DE CERVANTES"
	libros[0,3] <- "NOVELA"
	libros[0,4] <- "1605"
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
	libros[2,1] <- "CIEN A�OS DE SOLEDAD"
	libros[2,2] <- "GABRIEL GARC�A M�RQUEZ"
	libros[2,3] <- "NOVELA"
	libros[2,4] <- "1967"
	libros[2,5] <- "1"
	libros[2,7] <- "2"
	
	libros[3,0] <- "10003"
	libros[3,1] <- "1984"
	libros[3,2] <- "GEORGE ORWELL"
	libros[3,3] <- "DISTOP�A"
	libros[3,4] <- "1949"
	libros[3,5] <- "1"
	libros[3,7] <- "3"
	
	libros[4,0] <- "10004"
	libros[4,1] <- "EL PRINCIPITO"
	libros[4,2] <- "ANTOINE DE SAINT-EXUP�RY"
	libros[4,3] <- "F�BULA"
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
	libros[6,3] <- "�PICA"
	libros[6,4] <- "800"
	libros[6,5] <- "1"
	libros[6,7] <- "3"
	
	libros[7,0] <- "10007"
	libros[7,1] <- "FLORES PARA ALGERNON"
	libros[7,2] <- "DANIEL KEYES"
	libros[7,3] <- "CIENCIA FICCI�N"
	libros[7,4] <- "1966"
	libros[7,5] <- "1"
	libros[7,7] <- "2"
	
	libros[8,0] <- "10008"
	libros[8,1] <- "RAYUELA"
	libros[8,2] <- "JULIO CORT�ZAR"
	libros[8,3] <- "NOVELA"
	libros[8,4] <- "1963"
	libros[8,5] <- "0"
	libros[8,7] <- "0"
	
	libros[9,0] <- "10009"
	libros[9,1] <- "LA DIVINA COMEDIA"
	libros[9,2] <- "DANTE ALIGHIERI"
	libros[9,3] <- "POES�A"
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
	libros[13,1] <- "DR�CULA"
	libros[13,2] <- "BRAM STOKER"
	libros[13,3] <- "TERROR"
	libros[13,4] <- "1897"
	libros[13,5] <- "1"
	libros[13,7] <- "2"
	
	libros[14,0] <- "10014"
	libros[14,1] <- "FAHRENHEIT 451"
	libros[14,2] <- "RAY BRADBURY"
	libros[14,3] <- "CIENCIA FICCI�N"
	libros[14,4] <- "1953"
	libros[14,5] <- "0"
	libros[14,7] <- "0"
	
	libros[15,0] <- "10015"
	libros[15,1] <- "EL NOMBRE DE LA ROSA"
	libros[15,2] <- "UMBERTO ECO"
	libros[15,3] <- "NOVELA HIST�RICA"
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
	libros[17,3] <- "FICCI�N"
	libros[17,4] <- "1915"
	libros[17,5] <- "1"
	libros[17,7] <- "1"
	
	libros[18,0] <- "10018"
	libros[18,1] <- "EL PERFUME"
	libros[18,2] <- "PATRICK S�SKIND"
	libros[18,3] <- "NOVELA"
	libros[18,4] <- "1985"
	libros[18,5] <- "1"
	libros[18,7] <- "2"
	
	libros[19,0] <- "10019"
	libros[19,1] <- "REBELI�N EN LA GRANJA"
	libros[19,2] <- "GEORGE ORWELL"
	libros[19,3] <- "S�TIRA POL�TICA"
	libros[19,4] <- "1945"
	libros[19,5] <- "1"
	libros[19,7] <- "3"
	
	libros[20,0] <- "10020"
	libros[20,1] <- "EL HOBBIT"
	libros[20,2] <- "J. R. R. TOLKIEN"
	libros[20,3] <- "FANTAS�A"
	libros[20,4] <- "1937"
	libros[20,5] <- "0"
	libros[20,7] <- "0"
	
	libros[21,0] <- "10021"
	libros[21,1] <- "EL SE�OR DE LOS ANILLOS"
	libros[21,2] <- "J. R. R. TOLKIEN"
	libros[21,3] <- "FANTAS�A"
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
	libros[24,1] <- "ALICIA EN EL PA�S DE LAS MARAVILLAS"
	libros[24,2] <- "LEWIS CARROLL"
	libros[24,3] <- "FANTAS�A"
	libros[24,4] <- "1865"
	libros[24,5] <- "1"
	libros[24,7] <- "3"
	
	libros[25,0] <- "10025"
	libros[25,1] <- "MATRIX RELOADED"
	libros[25,2] <- "WACHOWSKI"
	libros[25,3] <- "CIENCIA FICCI�N"
	libros[25,4] <- "2003"
	libros[25,5] <- "1"
	libros[25,7] <- "1"
	
	libros[26,0] <- "10026"
	libros[26,1] <- "HARRY POTTER Y LA PIEDRA FILOSOFAL"
	libros[26,2] <- "J. K. ROWLING"
	libros[26,3] <- "FANTAS�A"
	libros[26,4] <- "1997"
	libros[26,5] <- "1"
	libros[26,7] <- "3"
	
	libros[27,0] <- "10027"
	libros[27,1] <- "HARRY POTTER Y LA C�MARA SECRETA"
	libros[27,2] <- "J. K. ROWLING"
	libros[27,3] <- "FANTAS�A"
	libros[27,4] <- "1998"
	libros[27,5] <- "1"
	libros[27,7] <- "2"
	
	libros[28,0] <- "10028"
	libros[28,1] <- "HARRY POTTER Y EL PRISIONERO DE AZKABAN"
	libros[28,2] <- "J. K. ROWLING"
	libros[28,3] <- "FANTAS�A"
	libros[28,4] <- "1999"
	libros[28,5] <- "1"
	libros[28,7] <- "2"
	
	libros[29,0] <- "10029"
	libros[29,1] <- "HARRY POTTER Y EL C�LIZ DE FUEGO"
	libros[29,2] <- "J. K. ROWLING"
	libros[29,3] <- "FANTAS�A"
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
	libros[33,3] <- "CIENCIA FICCI�N"
	libros[33,4] <- "1965"
	libros[33,5] <- "1"
	libros[33,7] <- "3"
	
	libros[34,0] <- "10034"
	libros[34,1] <- "EL C�DIGO DA VINCI"
	libros[34,2] <- "DAN BROWN"
	libros[34,3] <- "SUSPENSO"
	libros[34,4] <- "2003"
	libros[34,5] <- "1"
	libros[34,7] <- "2"
	
	libros[35,0] <- "10035"
	libros[35,1] <- "�NGELES Y DEMONIOS"
	libros[35,2] <- "DAN BROWN"
	libros[35,3] <- "SUSPENSO"
	libros[35,4] <- "2000"
	libros[35,5] <- "1"
	libros[35,7] <- "2"
	
	libros[36,0] <- "10036"
	libros[36,1] <- "EL ALQUIMISTA"
	libros[36,2] <- "PAULO COELHO"
	libros[36,3] <- "FICCI�N"
	libros[36,4] <- "1988"
	libros[36,5] <- "1"
	libros[36,7] <- "3"
	
	libros[37,0] <- "10037"
	libros[37,1] <- "VER�NICA DECIDE MORIR"
	libros[37,2] <- "PAULO COELHO"
	libros[37,3] <- "NOVELA"
	libros[37,4] <- "1998"
	libros[37,5] <- "1"
	libros[37,7] <- "2"
	
	libros[38,0] <- "10038"
	libros[38,1] <- "EL DIARIO DE ANA FRANK"
	libros[38,2] <- "ANA FRANK"
	libros[38,3] <- "BIOGRAF�A"
	libros[38,4] <- "1947"
	libros[38,5] <- "1"
	libros[38,7] <- "2"
	
	libros[39,0] <- "10039"
	libros[39,1] <- "LOS JUEGOS DEL HAMBRE"
	libros[39,2] <- "SUZANNE COLLINS"
	libros[39,3] <- "DISTOP�A"
	libros[39,4] <- "2008"
	libros[39,5] <- "1"
	libros[39,7] <- "3"
	
	libros[40,0] <- "10040"
	libros[40,1] <- "EN LLAMAS"
	libros[40,2] <- "SUZANNE COLLINS"
	libros[40,3] <- "DISTOP�A"
	libros[40,4] <- "2009"
	libros[40,5] <- "1"
	libros[40,7] <- "2"
	
	libros[41,0] <- "10041"
	libros[41,1] <- "SINSAJO"
	libros[41,2] <- "SUZANNE COLLINS"
	libros[41,3] <- "DISTOP�A"
	libros[41,4] <- "2010"
	libros[41,5] <- "1"
	libros[41,7] <- "2"
	
	libros[42,0] <- "10042"
	libros[42,1] <- "EL JUEGO DE ENDER"
	libros[42,2] <- "ORSOM SCOTT CARD"
	libros[42,3] <- "CIENCIA FICCI�N"
	libros[42,4] <- "1985"
	libros[42,5] <- "1"
	libros[42,7] <- "3"
	
	libros[43,0] <- "10043"
	libros[43,1] <- "EL GUARDI�N ENTRE EL CENTENO"
	libros[43,2] <- "J. D. SALINGER"
	libros[43,3] <- "FICCI�N"
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
	
	socios[3, 0] <- "7062019"
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
	
	socios[6, 0] <- "13051985"
	socios[6, 1] <- "TOTA BOLLA"
	socios[6, 2] <- "1165218111" 
	socios[6, 3] <- "HABILITADO"
	socios[6, 4] <- ""
	
	socios[7, 0] <- "34862157"
	socios[7, 1] <- "LUIS CARRASCO"
	socios[7, 2] <- "1123456789"
	socios[7, 3] <- "HABILITADO"
	socios[7, 4] <- ""
	
	socios[8, 0] <- "25987456"
	socios[8, 1] <- "MARTA SALAS"
	socios[8, 2] <- "1134567890"
	socios[8, 3] <- "HABILITADO"
	socios[8, 4] <- ""
	
	socios[9, 0] <- "37658942"
	socios[9, 1] <- "DIEGO PEREYRA"
	socios[9, 2] <- "1145678901"
	socios[9, 3] <- "INHABILITADO"
	socios[9, 4] <- ""
	
	socios[10, 0] <- "40785621"
	socios[10, 1] <- "CARLA ACU�A"
	socios[10, 2] <- "1156789012"
	socios[10, 3] <- "MULTADO"
	socios[10, 4] <- "3"
	
	socios[11, 0] <- "42235897"
	socios[11, 1] <- "JUAN CRUZ"
	socios[11, 2] <- "1167890123"
	socios[11, 3] <- "HABILITADO"
	socios[11, 4] <- ""
	
	socios[12, 0] <- "43987564"
	socios[12, 1] <- "SOFIA NU�EZ"
	socios[12, 2] <- "1178901234"
	socios[12, 3] <- "HABILITADO"
	socios[12, 4] <- ""
	
	socios[13, 0] <- "45896237"
	socios[13, 1] <- "RICARDO DIAZ"
	socios[13, 2] <- "1189012345"
	socios[13, 3] <- "HABILITADO"
	socios[13, 4] <- ""
	
	socios[14, 0] <- "46985327"
	socios[14, 1] <- "ANA MARQUEZ"
	socios[14, 2] <- "1190123456"
	socios[14, 3] <- "MULTADO"
	socios[14, 4] <- "2"
	
	socios[15, 0] <- "47856231"
	socios[15, 1] <- "PABLO RAMOS"
	socios[15, 2] <- "1101234567"
	socios[15, 3] <- "HABILITADO"
	socios[15, 4] <- ""
	
	socios[16, 0] <- "48975623"
	socios[16, 1] <- "VICTOR HERRERA"
	socios[16, 2] <- "1112345678"
	socios[16, 3] <- "HABILITADO"
	socios[16, 4] <- ""
	
	socios[17, 0] <- "49785263"
	socios[17, 1] <- "LAURA VEGA"
	socios[17, 2] <- "1123456788"
	socios[17, 3] <- "HABILITADO"
	socios[17, 4] <- ""
	
	socios[18, 0] <- "50789563"
	socios[18, 1] <- "ANDRES PONCE"
	socios[18, 2] <- "1134567898"
	socios[18, 3] <- "INHABILITADO"
	socios[18, 4] <- ""
	
	socios[19, 0] <- "51628974"
	socios[19, 1] <- "ELENA FARIAS"
	socios[19, 2] <- "1145678908"
	socios[19, 3] <- "HABILITADO"
	socios[19, 4] <- ""
	
	socios[20, 0] <- "52369847"
	socios[20, 1] <- "SERGIO RUIZ"
	socios[20, 2] <- "1156789018"
	socios[20, 3] <- "HABILITADO"
	socios[20, 4] <- ""
	
	socios[21, 0] <- "53478562"
	socios[21, 1] <- "DANIELA MARTIN"
	socios[21, 2] <- "1167890128"
	socios[21, 3] <- "HABILITADO"
	socios[21, 4] <- ""
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
	
	// Si la l�nea es m�s corta que el m�ximo, completarla con espacios
	Si longitud_linea < max_contenido Entonces
		Para k <- 1 Hasta (max_contenido - longitud_linea) Hacer
			lineas[i] <- lineas[i] + " "
		FinPara
		longitud_linea <- max_contenido
	FinSi
	
	// Si la l�nea es m�s larga, truncarla
	Si longitud_linea > max_contenido Entonces
		lineas[i] <- SubCadena(lineas[i], 0, max_contenido)
		longitud_linea <- max_contenido
	FinSi
	
	linea_con_espacios <- ""
	
	// Espacios fijos a la izquierda
	Para j <- 1 Hasta espacios_izquierda Hacer
		linea_con_espacios <- linea_con_espacios + " "
	FinPara
	
	// L�nea de texto
	linea_con_espacios <- linea_con_espacios + lineas[i]
	
	// Espacios fijos a la derecha
	Para j <- 1 Hasta espacios_derecha Hacer
		linea_con_espacios <- linea_con_espacios + " "
	FinPara
	
	// Imprimir l�nea con bordes laterales
	Escribir("|" + linea_con_espacios + "|")
FinPara

Escribir(borde_inferior)

Esperar 2 Segundos
Limpiar Pantalla

FinSubproceso
