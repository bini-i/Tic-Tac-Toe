class Player
  attr_reader :name
  attr_accessor :type
  def initialize(name)
    @name = name
    @type = '_'
  end
end
