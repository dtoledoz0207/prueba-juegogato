class Tablero
	attr_writer :dimencion

	def initialize(dimencion)
		@dimencion = dimencion
		@tablero = []
		@posiciones_disponibles = dimencion ** 2

		@dimencion.times do
			@tablero << Array.new(@dimencion, '_')
		end

		@marca_x_ganadora = ''
		@dimencion.times { @marca_x_ganadora << 'X' }
		@marca_o_ganadora = ''
		@dimencion.times { @marca_o_ganadora << 'O' }
	end


	def dibujar ()
		
		#  ================= Dibujar tablero ===============================
		puts ' '
		@dimencion.times { |numero_columna| print "   #{numero_columna + 1} " }
		2.times { puts ' ' }
		
		@tablero.each_with_index do |fila, index|
			print "#{ index + 1 }  "
			fila.each do |columna|
				print columna
				print '    '
			end
			2.times { puts ' ' }
		end
		puts ' '
		#  ================= Termina Dibujar tablero ===============================
	end


	def agregar_marca(marca, fila, columna)
		@posiciones_disponibles -= 1
		#puts "Posiciones libres: #{@posiciones_disponibles}"
		@tablero[fila - 1][columna - 1] = marca
		if @posiciones_disponibles.zero?
			puts ' ===== EMPATE ===== '
			false
		else
			#puts "Posiciones libres: #{@posiciones_disponibles}"
			true
		end
	end

	def casilla_ocupada(fila, columna)
		contenido_de_casilla = @tablero[fila - 1][columna - 1]
		contenido_de_casilla == 'X' || contenido_de_casilla == 'O' ? true : false
	end

	# Metodo para revisar si se gano en una fila
	def marcas_iguales_en_fila(fila)
		marcas_en_fila = ''
		@tablero[fila - 1].each do |columna|
			marcas_en_fila << columna
		end
		#puts marcas_en_fila
		if marcas_en_fila == @marca_x_ganadora
			puts ' ***** GANO EL JUGADOR 1 ***** '
			true
		elsif marcas_en_fila == @marca_o_ganadora
			puts ' ***** GANO EL JUGADOR 2 ***** '
			true
		end
	end

	# Metodo para revisar si se gano en una columna
	def marcas_iguales_en_columna(columna)
		marcas_en_columna = ''
		@tablero.each do |fila|
			marcas_en_columna << fila[columna - 1]
		end

		#puts "Marcas en columna: #{marcas_en_columna}"

		if marcas_en_columna == @marca_x_ganadora
			puts " ***** GANO EL JUGADOR 1 ***** "
			true
		elsif marcas_en_columna == @marca_o_ganadora
			puts " ***** GANO EL JUGADOR 2 ***** "
			true
		end
	end


	# Metodo para revisar si se gano en una columa
	def marcas_iguales_en_diagonal

	end



end


jugador_1 = true
jugardor_2 = false

def volver_a_jugar(respuesta)
	if respuesta == 's'
		true
	else
		false
	end
end


puts ' '
puts ' **************** Bienvenido al juego de Tic Tac Toe **************** '
puts ' '
puts 'Elige una opcion para iniciar con el juego '
puts '  a - Juego normal 3 x 3'
puts '  b - Modificar la dimencion del tablero'
print 'Escribe una opcion: '
opcion = gets.chomp.downcase

case opcion
	when 'a'
		50.times { print '*' }
		puts ' '
		tablero = Tablero.new(3)
		tablero.dibujar
		loop do
			puts "#{jugador_1 ? "JUGADOR 1" : "JUGADOR 2"}"
			print 'Escribe el numero de la fila: '
			numero_de_fila = gets.chomp.to_i
			if numero_de_fila >= 1 && numero_de_fila <= 3
				print 'Escribe el numero de la columna: '
				numero_de_columna = gets.chomp.to_i
				if numero_de_columna >= 1 && numero_de_columna <= 3
					#puts "Vamos a colocar en la fila: #{numero_de_fila} y columna: #{numero_de_columna}"
					if tablero.casilla_ocupada(numero_de_fila, numero_de_columna)
						puts ' *** LA CASILLA YA ESTA MARCADA *** '
					else
						marca = jugador_1 ? 'X' : 'O'
						tablero.agregar_marca(marca, numero_de_fila, numero_de_columna)
						tablero.dibujar

						if tablero.marcas_iguales_en_fila(numero_de_fila)
							print '¿Volver a jugar? s/n: '
							respuesta = gets.chomp.downcase
							if volver_a_jugar(respuesta)
								system('clear')
								puts " *** Inicia el #{!jugador_1 ? "JUGADOR 1" : "JUGADOR 2"} *** "
								tablero = Tablero.new(3)
								tablero.dibujar
							else
								break
							end
						end


						if tablero.marcas_iguales_en_columna(numero_de_columna)
							print '¿Volver a jugar? s/n: '
							respuesta = gets.chomp.downcase
							if volver_a_jugar(respuesta)
								system('clear')
								puts " *** Inicia el #{!jugador_1 ? "JUGADOR 1" : "JUGADOR 2"} *** "
								tablero = Tablero.new(3)
								tablero.dibujar
							else
								break
							end
						end


						jugador_1 = !jugador_1
						jugardor_2 = !jugardor_2
						#tablero.dibujar
					end
				else
					puts '¡ERROR numero de COLUMNA No valido!'
				end
			else
				puts '¡ERROR numero de FILA No valido!'
			end
			#break
		end
	when 'b'
		puts 'Elegiste la opcion B'
	else
		puts 'OPCION NO VALIDA, ADIOS'
end







#tablero = Tablero.new(3)
#tablero.dibujar





