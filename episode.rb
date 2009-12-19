class Episode
  attr_reader :name, :locators
  def initialize episode_element
    @episode_element = episode_element
    @name = find_name
    @locators = find_locators
  end

  def find_name
    (@episode_element/:b).first.inner_text.strip
  end
  
  def find_locators 
    links = (@episode_element/:a).select {|anchor| anchor.attributes['href'].match '.m3u'}
    links.map do |link|
      link_text = link.attributes['href']
      link_text.gsub! 'm3u', 'mp3'
    end
  end
end
