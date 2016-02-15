module Chess
  # Deals with the interactions between user and program
  module UI
    # def self.get(hash)
    #   case hash.keys[0]
    #   when :name
    #     get_name(hash.values[0])
    #   else
    #     raise "Unknown item"
    #   end
    # end
    def self.get_name(color)
      Printer.get_name(color)
      name = gets.chomp
      return name
    end
  end
end
