require_relative 'board.rb'
require_relative 'player.rb'

def play_game
  #Initialize board
  game_board = Board.new

  #Initialize players
  player1 = Player.new("X", 1)
  player2 = Player.new("O", 2)

  # Marks the end of the game
  done = false
  player = player1 # Initialize first player

  until done
    # Display the current board
    game_board.display
    
    # Ask for player input
    puts "Player #{player.num}, please select a cell number"
    response = gets.chomp.to_i

    # Update the board and check if player has won
    result = game_board.update_board(player.type, response)
    
    if result == "Again"
      # If player hasn't won and board isn't filled, switch players and replay
      player = player.num == 1 ? player2 : player1
    else
      if result == "Won" # Current player has won
        puts "Player #{player.type} has won!! Game over"
        done = true # End game
      elsif result == "Draw" # Board is filled
        puts "Board is full. It's a draw"
        done = true # End game
      else # The player has selected a cell that was already filled
        puts "That cell is filled, please play again"
      end
    end
  end

end

play_game