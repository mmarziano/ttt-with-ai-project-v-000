

class Board 
  attr_accessor :cells
  
  def initialize
    @cells = [" ", " ", " ", " ", " ", " ", " ", " "," "]
  end
  
  
  def reset! 
    @cells = [" ", " ", " ", " ", " ", " ", " ", " "," "]
  end 
  
  def display 
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts "-----------"
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts "-----------"
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end 
  
  def position(input)
    index = input.to_i - 1 
    @cells[index]
  end 
  
  def taken?(input)
    index = input.to_i - 1 
    @cells[index] == "X" || @cells [index] == "O"  
  end 
  
  def full? 
    @cells.all? do |char| 
      char == "X" || char == "O"
    end
  end 
    
  def turn_count 
    i = 0 
    @cells.each do |count|
      if count == "X" || count == "O"
      i += 1
      end 
    end 
    i
  end
    
  def valid_move?(input)
    !taken?(input) && input.to_i.between?(1,9)
  end 
   
   def update(input, player)
     if turn_count.even?
       char = "X"
      else
       char = "O"
      end 
    index = input.to_i - 1 
    @cells[index] = char
        
   end
   
end
  
  
  
