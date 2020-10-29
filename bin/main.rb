#!/usr/bin/env ruby
require_relative '../lib/game'
require_relative '../lib/player'
require_relative '../lib/board'
system('clear')
puts ' _____ _        _____            _____           '
puts '|_   _(_)      |_   _|          |_   _|          '
puts '  | |  _  ___    | | __ _  ___    | | ___   ___  '
puts '  | | | |/ __|   | |/ _` |/ __|   | |/ _ \\ / _ \\ '
puts '  | | | | (__    | | (_| | (__    | | (_) |  __/ '
puts '  \\_/ |_|\\___|   \\_/\\__,_|\\___|   \\_/\\___/ \\___| '

puts "\n\nPress Enter to start playing"
gets

begin
  system('clear')
  puts 'Press s to start playing'
  puts 'Press q to quit'
  input_opt = gets.chomp
  raise unless input_opt.include?('s') || input_opt.include?('q')

  if input_opt == 's'
    loop do
      system('clear')
      # player 1 initialize
      puts 'Enter player 1 name'
      player1_name = gets.chomp

      # player 2 initialize
      puts 'Enter player 2 name'
      player2_name = gets.chomp
      system('clear')
      game = Game.new(player1_name, player2_name)
      game.play

      puts "\nEnter r to play again or q to quit"
      input_opt = gets.chomp
      break if input_opt == 'q'
      next if input_opt == 'r'
    end
  end
rescue StandardError
  retry
end
