def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def valid_move?(board,index)
  index.between?(0,8) && !position_taken?(board,index)

end


def position_taken?(board,index)
  if board[index] == "   "
    return false
  elsif board[index] == "  "
    return false
  elsif board[index] == " "
      return false
  elsif board[index] == ""
        return false
  elsif board[index] == nil
          return false
  else
    return true
  end
end

def input_to_index(userinput)
   userinput.to_i - 1
end

def move(board, userinput, playerCharacter)
  board[userinput] = playerCharacter
  display_board(board)
end

def turn(board)
  puts "Please enter 1-9:"
  userInput = gets.strip
  index = input_to_index(userInput)
  if valid_move?(board,index)
    move(board, index, current_player(board))

  else
    turn(board)
  end
end

def turn_count(board)

  i = 0
  
  board.each do |char|

    if char == "X" || char == "O"
      i += 1

    end

  end

  return i
end


def current_player(board)
  if turn_count(board) % 2 == 0
    return "X"
  else
    return "O"
  end
end

WIN_COMBINATIONS = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6]]

def won?(board)
  wins = WIN_COMBINATIONS.filter do |wincombo|

    win_index_1 = wincombo[0]
    win_index_2 = wincombo[1]
    win_index_3 = wincombo[2]

    position_1 = board[win_index_1]
    position_2 = board[win_index_2]
    position_3 = board[win_index_3]

    if position_1 == "X" && position_2 == "X" && position_3 == "X"
       true
    elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
       true
    else
       false
    end
  end


  if wins.count > 0
    return wins[0]
  else
    false
  end
end


def full?(board)

  !board.any?{|space| space == " "}

end


def draw?(board)
  !won?(board) && full?(board)

end


def over?(board)

  won?(board) || draw?(board)

end


def winner(board)
  if won?(board)
    winChar = board[won?(board).first]

  else
    return nil
  end

end

def play(board)
  while !over?(board) do
    turn(board)
  end
  if won?(board)
    puts "Congratulations #{winner(board)}!"
  else draw?(board)
    puts "Cat's Game!"

  end
end
