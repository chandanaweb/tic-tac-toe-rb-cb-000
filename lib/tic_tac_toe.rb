# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[6,4,2]]

def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts"-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts"-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def input_to_index(num)
  return num.to_i - 1
end

def move(board,index,token)
 return board[index] = token
end

def valid_move?(board,index)
 if index < 9 && index > -1 && board[index] != 'X' && board[index] != 'O'
  return true
 else
  return false
 end
end

def turn(board)
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
  is_valid = valid_move?(board,index)
  if is_valid === true
    current_turn = current_player(board)
    move(board,index,current_turn)
    display_board(board)
  else
    puts 'Please enter correct input'
    turn(board)
    end
end

def turn_count(board)
  count  = 0
  board.each do |player|
    if player == 'X' || player == 'O'
     count += 1
   end
  end
  return count
end

def current_player(board)
turn = turn_count(board)
if turn%2 == 0
  return "X"
else
  return 'O'
end
end

def won?(board)
  if board.all?{|position|position == " "}
    return false
  end
  no_combinations = true
  WIN_COMBINATIONS.each do |combination|
  if combination1 = board[combination[0]] == "X" && board[combination[1]] == "X" && board[combination[2]] == "X" ||
     combination2 = board[combination[0]] == "O" && board[combination[1]] == "O" && board[combination[2]] == "O"
     no_combinations = false
    return combination
  end
 end
 if no_combinations == true
   return false
 end
end

#FULL method
def full?(board)
  any_spaces =  board.any?{|element| element == " "}
  if any_spaces== true
    return false
  else
    return true
  end
end

def draw?(board)
  incomplete_board = !full?(board)
  if incomplete_board == true
    return false
  end
  is_game_won = won?(board)
  if is_game_won.is_a?(Array)
    return false
  else
    return true
  end
end

def over?(board)
  WIN_COMBINATIONS.each do |combination|
    if combination1 = board[combination[0]] == "X" && board[combination[1]] == "X" && board[combination[2]] == "X" ||
       combination2 = board[combination[0]] == "O" && board[combination[1]] == "O" && board[combination[2]] == "O"
      return true
    end
  end
  draw = full?(board)
     if draw == true
      return true
     else
      return false
     end
   end
def winner(board)
       no_combinations = true
     WIN_COMBINATIONS.each do |combination|
       if combination1 = board[combination[0]] == "X" && board[combination[1]] == "X" && board[combination[2]] == "X"
           no_combinations = false
         return "X"
          elsif combination2 = board[combination[0]] == "O" && board[combination[1]] == "O" && board[combination[2]] == "O"
            no_combinations = false
         return "O"
       end
     end
     if no_combinations == true
       return nil
     end
     end
def play(board)
  turn(board)
  is_game_over = over?(board)
  is_game_won = won?(board)
  is_game_draw = draw?(board)
  if is_game_over == true
    if is_game_won == true
      winner = winner(board)
      puts"congratulates the winner #{winner}"
    elsif is_game_draw == true 
      puts"Cat\'s Game!" 
    else 
      return ''
end
