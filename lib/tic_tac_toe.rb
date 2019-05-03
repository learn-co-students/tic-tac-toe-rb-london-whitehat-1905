#copied from game_status

WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [2,4,6]
]

def won?(board)
  if empty?(board)
    false
  else
    for i in (0...8)
      x,y,z = WIN_COMBINATIONS[i]

      myBoard = [
        board[x],
        board[y],
        board[z]
      ]

      if myBoard.count("X") == 3
        return WIN_COMBINATIONS[i]
      end
      if myBoard.count("O") == 3
        return WIN_COMBINATIONS[i]
      end
    end
    return nil
  end

end


def full?(board)
  board.count("X") + board.count("O") == board.length
end

def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

def over?(board)
  draw?(board) || won?(board) 
end

def draw?(board)
  full?(board) && won?(board).nil?
end

def winner(board)
  if won?(board).is_a? Array
    board[won?(board)[0]] == "O" ? "O" : "X"
  else
    nil
  end
  # if won?(board)
  #   nil
  # elsif board[won?(board)[0]] == "O"
  #   "O"
  # else
  #   "X"
  # end
end

def empty?(board)
  !(board.include?("X") || board.include?("O"))
end


#

def current_player(board)
  if turn_count(board) % 2 == 0
      return "X"
  else
      return "O"
  end
end

def turn_count(board)
  return board.count("X") + board.count("O")
end


#



def input_to_index(user_input)
  user_input.to_i - 1
end

def move(board, index, current_player)
  board[index] = current_player
end

def position_taken?(board, location)
  board[location] != " " && board[location] != ""
end

def valid_move?(board, index)
  index.between?(0,8) && !position_taken?(board, index)
end

def turn(board)
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
  if !valid_move?(board, index)
    turn(board)
  else
    player = current_player(board)
    move(board, index, player)
    display_board(board)
  end
end

def play(board)
  until over?(board)
    turn(board)
  end
  if winner(board) == nil
    puts "Cat's Game!"
  else
    puts "Congratulations #{winner(board)}!"
  end
end

#

def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end
