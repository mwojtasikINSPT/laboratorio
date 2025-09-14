//hacer las funciones para las validaciones
//funcion para que no se repita el aleatorio de idLibr0
//hacer genero de libros
Algoritmo biblioteca
	
	definir credencial, credencialAdmin Como caracter
	Definir tituloLibro, editorialLibro, autorLibro Como Caracter
	Definir op, idLibro, stockLibro Como Entero
	
	credencialAdmin <- "1234"
	Repetir
		Escribir "Ingrese la clave de acceso: " 
		Leer credencial
	Hasta Que credencial == credencialAdmin
	
	Escribir "Elija el módulo al que quiere acceder (1 - 2): "
	Escribir "1. LIBROS"
	Escribir "2. SOCIOS"
	Leer op
	
	Si op == 1 Entonces
		Escribir "**** MENU LIBROS ****"
		Escribir "1. Agregar libros"
		Escribir "2. Consultar libros"
		Escribir "Elija la opcion (1 - 2): "
		Leer op
		Si op == 1 Entonces
			idLibro <- Aleatorio(1000,9999)
			//Hacer una funcion que haga que no se repita el aleatorio
			Escribir "Ingrese el título del libro"
			Leer tituloLibro
			Escribir "Ingrese el autor del libro"
			Leer autorLibro
			//validar que sean letras a - z
			Escribir "Ingrese el editorial del libro"
			Leer editorialLibro
			Escribir "Ingrese el stock del libro"
			Leer stockLibro
			//validar que sea un entero > 0
			Escribir "LIBRO AGREGADO CON ÉXITO!!"
			Borrar Pantalla
		SiNo
			Si op == 2 Entonces
				Escribir "1. Ver estado"
				Escribir "2. Modificar datos"
				Escribir "3. Prestamo"
				Escribir "4: Devolución"
				Escribir "Elija la opcion (1 - 4): "
				Leer op
				
				Segun op Hacer
					1:
						//listar la cantidad que esta en prestamo y la cantidad que esta disponible
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
						Escribir "Eligió una opción inválida."
				Fin Segun
				
				SiNo
					Escribir "Eligió una opción inválida."
				Fin Si
		Fin Si
	SiNo
		
	Fin Si
	

FinAlgoritmo
