module Chess
  # Deals with the interactions between user and program
  # makes sures user input is correct
  module UI
    def self.get_name(color)
      name = gets.chomp
      return name
    end

    def self.get_piece_loc(board, color)
      loop do
        user_loc = gets.chomp
        next if !correct_loc_format?(user_loc)
        next if !valid_piece_selection?(board,color,user_loc)
        return user_loc
      end
    end

    def self.valid_piece_selection?(board,color,user_loc)
      board.iterate_grid do |piece,loc|
        if loc == user_loc
          if piece.color != color
            puts '> Not your piece'
            return false
          elsif piece.possible_moves(board).length < 1
            puts '> No possible moves'
            return false
          else
            return true
          end
        end
      end
      raise 'Fatal error'
    end

    def self.correct_loc_format?(loc)
      sanitised_loc = parse(loc)
      if sanitised_loc.length != 2
        puts "> You didn't enter 2 numbers"
        return false
      end
      if sanitised_loc[0] < 0 || sanitised_loc[0] > 7 || sanitised_loc[1] < 0 || sanitised_loc[1] > 7
        puts '> Numbers should be in the range of 0-7'
        return false
      end
      true
    end

    def self.parse(loc)
      begin
        sanitised_loc = []
        string_array_loc = loc.split('')
        string_array_loc.each {|elem| sanitised_loc << Integer(elem) }
        return sanitised_loc
      rescue ArgumentError
        puts "> You did not enter a number.."
        return nil
      end
    end
  end
end
