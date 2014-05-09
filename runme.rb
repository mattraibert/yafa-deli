require './parsing'

keywords = ["space", "rare", "t33th", "psychotic", "kamikaze", "mathematics", "curator", "abstract",
"green", "voidstars", "timpany", "photon", "jazz", "industrial", "trash", "jukebox", "157",
"area", "irregular", "glint", "cuff", "wintery", "caribbean", "funk"]

test_dirname

keywords_re = /#{keywords.join ?|}/

puts episodes.empty?
puts ?* * 20
desired_episodes = episodes.select {|e| e.dirname =~ keywords_re }
puts desired_episodes.dl