Dir["pages/\*.rb"].each do |page|
  require_relative page.gsub("pages/", "").gsub("_page.rb", "")
end

class Narrator
  def initialize
    @pages = {}
    gather_pages_into_pages_hash
    @current_page = :title
  end

  def narrate
    page = @current_page.to_s
    self.send("recite_scene_in_#{page}_page".to_sym)
  end

  def display_current_page
    page = @current_page.to_s
    self.send("draw_entities_from_#{page}_page".to_sym)
  end

  private

  def gather_pages_into_pages_hash
    unless Dir["pages/\*.rb"].empty?
      Dir["pages/\*.rb"].each do |page|
        key = page.gsub("pages/", "").gsub("_page.rb", "").to_sym
        klass = key.to_s.split("_").map(&:capitalize).join("")
        @pages[key] = Object.const_get(klass.concat("Page")).new
      end
    end
  end

  def recite_scene_in_title_page
  end

  def draw_entities_from_title_page
  end
end
