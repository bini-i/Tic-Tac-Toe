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
  board1 = Board.new
  loop do
    board1.draw
    user_input(player1, board1)
    break unless check_outcome(-1, player1).nil?

    board1.draw
    user_input(player2, board1)
    break unless check_outcome(-1, player2).nil?
  end
end

def user_input(player, board1)
  played = false
  until played
    puts "\n#{player.name}'s turn"
    puts "\nEnter position (eg. A2)"
    input_pos = gets.chomp
    system('clear')
    played = legal(player.type, input_pos, board1)
  end
end

def update(value, pos, board1)
  arr = pos.split('')
  arr[0] = arr[0].upcase
  case arr[0]
  when 'A' then arr[0] = 0
  when 'B' then arr[0] = 1
  when 'C' then arr[0] = 2
  end
  board1.board[arr[0]][arr[1].to_i - 1] = value
end

def cell_empty?(arr, board1, pos, value)
  if board1.board[arr[0]][arr[1].to_i - 1] == '_'
    puts board1.board[arr[0]][arr[1].to_i - 1]
    update(value, pos, board1)
    true
  else
    puts '*** Please choose an empty cell. ***'
    false
  end
end

def legal(value, pos, board1)
  arr = pos.split('')
  arr[0] = arr[0].upcase
  if (%w[A B C].include? arr[0]) && (%w[1 2 3].include? arr[1])
    case arr[0]
    when 'A' then arr[0] = 0
    when 'B' then arr[0] = 1
    when 'C' then arr[0] = 2
    end
    cell_empty?(arr, board1, pos, value)
  else
    puts '*** This move is illegal please try again. ***'
    false
  end
end

def status; end

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
