class Board
  def initialize
    @board = Array.new(3) { Array.new(3, '_') }
  end

  def update(value, pos)
      @board[pos[0]][pos[1]] = value
  end

  def legal_input?(pos)
    arr = pos.split('')
    x_axis = arr[1]
    y_axis = arr[0].upcase
    return true if (%w[A B C].include? y_axis) && (%w[1 2 3].include? x_axis)
    false
  end

  def cell_empty?(pos)
    return true if @board[pos[0]][pos[1]] == '_'
    false
  end

  def status(player)
    puts "logic"
  end

  def draw
    puts '    ___________'
    puts "C  |_#{@board[2][0]}_|_#{@board[2][1]}_|_#{@board[2][2]}_|"
    puts "B  |_#{@board[1][0]}_|_#{@board[1][1]}_|_#{@board[1][2]}_|"
    puts "A  |_#{@board[0][0]}_|_#{@board[0][1]}_|_#{@board[0][2]}_|"
    puts "     1   2   3\t\t"
  end
end
