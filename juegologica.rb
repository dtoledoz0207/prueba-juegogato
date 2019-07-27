require './tablero'

class JuegoLogica

  #attr_writer :dimencion
  def initialize(dimencion)
    iniciar_juego(dimencion)
  end



  def volver_a_jugar(respuesta)
    respuesta == 's' ? true : false
  end
  
  def reiniciar_juego(jugador1, dimencion)
    system('clear')
    puts " *** Inicia el #{jugador1 ? 'JUGADOR 1' : 'JUGADOR 2'} *** "
    Tablero.new(dimencion)
  end
  
  def iniciar_juego(dimencion)
    jugador_1 = true
    jugardor_2 = false
  
    50.times { print '*' }
    puts ' '
    tablero = Tablero.new(dimencion)
    tablero.dibujar
    loop do
      if tablero.posiciones_disponibles != 0
        puts "#{jugador_1 ? "JUGADOR 1" : "JUGADOR 2"}"
        print 'Escribe el numero de la fila: '
        numero_de_fila = gets.chomp.to_i
        if numero_de_fila >= 1 && numero_de_fila <= dimencion
          print 'Escribe el numero de la columna: '
          numero_de_columna = gets.chomp.to_i
          if numero_de_columna >= 1 && numero_de_columna <= dimencion
            #puts "Vamos a colocar en la fila: #{numero_de_fila} y columna: #{numero_de_columna}"
            if tablero.casilla_ocupada(numero_de_fila, numero_de_columna)
              puts ' *** LA CASILLA YA ESTA MARCADA *** '
            else
              marca = jugador_1 ? 'X' : 'O'
              tablero.agregar_marca(marca, numero_de_fila, numero_de_columna)
                tablero.dibujar
  
                if tablero.marcas_iguales_en_fila(numero_de_fila)
                  print " \n ¿Volver a jugar? s/n: "
                  respuesta = gets.chomp.downcase
                  if volver_a_jugar(respuesta)
                    tablero = reiniciar_juego(!jugador_1, dimencion)
                    tablero.dibujar
                  else
                    break
                  end
                end
  
  
                if tablero.marcas_iguales_en_columna(numero_de_columna)
                  print " \n ¿Volver a jugar? s/n: "
                  respuesta = gets.chomp.downcase
                  if volver_a_jugar(respuesta)
                    tablero = reiniciar_juego(!jugador_1, dimencion)
                    tablero.dibujar
                  else
                    break
                  end
                end
  
  
                if tablero.marcas_iguales_en_diagonal
                  print " \n ¿Volver a jugar? s/n: "
                  respuesta = gets.chomp.downcase
                  if volver_a_jugar(respuesta)
                    tablero = reiniciar_juego(!jugador_1, dimencion)
                    tablero.dibujar
                  else
                    break
                  end
                end
  
              jugador_1 = !jugador_1
              jugardor_2 = !jugardor_2
            end
          else
            puts '¡ERROR numero de COLUMNA No valido!'
          end
        else
          puts '¡ERROR numero de FILA No valido!'
        end
      
      else
        puts " \n ***===== EMPATE =====*** "
        print " \n ¿Volver a jugar? s/n: "
        respuesta = gets.chomp.downcase
        if volver_a_jugar(respuesta)
          tablero = reiniciar_juego(jugador_1, dimencion)
          tablero.dibujar
        else
          break
        end
      end
  
    end
  end
end