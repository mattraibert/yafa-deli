require 'nokogiri'

def sample
  Nokogiri::HTML(File.read 'wzbc_sample.html')
end

def episodes
  e = episode_rows.slice_before {|row| !row.css('td.c3[rowspan]').empty? }
  [*e]
end

def episode_rows
  sample.css('#archivelinks tr').select {|tr| !tr.css('td.c3').empty? }
end

def rowspans
  sample.css('td.c3[rowspan]').map {|x| x.attribute('rowspan').value.to_i }  
end

def test_episodes
  rowspans == (episodes.map {|e| e.count })
end

class Episode
  def initialize(episode_elements)
    @episode_elements = episode_elements
  end

  def links
    links = @episode_elements.map {|r| r.css('a') }.flatten
    links = links.select {|a| a.text == 'Listen' }
    links.map {|a| a.attribute('href').value.sub('.m3u','.mp3') }
  end

  def title
    b = @episode_elements.map {|e| e.css('b').first }.compact.first
    b.text if b
  end

  def dl!
    
  end
end
