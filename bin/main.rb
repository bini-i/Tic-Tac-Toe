#!/usr/bin/env ruby
require 'byebug'
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

class Game
  def initialize(player1_name, player2_name)
      @player1 = Player.new(player1_name)
      @player1.type = 'X'
      @player2 = Player.new(player2_name)
      @player2.type = 'O'
      @board = Board.new
  end

  def play
    loop do
      @board.draw
      input(@player1)
      break unless check_outcome(@player1).nil?
      
      @board.draw
      input(@player2)
      break unless check_outcome(@player2).nil?
    end
  end

  def input(player)
    playing = false
    until playing
      puts "\n#{player.name}'s turn"
      puts "\nEnter position (eg. A2)"
      input_pos = gets.chomp
      # debugger
      legal = @board.legal_input?(input_pos)
      if legal
        pos = clean_position(input_pos)
        unless @board.cell_empty?(pos)
          puts '*** This cell is not empty. Please try again. ***'
          next
        end
        @board.update(player.type, pos)
        playing = true
      else
        puts '*** This move is illegal. Please try again. ***'
      end
    end
  end

  def clean_position(input_pos)
    arr = input_pos.split('')
    x_axis = arr[1].to_i - 1
    y_axis = arr[0].upcase
    # convert string input to array indices
    case y_axis
    when 'A' then y_axis = 0
    when 'B' then y_axis = 1
    when 'C' then y_axis = 2
    end

    [y_axis, x_axis]
  end

  def check_outcome(player)
    case @board.status(player)
    when 1
      puts "#{player.name} Won"
      1
    when 0
      puts "That's a tie"
      0
    else
      nil
    end
  end

end

# begin
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

      game = Game.new(player1_name, player2_name)
      game.play

      puts 'Enter r to play again or q to quit'
      input_opt = gets.chomp
      break if input_opt == 'q'
      next if input_opt == 'r'
    end
  end
# rescue StandardError
#   retry
# end
