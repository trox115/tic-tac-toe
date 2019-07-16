
class Board
  attr_accessor :board
  attr_reader :board_numbers
  attr_reader :winning
  def initialize
    @board_numbers = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]
    @board = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]
    @winning = [[1, 2, 3], [4, 5, 6], [7, 8, 9], [1, 5, 9], [3, 5, 7], [3, 6, 9], [1, 4, 7], [2, 5, 8]]
  end

  def print_board
    @board.each do |x|
      x.each do |y|
        print "| #{y} |"
      end
      puts ''
    end
  end

  def choose(number, symbol = 'X')
    (0...@board_numbers.length).each do |i|
      (0...@board_numbers[i].length).each do |j|
        if @board_numbers[i][j] == number
          if @board[i][j].class == Integer
            @board[i][j] = symbol
            print_board
            return true
          else
            puts 'Already Chosen'
            print_board
            return false
          end
        end
      end
    end
  end

  def checking(arr)
    @winning.each do |x|
      return true if contains_all?(arr, x)
      
      
    end
    false
  end

  def draw
    if no_int(@board)==false
        return true
    else
        return false
    end
  end

  def no_int(arra)
    flag= false
    i=0
    while arra.length > i
        j=0
        while arra.length > j
            flag=true if arra[i][j].is_a?(Integer)
            j+=1
        end
        i+=1
    end 
    return flag
  end

  def contains_all?(aaa, bbb)
    bbb.uniq.all? { |x| aaa.count(x) >= bbb.count(x) }
  end
end  
