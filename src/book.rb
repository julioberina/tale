require "gosu"
require_relative "narrator"

class Book < Gosu::Window
  def initialize(title, width, height)
    super width, height
    self.caption = title
    @narrator = Narrator.new
  end

  def update
    @narrator.narrate
  end

  def draw
    @narrator.display_current_page
  end

  def open
    self.show
  end
end
