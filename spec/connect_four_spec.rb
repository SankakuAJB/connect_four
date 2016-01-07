require "./lib/connect_four.rb"
require "spec_helper"

describe ConnectFour do
	let(:game) { ConnectFour.new }

	describe "#create_board" do

		it "should have 42 keys/cells" do
			expect(game.board.length).to eq(42)
		end

		it "should return nil for all values" do
			expect(game.board.each_value).to all eq(" ")
		end

	end

	describe ".show_board" do

	end

	describe "#get_move" do

		it "should return an integer" do

		end

	end 

	describe "#move_valid" do

		it "returns true if the selected column is not full" do
			expect(game.move_valid(5)).to be true
		end

		it "returns false if the move if below 1 or above 7(off the board)" do
			expect(game.move_valid(0)).to be false
			expect(game.move_valid(8)).to be false
		end

		it "returns false if the column is full" do
			game.board["1, 1"] = "r"
			game.board["1, 2"] = "y"
			game.board["1, 3"] = "r"
			game.board["1, 4"] = "y"
			game.board["1, 5"] = "r"
			game.board["1, 6"] = "y"
			expect(game.move_valid(1)).to be false
		end

	end

	describe "#red_or_yellow" do

		it "returns 'R' if turn is even" do
			expect(game.red_or_yellow(38)).to eq("R")
		end

		it "returns 'Y' if turn is odd" do
			expect(game.red_or_yellow(21)).to eq("Y")
		end

	end

	describe "#game_over" do

	end

	describe ".start" do

	end

end


	