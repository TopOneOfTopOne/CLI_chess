module Chess
  module Util
    def self.print_msg(hash)
      case hash.key
      when 'welcome_msg' then welcome_msg
      when 'piece select' then piece_select(hash.value)
      when 'possible move' then possible_move(hash.value)
      else
        raise 'Fatal Error'
      end
    end

    def welcome_msg

    end

    def piece_select(player)

    end

    def possible_move(possible_moves)

    end

  end
end