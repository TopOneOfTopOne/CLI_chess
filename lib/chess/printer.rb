module Chess
  # helps with printing messages to output
  module Printer
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
      puts "Suggested terminal preferences;
  Background: white
  Area: 95x35\n".colorize(:blue)
      make_fancy('Chess by yours truly: noobling')
    end


    def self.help_reminder
      normal("Type 'h' for help".colorize(:red))
    end

    def self.piece_select(name, color)
      normal("Select a piece #{name}(#{color.to_s.colorize(color)})")
    end

    def self.move_to(possible_moves)
      normal("Possible moves: #{possible_moves}")
      normal('Enter location to move to')
    end

    def self.get_name(color)
      normal("Enter player name (#{color.to_s.colorize(color)})")
    end
    def self.check(player)
      make_fancy("You are in check #{player.name}")
    end
    def self.game_end(msg)
      make_fancy(msg)
    end

  end
end