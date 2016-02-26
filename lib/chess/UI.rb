module Chess
  # Deals with the interactions between user and program
  # makes sures user input is correct
  module UI
    def self.get_name
      name = gets.chomp
      return name
    end

    # gets user input
    # keeps prompting user until they enter a valid location
    def self.get_piece_loc(board, color)
      loop do
        user_loc = gets.chomp
        next unless correct_loc_format(user_loc) # if the piece is correct format than an array is returned otherwise nil is returned
        loc = parse_piece(user_loc)
        next unless valid_piece_selection?(board,color,loc)
        return loc
      end
    end

    # takes in a 2 number array
    # checks to see if chosen piece has possible moves
    # and checks if its player's piece and not opponents
    def self.valid_piece_selection?(board,color,loc)
      if board.grid[loc[0]][loc[1]].nil?
        puts '> Cannot select empty square..'
        return false
      end
      board.iterate_grid do |piece,loc1|
        if loc1 == loc
          if piece.color != color
            puts '> Not your piece..'
            return false
          elsif piece.possible_moves(board).length < 1
            puts '> No possible moves..'
            return false
          else
            return true
          end
        end
      end
      raise 'Fatal error'
    end

    # checks the array consists of only 2 numbers
    # in the range of 0-7
    def self.correct_loc_format(loc)
      loc = parse_piece(loc)
      return nil if loc.nil? # don't need to evaluate further since it is already an invalid value
      return puts "> You didn't enter 2 numbers.." if loc.length != 2
      return puts '> Numbers should be in the range of 0-7..' unless (loc[0].between?(0,7) && loc[1].between?(0,7))
      loc
    end

    # parse_pieces the raw user input that is a string
    # into an array of numbers that can be used to find a piece on grid
    def self.parse_piece(loc)
      begin
        loc.gsub!(/[^0-9A-Za-z]/, '') # removing special characters
        loc.split('').map {|elem| Integer(elem) }
      rescue ArgumentError
        puts '> You did not enter a number..'
      end
    end

    # keeps prompting user until they enter a location in their possible moves array
    def self.get_move_to_loc(possible_moves)
      loop do
        user_loc = gets.chomp
        next unless correct_loc_format(user_loc) # ask user again if not correct input
        return parse_piece(user_loc) if possible_moves.include? parse_piece(user_loc)
        puts '> Not a possible move..'
      end
    end
  end
end
