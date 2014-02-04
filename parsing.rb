require 'nokogiri'

def sample
  Nokogiri::HTML(File.read 'wzbc_sample.html')
end

def episode_data
  episode_rows.slice_before do |row| 
    !row.css('td.c3[rowspan]').empty?
  end
end

def episodes
  episode_data.map {|e| Episode.new(e) }
end

def episode_rows
  sample.css('#archivelinks tr').select {|tr| !tr.css('td.c3').empty? }
end

def rowspans
  sample.css('td.c3[rowspan]').map {|x| x.attribute('rowspan').value.to_i }  
end

def test_episode_data
  raise 'failed' unless rowspans == (episode_data.map {|e| e.count })
end

def assert_equal(a, b)
  unless a == b
    raise "#{a} != #{b}"
  end
end

def test_dirname
  e = Episode.new(nil)
  def e.title; 'f.o,o/& b-a\'r? (baz)'; end
  assert_equal(e.dirname, "f_o_o_and_b_a_r___baz_")
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
    if b
      b.text
    else
      'unknown'
    end
  end

  def dirname
    title.downcase.gsub(/ |,|\.|-|\'|\/|\?|\(|\)/,'_').gsub('&', 'and')
  end

  def dl!
    Dir.mkdir(dirname) unless Dir.exists? dirname
    Dir.chdir(dirname) do
      links.each do |link|
        puts ?* * 16
        puts `pwd`
        puts "wget http://zbconline.com/#{link}"
      end
    end
  end
end
