# Helper Methods
def all_same?(board, index_arr)
  index_arr.all? do |i|
    board[i] && board[i] == board[index_arr[0]] && board[i] != " "
  end
end

def current_player(board)
  n_turns = turn_count(board)
  n_turns % 2 == 0 ? "X" : "O"
end

def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def draw?(board)
  won?(board) ? false : full?(board)
end

def full?(board)
  board.all? { |e| ["X", "O"].include?(e) }
end

def input_to_index(user_input)
  user_input.to_i - 1
end

def move(board, index, current_player)
  board[index] = current_player
end

def over?(board)
  won?(board) || draw?(board)
end

def play(board)
  turn(board) until over?(board)
  if won?(board)
    puts "Congratulations #{winner(board)}!"
  elsif draw?(board)
    puts "Cat's Game!"
  end
end

def position_taken?(board, location)
  board[location] != " " && board[location] != ""
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

def turn_count(board)
  n_turns = 0
  board.each do |cell|
    n_turns += 1 if ['X', 'O'].include?(cell)
  end
  n_turns
end

def valid_move?(board, index)
  index.between?(0,8) && !position_taken?(board, index)
end

def winner(board)
  winning_indicies = won?(board)
  winning_indicies ? board[winning_indicies[0]] : nil
end

def won?(board)
  WIN_COMBINATIONS.each do |arr|
    if all_same?(board, arr)
      return arr
    end
  end
  nil
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0, 1, 2],
  [3, 4, 5],
  [6, 7, 8],
  [0, 4, 8],
  [2, 4, 6],
  [0, 3, 6],
  [1, 4, 7],
  [2, 5, 8]
]
