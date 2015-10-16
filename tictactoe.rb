require './tictacboard.rb'


def startGame()

	# Declaracion de variables
	primerJugador = ""
	segundoJugador = ""
	celda = ""



	# Mostrar instrucciones

	puts "Bienvenido a Tic Tac Toe."
	puts "Estás preparado para pasar un buen rato."
	puts "Para iniciar el juego, los jugadores deben registrarse."
	puts "¡Que gane el mejor."
	puts "Recuerde que el primer jugador utiliza X y el segundo O."

	# Carga de jugadores

	while (primerJugador.length == 0 )
		puts "Introduzca el nombre del jugador 1"
		primerJugador = gets.chomp
	end
	
	while (segundoJugador.length == 0)
		puts "Introduzca el nombre del jugador 2"
		segundoJugador = gets.chomp
	end

	# Creo el tablero
	game = TicTacBoard.new(false, {'a1' => '', 'a2' => '','a3' => '',
						   'b1' => '', 'b2' => '','b3' => '',
						   'c1' => '', 'c2' => '','c3' => ''}, 
						   primerJugador, segundoJugador, primerJugador, 0)

	# Muestro el orden de jugadores
	game.showPlayers()

	# Muestro  el tablero

	game.showBoard()

	# Inicio la partida

	while game.statusBoard == false

		puts "#{game.activePlayer} puedes introducir tu jugadas"
		puts "Recuerda que debes indicar la celda que quieres rellenar"
		celda = gets.chomp

		if game.cells.has_key?(celda) # Compruebo si la celda existe

			if game.checkCell(celda) # Compruebo si la celda esta vacía
				if (game.activePlayer == game.player1)
				  game.cells[celda.downcase] = "X" 
				  
				  game.activePlayer = game.player2 
				else
				  game.cells[celda.downcase] = "O"
				  game.activePlayer = game.player1
				end
				if game.checkWinner() # Compruebo si ha ganado el jugador
					game.statusBoard = true
					puts "Enhorabuena has ganado"
				end
			else 
				puts "Esta celda ya tiene valor"
				puts "Vuelva a intentarlo"
			end
		else
			puts "La celda no existe en el tablero"
			puts "Inténtelo otra vez"
		end
		
		if game.checkBoard()
			puts "Juego Terminado"
		end
		game.showBoard()
	end

end


startGame()