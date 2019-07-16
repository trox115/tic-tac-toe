require '../lib/library.rb'
class Game
  attr_accessor :players, :board, :symbols, :turn_toplay
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
      puts "Turn to: #{@players[@turn_toplay]}, insert a digit"
      played = gets.chomp
      valid = @board.choose(played.to_i, @symbols[@turn_toplay])

      next unless valid

      @playermoves[@turn_toplay].push(played.to_i)
      if @board.checking(@playermoves[@turn_toplay]) == true
        puts ''
        puts ''
        puts "The winner is #{@players[@turn_toplay]}"
        puts ''
        puts ''
        break
      elsif @board.draw == true
        puts ''
        puts ''
        puts "It's a Draw"
        puts ''
        puts ''
        break
      end
      switch_turn
    end
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
end

game = Game.new

sameplayers = false
playagain = true

loop do
  break if playagain == false

  if sameplayers == true
    game.reset_board
    game.play
  else
    game.reset_board
    game.welcome
    game.play
  end

  ask_playagain = true
  while ask_playagain
    puts 'Do you want to play again? Y/N'
    playagain_ans = gets.chomp
    if playagain_ans.upcase == 'Y'
      ask_playagain = false
      playagain = true
      break
    elsif playagain_ans.upcase == 'N'
      playagain = false
      ask_playagain = false
      break
    else
      puts 'Invalid Response'
    end
  end
  next unless playagain == true

  ask_sameplayers = true
  while ask_sameplayers
    puts 'Play with the same Players Y/N'
    sameplayers_ans = gets.chomp
    if sameplayers_ans.upcase == 'Y'
      ask_sameplayers = false
      sameplayers = true
      break
    elsif sameplayers_ans.upcase == 'N'
      sameplayers = false
      ask_sameplayers = false
      break
    else
      puts 'Invalid Response'
    end
  end
end
