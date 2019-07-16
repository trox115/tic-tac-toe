require '../lib/game.rb'

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
  playagain = game.ask_playagain()
  next unless playagain == true
  sameplayers = game.ask_sameplayers()
end
