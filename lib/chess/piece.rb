module Chess
  class Piece
    attr_accessor :name, :color, :unicode, :code
    def initialize(name, color)
      @name = name
      @color = color
      # code is the key for the unicode representation of the piece
      @code = "#{color.to_s[0]}_#{name[0].upcase}"
      @unicode = UNICODE_PIECES[@code]
    end
  end
end
