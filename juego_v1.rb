require './juegologica.rb'

class TicTacToeGame
	def initialize
		bienvenida
	end

	def bienvenida
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
				#iniciar_juego(3)
				juego = JuegoLogica.new(3)
			when 'b'
				print 'Escribe un numero entre 3 y 10 para personalizar el tablero: '
				dimencion = gets.chomp.to_i
				if dimencion >= 3 && dimencion <= 10
					#iniciar_juego(dimencion)
					juego = JuegoLogica.new(dimencion)
				else
					puts "Dimencion No valida"
				end
			else
				puts 'OPCION NO VALIDA, ADIOS'
		end
	end

end


juagar = TicTacToeGame.new





