module Chess
  class Piece
    attr_accessor :name, :color
    def initialize(name, color)
      @name = name
      @color = color
    end
  end
end
