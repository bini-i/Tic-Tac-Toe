#!/usr/bin/env ruby
# require 'byebug'

require_relative '../lib/player.rb'
require_relative '../lib/board.rb'
system('clear')
puts ' _____ _        _____            _____           '
puts '|_   _(_)      |_   _|          |_   _|          '
puts '  | |  _  ___    | | __ _  ___    | | ___   ___  '
puts '  | | | |/ __|   | |/ _` |/ __|   | |/ _ \\ / _ \\ '
puts '  | | | | (__    | | (_| | (__    | | (_) |  __/ '
puts '  \\_/ |_|\\___|   \\_/\\__,_|\\___|   \\_/\\___/ \\___| '

puts "\n\nPress Enter to start playing"
gets

def play(player1, player2)
  b = Board.new
  loop do
    b.draw
    b.input(player1)
    b.draw
    b.input(player2)
  end
end

begin
  system('clear')
  puts 'Press s to start playing'
  puts 'Press q to quit'
  input = gets.chomp
  raise unless input.include?('s') || input.include?('q')

  if input == 's'
    system('clear')
    puts 'Enter player 1 name'
    input_name1 = gets.chomp
    player1 = Player.new(input_name1)
    player1.type = 'X'
    puts 'Enter player 2 name'
    input_name2 = gets.chomp
    player2 = Player.new(input_name2)
    player2.type = 'O'
    play(player1, player2)
  end
rescue StandardError
  retry
end
