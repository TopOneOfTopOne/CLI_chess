module Chess
  #helps with print messages to output
  module Printer
    # def self.print_msg(hash)
    #   case hash.keys[0]
    #   when :welcome_msg then welcome_msg
    #   when :piece_select then piece_select(hash.values[0])
    #   when :possible_move then possible_move(hash.values[0])
    #   when :get_name then get_name(hash.values[0])
    #   else
    #     raise 'Fatal Error'
    #   end
    # end

    def self.make_fancy(msg)
    block = "\u2593"
    puts <<-HERE
    #{block * 6}#{block * msg.length}#{block * 7}
    #{block * 2}#{' '* (msg.length + 9)}#{block * 2}
    #{block * 2}     #{msg}    #{block * 2}
    #{block * 2}#{' '* (msg.length + 9)}#{block * 2}
    #{block * 6}#{block * msg.length}#{block * 7}
    HERE
    end
    def self.normal(msg)
      puts "> #{msg}"
    end
    def self.welcome_msg
      make_fancy('Chess by yours truly: noobling')
    end

    def self.piece_select(player)

    end

    def self.possible_move(possible_moves)

    end

    def self.get_name(color)
      normal("Enter player name (#{color})")
    end

    def self.game_end(msg)
      make_fancy(msg)
    end
  end
end