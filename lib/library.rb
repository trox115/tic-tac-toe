class Board
    attr_accessor :board, :board_numbers
    def initialize
        @board_numbers = [[1,2,3], [4,5,6], [7,8,9]]
        @board = [[1,2,3], [4,5,6], [7,8,9]]
        @winning = [[1,2,3],[4,5,6],[7,8,9],[1,5,9],[3,5,7]]
        @player1=Array.new
        @player2=Array.new
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
    def checking(ar)
        @winning.each do |x|
            if contains_all?(ar,x)
                puts "winner"
            else
                puts "no"
            end
        
    end

end

def contains_all?(a,b)
    b.uniq.all? { |x| a.count(x) >= b.count(x) }
end
end