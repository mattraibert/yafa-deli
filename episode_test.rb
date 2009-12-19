require 'test/unit'
require 'episode'
require 'hpricot'
require 'episode_test_helper'

class EpisodeTest < Test::Unit::TestCase
  include EpisodeTestHelper
  
  def test_parse_a_one_hour_episode
    episodeData = Hpricot.parse(one_hour_episode_html)
    
    episode = Episode.new episodeData

    assert_equal "The Jam Session", episode.name
    assert_equal "wzbc-2009-12-18-01-00.mp3", episode.locators.first
  end

  def test_ignore_extra_anchor
    episodeData = Hpricot.parse(one_hour_episode_extra_anchor_html)
    
    episode = Episode.new episodeData

    assert_equal 1, episode.locators.size, "Should have ignored extra anchor"
  end

  def test_parse_a_two_hour_episode
    episodeData = Hpricot.parse(two_hour_episode_html)
    
    episode = Episode.new episodeData

    assert_equal "Forward the Bass", episode.name
    assert episode.locators.include?("wzbc-2009-12-19-00-00.mp3")
    assert episode.locators.include?("wzbc-2009-12-19-06-00.mp3")
  end
end
