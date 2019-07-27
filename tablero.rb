class Tablero
  attr_writer :dimencion
  attr_reader :posiciones_disponibles

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


  def dibujar
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
    @tablero[fila - 1][columna - 1] = marca
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

    if marcas_en_columna == @marca_x_ganadora
      puts ' ***** GANO EL JUGADOR 1 ***** '
      true
    elsif marcas_en_columna == @marca_o_ganadora
      puts ' ***** GANO EL JUGADOR 2 ***** '
      true
    end
  end


	# Metodo para revisar si se gano en una columa
  def marcas_iguales_en_diagonal
    marcas_en_diagonal_derecha = ''
    marcas_en_diagonal_izquierda = ''
    @tablero.each_with_index do |fila, index|
      num_columna_derecha_a_izquierda = index
      num_columna_izquierda_a_derecha = -(index + 1)
      marcas_en_diagonal_derecha << fila[num_columna_derecha_a_izquierda]
      marcas_en_diagonal_izquierda << fila[num_columna_izquierda_a_derecha]
    end

    if marcas_en_diagonal_derecha == @marca_x_ganadora || marcas_en_diagonal_izquierda == @marca_x_ganadora
      puts ' ***** GANO EL JUGADOR 1 ***** '
      true
    elsif marcas_en_diagonal_derecha == @marca_o_ganadora || marcas_en_diagonal_izquierda == @marca_o_ganadora
      puts ' ***** GANO EL JUGADOR 2 ***** '
      true
    end
  end

end