class Game
    def initialize
        welcome
      end


    def welcome
        puts "------------------------------------------------------------"
        puts "Welcome at this tic-tac-toe game, built by António Fernandes And Carlos del Real"
        puts "------------------------------------------------------------/n"
        puts "what is the name of player 1 ?"
        $player1=gets.chomp
        puts "what is the name of player 2 ?"
        $player2=gets.chomp
        puts "Hello #{$player1} you go X and #{$player2} plays with O"
    end
end

Game.new