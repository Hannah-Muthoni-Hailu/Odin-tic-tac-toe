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
      if @play_count >= 6 && win(number)
        return "Won"
      end
      # Check if the board is full and the game is a draw
      if @play_count == 9
        return "Draw"
      end
      return "Again"
    end
  end

  def win(number)
    return false
  end
end