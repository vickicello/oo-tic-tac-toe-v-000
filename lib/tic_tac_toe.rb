class TicTacToe

  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end

  WIN_COMBINATIONS = [
    [0,1,2]
    [3,4,5]
    [6,7,8]
    [0,3,6]
    [1,4,7]
    [2,5,8]
    [0,4,8]
    [6,4,2]
  ]

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(input)
    index = input.to_i - 1
  end

  def move(index, player)
  @board[index] = player
  end

  def position_taken?(index)
    !(@board[index].nil? || @board[index] == " ")
  end

  def valid_move?(index)
    if position_taken?(index)
     false
    elsif !(index.between?(0, 8))
     false
    else
     true
 end
end

  def turn(@board)
     puts "Please enter 1-9:"
     input = gets.strip
     index = input_to_index(input)
     if valid_move?(board, index)
       move(index, current_player(@board))
       display_board
   else
     turn
   end
end

  def current_player
  turn_count % 2 == 0 ? "X" : "O"
  end

  def turn_count
  @board.count{|token| token == "X" || token == "O"}
  end

  def won?
    winning_combos.first
  end

  def full?
    !board.any? do |board_position|
    board_position == " "
  end
end

  def draw?
    full? && !won?
  end

  def over?
    won? || draw? || full?
  end

  def winner
    winning_combination = won?
    if winning_combination == nil
       nil
     elsif [winning_combination[0]] == "X"
      "X"
   else
     "O"
   end
end

  def play
    until over?
    turn
  end
  letter = winner
    if letter != nil
    puts "Congratulations #{letter}!"
  else
    puts "Cat's Game!"
  end
end

