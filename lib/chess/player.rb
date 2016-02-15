module Chess
  class Player
    attr_accessor :name, :color
    def initialize(color)
      @name = UI.get_name(color)
      @color = color
    end
  end
end
