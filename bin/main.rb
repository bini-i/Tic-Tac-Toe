#!/usr/bin/env ruby

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

def check_outcome(status, player)
  case status
  when 1
    puts "#{player.name} win"
    1
  when 0
    puts "That's a tie"
    0
  end
end

def play(player1, player2)
  b = Board.new
  loop do
    b.draw
    b.input(player1)
    break unless check_outcome(1, player1).nil?

    b.draw
    b.input(player2)
    check_outcome(b.status, player2)
    break unless check_outcome(0, player1).nil?
  end
end

begin
  system('clear')
  puts 'Press s to start playing'
  puts 'Press q to quit'
  input = gets.chomp
  raise unless input.include?('s') || input.include?('q')

  if input == 's'
    loop do
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
      puts 'Enter r to play again or q to quit'
      input = gets.chomp
      break if input == 'q'
      next if input == 'r'
    end
  end
rescue StandardError
  retry
end
