require_relative '../board'
require_relative '../player'

describe Board do
  subject(:board) { described_class.new }
  describe "#win" do
    context "Check that a player wins when they are supposed to" do
      before do
        allow(board).to receive(:check_col).and_return(true)
        allow(board).to receive(:check_diag).and_return(true)
        allow(board).to receive(:check_row).and_return(true)
      end

      it "returns true when the player wins a game" do
        num = 1
        player = 1
        expect(board.win(num, player)).to be true
      end
    end
  end

  describe "#display" do
    # No need to test this method as it is mainly using "puts"
  end

  describe "#update_board" do
    context "when the position selected is already filled" do
      before do
        board.board = [1, 2, 3, 4, 5, 6, 7, 8, 'X']
      end

      it "prevents player from marking a filled section" do
        expect(board.update_board(1, 9)).to eql("Filled")
      end
    end

    it "changes the board value at the specified position" do
      board.update_board('O', 9)
      expect(board.board[8]).to eql('O')
    end

    it "increments playcount" do
      original = board.play_count
      board.update_board('O', 9)
      expect(board.play_count).to eql(original += 1)
    end

    context "when the player has won a game" do
      before do
        board.play_count = 5
        allow(board).to receive(:win).and_return(true)
      end

      it "informs the player that they have won" do
        expect(board.update_board('X', 9)).to eql("Won")
      end
    end

    context "when the board is full" do
      before do
        board.play_count = 8
      end

      it "tells the player that the game is drawn" do
        expect(board.update_board('X', 9)).to eql('Draw')
      end
    end
  end

  describe "#check_col" do
    context "when the first column is full" do
      before do
        board.board[0] = board.board[3] = board.board[6] = 'X'
      end
      
      it "informs the player that they have won" do
        expect(board.check_col(1, 'X')).to be true
      end
    end

    context "when the second column is full" do
      before do
        board.board[1] = board.board[4] = board.board[7] = 'X'
      end
      
      it "informs the player that they have won" do
        expect(board.check_col(2, 'X')).to be true
      end
    end

    context "when the third column is full" do
      before do
        board.board[2] = board.board[5] = board.board[8] = 'X'
      end
      
      it "informs the player that they have won" do
        expect(board.check_col(3, 'X')).to be true
      end
    end
  end
end