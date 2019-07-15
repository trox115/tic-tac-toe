require '../lib/library.rb'
class Game
    attr_accessor :players, :board, :symbols, :turn_toplay
    def initialize
        @board = Board.new
        @players = []
        
        @playermoves = [[],[]]
        @turn_toplay = 0 #it changes from 0 to 1 depending on the turn
        @symbols = ["X", "O"]
        
    end

    def welcome
        puts "------------------------------------------------------------"
        puts "Welcome at this tic-tac-toe game, built by António Fernandes And Carlos del Real"
        puts "------------------------------------------------------------/n"
        puts "what is the name of player 1 ?"
        player1 = gets.chomp
        puts "what is the name of player 2 ?"
        player2 = gets.chomp
        puts "Sorting the first turn ..."
        @players = [player1, player2]
        if @players.sample == player2
            @players.reverse!
        end
        puts "Hello #{@players[0]} you go X and #{@players[1]} plays with O"
    end
    def play
        @board.print_board
        
        while true
            puts "Turn to: #{@players[@turn_toplay]}, insert a digit"
            played = gets.chomp
            valid = @board.choose(played.to_i, @symbols[@turn_toplay])
            
            if valid
                @playermoves[@turn_toplay].push(played.to_i)
                if @board.checking(@playermoves[@turn_toplay])==true
                    puts ""
                    puts ""
                    puts "The winner is #{@players[@turn_toplay]}"
                    puts ""
                    puts ""
                    break
                   
                end             
                switch_turn
            end
        end
    end
    def switch_turn
        if @turn_toplay == 0
            @turn_toplay = 1
        else
            @turn_toplay = 0
        end
    end
    def turn(player)
        turn_valid = false
        while !turn_valid
            begin
                puts "#{@players[@turn_toplay]} it's your turn, insert a digit"
                number = gets.chomp
                if number.integer?
                    turn_valid = true
                  
                end
            rescue
                turn_valid = false
                puts "Insert a valid Integer"
            end
        end
        @board.choice(number)
    end
end


while true
    game = Game.new
game.welcome
game.play
end