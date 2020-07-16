require 'pry'
class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    song = self.new
    Song.all << song
    song
  end

  def self.new_by_name(song_name)
    song = self.create
    song.name = song_name
    song
  end

  def self.create_by_name(song_name)
    song = self.new_by_name(song_name)
    song
  end
    
  def self.find_by_name(song_name)
    Song.all.find do |index|
      index.name == song_name
    end
  end

  def self.find_or_create_by_name(song_name)
    if self.find_by_name(song_name)
      self.find_by_name(song_name)
    else
      self.create_by_name(song_name)
    end
  end

  def self.alphabetical
    Song.all.sort_by {|index|index.name}
  end

  def self.new_from_filename(song_name_file)
    artist = song_name_file.partition(" - ")[0]
    name = song_name_file.partition(" - ")[2].partition(".")[0]
    song = self.find_or_create_by_name(name)
    song.artist_name = artist
    song
  end

  def self.create_from_filename(song_name_file)
    song = self.new_from_filename(song_name_file)
    Song.all << song
    song
  end

  def self.destroy_all
    Song.all.clear
  end
end
