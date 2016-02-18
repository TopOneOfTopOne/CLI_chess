module Chess
  # Deals with the interactions between user and program
  # makes sures user input is correct
  module UI
    def self.get_name
      name = gets.chomp
      return name
    end

    def self.get_piece_loc(board, color)
      loop do
        user_loc = gets.chomp
        if correct_loc_format(user_loc) # if the piece is correct format than an array is returned otherwise nil is returned
          user_loc = correct_loc_format(user_loc)
        else
          next # otherwise we need to get userinput again
        end
        next if !valid_piece_selection?(board,color,user_loc)
        return user_loc
      end
    end

    def self.valid_piece_selection?(board,color,user_loc)
      if board.grid[user_loc[0]][user_loc[1]].nil?
        puts '> Cannot select empty square..'
        return false
      end
      board.iterate_grid do |piece,loc|
        if loc == user_loc
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

    def self.correct_loc_format(loc)
      sanitised_loc = parse(loc)
      return nil if sanitised_loc.nil? # don't need to evaluate further since it is already an invalid value
      if sanitised_loc.length != 2
        puts "> You didn't enter 2 numbers.."
        return nil
      end
      if sanitised_loc[0] < 0 || sanitised_loc[0] > 7 || sanitised_loc[1] < 0 || sanitised_loc[1] > 7
        puts '> Numbers should be in the range of 0-7..'
        return nil
      end
      return sanitised_loc
    end

    def self.parse(loc)
      begin
        sanitised_loc = []
        loc.gsub!(/[^0-9A-Za-z]/, '') # removing special characters
        string_array_loc = loc.split('')
        string_array_loc.each {|elem| sanitised_loc << Integer(elem) }
        return sanitised_loc
      rescue ArgumentError
        puts '> You did not enter a number..'
        return nil
      end
    end

    def self.get_move_to_loc(possible_moves)
      loop do
        user_loc = gets.chomp
        next if !correct_loc_format(user_loc)
        return parse(user_loc) if possible_moves.include? parse(user_loc)
        puts "> Not a possible move.."
      end
    end
  end
end
