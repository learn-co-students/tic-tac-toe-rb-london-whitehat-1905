WIN_COMBINATIONS = [ 
    [0,1,2], 
    [3,4,5],  
    [6,7,8], 
    [0,3,6], 
    [1,4,7], 
    [2,5,8], 
    [0,4,8],  
    [6,4,2] 
    ]

    def display_board(board)
        puts " #{board[0]} | #{board[1]} | #{board[2]} "
        puts "-----------"
        puts " #{board[3]} | #{board[4]} | #{board[5]} "
        puts "-----------"
        puts " #{board[6]} | #{board[7]} | #{board[8]} "
      end
       
      board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]

      display_board(board)

      def input_to_index(user_input)
        user_input.to_i - 1
      end

      def turn_count(board)
        counter = 0
        board.each do |spaces|
           if spaces == "X" || spaces == "O"
              counter += 1
           end
        end
        counter
     end

     def current_player(board)
        turn_count(board) % 2 == 0 ? "X" : "O"
     end
      
     def move(board, index, current_player)
        board[index]= current_player
    end
    
    
    def position_taken?(board, index)
        if (board[index] == " ") || (board[index] == "") || (board[index] == nil)
           return false 
        else
           return true
        end
    end
    
      def valid_move?(board, index)
        if index.between?(0,8) && !position_taken?(board, index)
           return true
        end
    end
    
    def turn(board)
        puts "Please enter 1-9:"
        input = gets.strip
        index = input_to_index(input)
        if valid_move?(board, index)
          move(board, index, current_player(board))
          display_board(board)
        else
          turn(board)
        end
    end
    def won?(board)
        WIN_COMBINATIONS.detect do |win_combination|
          win_combination.all? { |win_index| board[win_index] == "X" } ||
          win_combination.all? { |win_index| board[win_index] == "O" }
        end
    end


    def full?(board)
        board.all? {|i| i == "X" || i == "O"}
    end
  
def draw?(board)
   if !won?(board) && full?(board)
     return true
    end
end
   
  
   def over?(board)
    if draw?(board) || won?(board) || full?(board)
      return true
    end
  end
  
  def winner(board)
    if won?(board)
       return board[won?(board)[0]]
    end
  end
  
  def play(board)
    until over?(board) 
       turn(board)
    end 
    if won?(board)
       winner(board) == "X" || winner(board) == "O" 
       puts "Congratulations #{winner(board)}!" 
    elsif draw?(board)
       puts "Cat's Game!" 
    end 
 end

  
  