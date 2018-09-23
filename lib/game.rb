
class Game 
  attr_accessor :board, :player_1, :player_2
  
  WIN_COMBINATIONS = [[0,1,2], [3,4,5], [6,7,8], [0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]
  
  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end 
  
  def board 
    @board 
  end 
  
  def current_player
    x_array = board.cells.keep_if {|token| token == "X"}
    o_array = board.cells.keep_if {|token| token == "O"}
    if x_array.size > o_array.size 
      @player_2
    else 
      @player_1
    end 
  end 
      
  def won?
    WIN_COMBINATIONS.detect do |combo|
        board.cells[combo[0]] == board.cells[combo[1]] && board.cells[combo[1]] == board.cells[combo[2]]
    end
  end 

  def draw?
    board.full? && !won?
  end 
  
  def over?
    won? || draw?
  end 
  
  def winner
    win_array.to_a = WIN_COMBINATIONS.keep_if do |combo|
        board.cells[combo[0]] == board.cells[combo[1]] && board.cells[combo[1]] == board.cells[combo[2]]
    end 
    board.cells[win_array]
  end 
  
  
  
end 