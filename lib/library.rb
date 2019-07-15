class Board
    attr_accessor :board, :board_numbers
    def initialize
        @board_numbers = [[1,2,3], [4,5,6], [7,8,9]]
        @board = [[1,2,3], [4,5,6], [7,8,9]]
    end
    
    def print_board
        @board.each do |x|
            x.each do |y|
                print "| #{y} |"
            end
            puts ""
        end
    end

    def choose(number, symbol="X")
        for i in 0...@board_numbers.length
            for j in 0...@board_numbers[i].length
                if @board_numbers[i][j] == number
                    if @board[i][j].class == Integer
                        @board[i][j] = symbol
                        self.print_board
                    else
                        puts "Already Chosen"
                        self.print_board
                    end
                end
            end
        end
    end
end
