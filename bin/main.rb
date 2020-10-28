#!/usr/bin/env ruby
require 'byebug'

system('clear')
puts " _____ _        _____            _____           "
puts "|_   _(_)      |_   _|          |_   _|          "
puts "  | |  _  ___    | | __ _  ___    | | ___   ___  "
puts "  | | | |/ __|   | |/ _` |/ __|   | |/ _ \\ / _ \\ "
puts "  | | | | (__    | | (_| | (__    | | (_) |  __/ "
puts "  \\_/ |_|\\___|   \\_/\\__,_|\\___|   \\_/\\___/ \\___| "

puts "\n\nPress Enter to start playing"
gets

class Board 
    def initialize
        @board = Array.new(3) {Array.new(3, '_')} 
    end

    def input 
        system('clear')
        puts "Player1 turn"
        puts "Enter 'X' or 'O'"
        input_value = gets.chomp
        puts "Enter position (eg. A2)"
        input_pos = gets.chomp
        
        # if input ==  "x" || input == "o"
        #     puts "your move is displayed on board" 
        #     gets
        # end
        debugger
        update(input_value, input_pos)

    end

    def update(value, pos)
        arr = pos.upcase!.split('')
        case arr[0]
            when 'A' then arr[0] = 0
            when 'B' then arr[0] = 1
            when 'C' then arr[0] = 2
        end
        @board[arr[0]][arr[1].to_i - 1] = value
    end

    def legal()

    end

    def draw
        # @board.each do |row|
        #     row.each do |pos|
        #         puts pos
        #     end
        # end
        puts "    ___________"
        puts "C  |_#{@board[2][0]}_|_#{@board[2][1]}_|_#{@board[2][2]}_|"
        puts "B  |_#{@board[1][0]}_|_#{@board[1][1]}_|_#{@board[1][2]}_|"
        puts "A  |_#{@board[0][0]}_|_#{@board[0][1]}_|_#{@board[0][2]}_|"
        puts ""
        puts "     1   2   3		"
    end
end

class Player
    def initialize(name)
        @name = name
        @score
        @type
    end
end

def play
    b = Board.new
    while(true)
        b.draw
        b.input
        b.draw
        gets
    end
end

begin
    system('clear')
    puts "Press s to start playing"
    puts "Press q to quit"
    input = gets.chomp
    raise unless input == "s" || input == "q"
    if input == "s"
        system('clear')
        puts "Enter player 1 name"
        input_name1 = gets.chomp
        p1 = Player.new(input_name1)
        puts "Enter player 2 name"
        input_name2 = gets.chomp
        p2 = Player.new(input_name2)

        play()
    end
rescue 
    retry
end