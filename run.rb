require 'pry'
require_relative 'lib/song.rb'

#song1 = Song.create
song2 = Song.create_by_name("Ho")
song3 = Song.create_by_name("Ha")
song4 = Song.create_by_name("Heee")

song = Song.new_from_filename("Taylor Swift - Blank Space.mp3")



binding.pry
