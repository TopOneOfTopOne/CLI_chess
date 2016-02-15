module Chess
  class Piece
    attr_accessor :name, :color, :unicode, :code
    def initialize(name, color)
      @name = name
      @color = color
      # getting the code for find the correct unicode piece is a bit obscure, just remember UNICODE_PIECE is a constant part of Chess module
      @code = "#{color.to_s[0]}_#{name[0].upcase}"
      @unicode = UNICODE_PIECES[@code]
    end
  end
end
