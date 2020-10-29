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
      system('clear')
      break unless check_outcome(@player1) == -1

      @board.draw
      input(@player2)
      system('clear')
      break unless check_outcome(@player2) == -1
    end
  end

  def input(player)
    playing = false
    until playing
      puts "\n#{player.name}'s turn"
      puts "\nEnter position (eg. A2)"
      input_pos = gets.chomp
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

  # Prints out game result
  def check_outcome(player)
    case @board.status
    when 1
      puts "*** #{player.name} Won Congratulations! ***"
      1
    when 0
      puts "*** That's a tie ***"
      0
    else
      -1
    end
  end
end
