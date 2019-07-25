tablero = []

dimencion = 3

dimencion.times do
  tablero << Array.new(dimencion, "_")
end

print tablero
puts ""

=begin
tablero.each do |fil|
  fil.each do 
    dimencion.times do
      fil << "+"
    end
  end
end
=end

tablero[0][0] = 0

30.times{print '-'}
puts ""


tablero.each do |fila|
  print fila
  puts ""
end
  

# OTRA FORMA DE CREAR UN ARRAY 3x3
=begin
30.times{print '-'}
puts ""

array = Array.new(dimencion) {Array.new(dimencion, ".")}

print array
puts ""
=end




# Estro esta para verificar si el usuario quiere volver a jugar
=begin
							case respuesta
								when 's'
									system('clear')
									# Aqui se tiene que volver a crear el tablero vacio
									puts " *** Inicia el #{!jugador_1 ? "JUGADOR 1" : "JUGADOR 2"}"
									tablero = Tablero.new(3)
								when 'n'
									break
								else
									puts "Opcion no valida"
									break
							end
=end


30.times{print "-"}
puts " "

frace = ""
["h", "o", "l", "a"].each do |letra|
  frace << letra
end

puts frace.class


30.times{print '-'}
puts " "

frace2 = ''
arreglo = [["h", "o", "l", "a"], ["h", "o", "l", "a"], ["h", "o", "l", "a"]]

arreglo.each do |fila|
  frace2 << fila[0]
end
puts frace2

30.times{print '-'}
puts " "


# Para saber los carateres en diagonal
frace3 = ''
frase4 = ''
arreglo3 = [["H", "o", "l", "a1"], ["h", "o", "l2", "a"], ["h", "o3", "l", "a"], ["h4", "o", "l", "O"]]
arreglo3.each_with_index do |fila, index|
  num_columna_derecha = index
  num_columna_izquierda = -(index + 1)
  puts num_columna_izquierda
  #frace3 << fila[num_columna_derecha]
  frase4 << fila[num_columna_izquierda]
end
puts frace3
puts frase4


30.times{print '-'}
puts " "

