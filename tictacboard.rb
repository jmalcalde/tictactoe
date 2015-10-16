class TicTacBoard

	attr_accessor :statusBoard, :cells, :player1, :player2, :activePlayer, :jugadas

	# Constructor del objeto
	def initialize (statusBoard, cells, player1, player2, activePlayer, jugadas)
		@statusBoard = statusBoard
		@cells = cells
		@player1 = player1
		@player2 = player2
		@activePlayer = activePlayer
		@jugadas = jugadas
	end

	## muestra el contenido del tablero
 	def showBoard ()

 		puts "    1    2    3"
 		puts "A   #{@cells['a1']}   #{@cells['a2']}    #{@cells['a3']}"
 		puts "B   #{@cells['b1']}   #{@cells['b2']}    #{@cells['b3']}"
 		puts "C   #{@cells['c1']}   #{@cells['c2']}    #{@cells['c3']}"
 		puts ""

 	end

	## Verifica si puede escribir la opción introducida
 	def checkCell(cell)

 		if @cells[cell] == ""
 			@jugadas += 1
 			return true
 		else 
 			return false
 		end

 	end

 	## Verifica si la partida ha terminado
 	def checkBoard ()

 		if @jugadas == 9 
 			@statusBoard = true
 		end

 	end

 	## Verifica si la última jugada es ganadora
 	def checkWinner ()

 		if @jugadas < 5
 			return false
 		else 
 			if (@cells['a1'] == @cells['a2'] && @cells['a1'] == @cells['a3']) ||
 			   (@cells['b1'] == @cells['b2'] && @cells['b1'] == @cells['b3']) ||
 			   (@cells['c1'] == @cells['c2'] && @cells['c1'] == @cells['c3']) ||
 			   (@cells['a1'] == @cells['b2'] && @cells['a1'] == @cells['c3']) ||
 			   (@cells['a1'] == @cells['b1'] && @cells['a1'] == @cells['c1']) ||
 			   (@cells['a2'] == @cells['b2'] && @cells['a2'] == @cells['c2']) ||
 			   (@cells['a3'] == @cells['b3'] && @cells['a3'] == @cells['c3']) 
 			   return true
 			end
 		end

 	end

 	## Muestra el orden de los jugadores
 	def showPlayers ()

 		puts "#{@player1} juega con la tecla X"
 		puts "#{@player2} juega con la tecla O"
 		puts ""

 	end

end