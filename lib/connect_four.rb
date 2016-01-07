class ConnectFour
	attr_accessor :board, :turn, :game_over

	def initialize
		@board = Hash.new
		@turn = 1
		@game_over = false
		create_board
	end

	def create_board
		1.upto(7) do |x|
			1.upto(6) do |y|
				board["#{x}, #{y}"] = " "
			end
		end
	end

	def show_board
		puts "  -----------------------------"
		6.downto(1) do |y|
			puts "#{y} | #{board["1, #{y}"]} | #{board["2, #{y}"]} | #{board["3, #{y}"]} | #{board["4, #{y}"]} | #{board["5, #{y}"]} | #{board["6, #{y}"]} | #{board["7, #{y}"]} |"
			puts "  -----------------------------"
		end
		puts "  | 1 | 2 | 3 | 4 | 5 | 6 | 7 |"
	end

	def get_move
		if @turn % 2 == 0
			puts "Player 1 (Red) please select a move (Pick a column between 1-7)"
			@move = gets.chomp.to_i
		else 
			puts "Player 2 (Yellow) please slect a move (Pick a column between 1-7)"
			@move = gets.chomp.to_i
		end
		return @move
	end

	def move_valid(move)
		if move <= 7 && move >= 1
			1.upto(6) do |y|
				if board["#{move}, #{y}"] == " "

					return true
				end
			end
		end
		return false
	end

	def red_or_yellow(turn)
		turn % 2 == 0 ? "R" : "Y"
	end

	def set_cell(x)
		1.upto(6) do |y|
			if board["#{x}, #{y}"] == " "
				board["#{x}, #{y}"] = red_or_yellow(@turn)
				@row = y
				return
			end
		end
	end

	def game_over(move, row)
		possible_moves = [ [1,0], [1,1], [0,1], [1, -1] ]

		possible_moves.each do |arr|
			x_shift = arr[0]
			y_shift = arr[1]
			x = move
			y = row
			correct = 1
			colour = red_or_yellow(@turn)

			1.upto(3) do |multi|
				if board["#{x + multi*x_shift}, #{y + multi*y_shift}"] == colour
					correct += 1
				end
				if board["#{x - multi*x_shift}, #{y - multi*y_shift}"] == colour
					correct += 1
				end
				if correct >= 4
					@game_over = true
					return
				end
			end
		end

		@turn += 1
	end

	def start
		show_board

		while @game_over == false
			if move_valid(get_move) == true
				set_cell(@move)
				show_board
				game_over(@move, @row)
			end
		end
	
		puts "Game over, #{red_or_yellow(@turn)} wins."
	end

end
