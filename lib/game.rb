require '../lib/board.rb'
class Game
    attr_accessor :players, :board, :turn_toplay
    attr_reader :symbols
    def initialize
      @board = Board.new
      @players = []
  
      @playermoves = [[], []]
      @turn_toplay = 0 # it changes from 0 to 1 depending on the turn
      @symbols = %w[X O]
    end
  
    def welcome
      puts '-----------------------------------------------------------------------------------'
      puts 'Welcome to this tic-tac-toe game, built by António Fernandes And Carlos del Real'
      puts '-----------------------------------------------------------------------------------'
      puts 'what is the name of player 1 ?'
      player1 = gets.chomp
      puts 'what is the name of player 2 ?'
      player2 = gets.chomp
      puts 'Sorting the first turn ...'
      @players = [player1, player2]
      @players.reverse! if @players.sample == player2
      puts "Hello #{@players[0]} you go X and #{@players[1]} plays with O"
    end
  
    def play
      @board.print_board
  
      loop do
        valid = next_move
        next unless valid
        
        if @board.checking(@playermoves[@turn_toplay]) == true
          banner_msg("The winner is #{@players[@turn_toplay]}")
          break
        elsif @board.draw == true
          banner_msg("It's a Draw")
          break
        end
        switch_turn
      end
    end
    
    def next_move
        puts "Turn to: #{@players[@turn_toplay]}, insert a digit"
        played = gets.chomp
        if played.to_i != 0 && played.to_i < 10
            valid = @board.choose(played.to_i, @symbols[@turn_toplay])
        else
            puts banner_msg("Invalid entry!")
            return false
        end

        if valid
            @playermoves[@turn_toplay].push(played.to_i)
            return true
        else 
            return false
        end
    end

    def banner_msg(message)
        puts ''
        puts ''
        puts message
        puts ''
        puts ''
    end
  
    def switch_turn
      @turn_toplay = if @turn_toplay.zero?
                       1
                     else
                       0
                     end
    end
  
    def turn(_player)
      turn_valid = false
      until turn_valid
        begin
          puts "#{@players[@turn_toplay]} it's your turn, insert a digit"
          number = gets.chomp
          turn_valid = true if number.integer?
        rescue StandardError
          turn_valid = false
          puts 'Insert a valid Integer'
        end
      end
      @board.choice(number)
    end
  
    def reset_board
      @board.board = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]
      @playermoves = [[], []]
    end
    def ask_playagain
      loop do
          puts 'Do you want to play again? Y/N'
          playagain_ans = gets.chomp
          if playagain_ans.upcase == 'Y'
            return true
          elsif playagain_ans.upcase == 'N'
            return false
          else
            puts 'Invalid Response'
          end
      end
    end
    def ask_sameplayers
      loop do
          puts 'Play with the same Players Y/N'
          sameplayers_ans = gets.chomp
          if sameplayers_ans.upcase == 'Y'
              return true
          elsif sameplayers_ans.upcase == 'N'
              return false
          else
              puts 'Invalid Response'
          end
        end
    end
  
  end