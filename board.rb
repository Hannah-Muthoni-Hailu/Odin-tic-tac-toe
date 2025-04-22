class Board
  def initialize()
    # Fill the board with numbers
    @board = [1, 2, 3, 4, 5, 6, 7, 8, 9]
    @play_count = 0
  end

  def display()
    puts " ___ ___ ___"
    counter = 0
    3.times do
      puts "| #{@board[counter]} | #{@board[counter + 1]} | #{@board[counter+2]} |"
      puts "|___|___|___|"
      counter += 3
    end
    puts ""
  end

  def update_board(player, number)
    if @board[number - 1] == "X" || @board[number - 1] == "O"
      return "Filled"
    else
      @board[number - 1] = player # Update
      @play_count += 1 # Increment play count
      # Check if player has won
      if @play_count >= 5 && win(number, player)
        return "Won"
      end
      # Check if the board is full and the game is a draw
      if @play_count == 9
        return "Draw"
      end
      return "Again"
    end
  end

  def win(number, player)
    # Check row
    return check_col(number, player) || check_diag(number, player) || check_row(number, player) ? true : false
  end

  def check_col(number, player)
    if number % 3 == 1
      return @board[0] == player && @board[3] == player && @board[6] == player ? true : false
    elsif number % 3 == 2
      return @board[1] == player && @board[4] == player && @board[7] == player ? true : false
    else
      return @board[2] == player && @board[5] == player && @board[8] == player ? true : false
    end
  end

  def check_row(number, player)
    if number < 4
      return @board[0] == player && @board[1] == player && @board[2] == player ? true : false
    elsif number < 7
      return @board[3] == player && @board[4] == player && @board[5] == player ? true : false
    else
      return @board[6] == player && @board[7] == player && @board[8] == player ? true : false
    end
  end

  def check_diag(number, player)
    if [1, 5, 9].include?(number)
      return @board[0] == player && @board[4] == player && @board[8] == player ? true : false
    elsif [3, 5, 7].include?(number)
      return @board[2] == player && @board[4] == player && @board[6] == player ? true : false
    else
      return false
    end
  end
end