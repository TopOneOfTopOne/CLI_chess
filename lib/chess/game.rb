module Chess
  class Game

    def initialize
      # in future implement a move log to enforce a 50 move rule
      # add deslection
      # add colorize gem
      @turns = 0
      @board = Board.new
      # upon creation of player user should be prompted for name of player, and that name will be used to identify the player
      @players = [Player.new(:white), Player.new(:black)] # only create two players since chess is two player game
      Printer.print_msg({welcome_msg: nil})
      run
    end

    def run
      loop do
       player = player.each do |player|
          @board.display
          if @board.check_mate?(player)
            break
          elsif @board.check?(player)
            Printer.print_msg({check: player})
          end
          Printer.print_msg({piece_select: player})
          # select_piece steps:
          # keep prompting user until valid input entered i.e. a2 (after n tries tell user how to seek help)
          ## keep prompting user until selected piece.possible_moves(@board).length > 0 (piece i.e. white_pawn1)
          ### #possible_moves(@board): (returns array of possible moves)
          #### add current position to VALID_MOVES class variable to generate valid_current_moves array then check each element to see if it is a possible move to add it to the possible_moves array
          #### remember to return selected piece as first element in array
          ##### checks: square_empty? (only check for your pieces), not_in_check?, in_board?, no_piece_blocking? (no call when horse piece) *note pieces belong to the board not player
          selected_piece,possible_moves = player.select_piece(@board)
          Printer.print_msg({possible_move: possible_moves}) # print_msg is a hash to tailor the message for particular situation
          # #move:
          ## goal to update board
          ### 2.prompt user until possible_moves array include user_input
          ### 3. board.move_piece(selected_piece, user_input)
          # In board.move_piece: board.remove_piece(selected_piece) board.place_piece(user_input)
          # In board.place_piece: if en_passant? exe_enpassant elif square_occupied? kill_piece elif castle? castle elif square_empty? normal_piece_place else raise "Fatal Error"  (user_input represents a location)
          player.move(selected_piece, possible_moves, @board)
       end
       turns += 1
        if @board.check_mate?(player)
          Printer.print_msg({game_end: player})
          break
        end
      end
    end
  end
end
