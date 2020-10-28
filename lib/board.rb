class Board
  def initialize
    @board = Array.new(3) { Array.new(3, '_') }
  end

  def input(player)
    puts "#{player.name}'s turn"
    puts 'Enter position (eg. A2)'
    input_pos = gets.chomp
    update(player.type, input_pos)
    outcome(player)
    system('clear')
  end

  def update(value, pos)
    arr = pos.split('')
    arr[0] = arr[0].upcase
    case arr[0]
    when 'A' then arr[0] = 0
    when 'B' then arr[0] = 1
    when 'C' then arr[0] = 2
    end
    @board[arr[0]][arr[1].to_i - 1] = value
  end

  def legal; end

  def outcome; end

  def draw
    puts '    ___________'
    puts "C  |_#{@board[2][0]}_|_#{@board[2][1]}_|_#{@board[2][2]}_|"
    puts "B  |_#{@board[1][0]}_|_#{@board[1][1]}_|_#{@board[1][2]}_|"
    puts "A  |_#{@board[0][0]}_|_#{@board[0][1]}_|_#{@board[0][2]}_|"
    puts "     1   2   3\t\t"
  end
end
