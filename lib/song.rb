require "pry"

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
    @@all << song 
    song 
  end

  def self.new_by_name(name)
    song = self.new
    song.name  = name 
    song
  end

  def self.create_by_name(name)
    song = self.new
    song.name = name 
    @@all << song
    song  
  end

  def self.find_by_name(name)
    self.all.find {|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create_by_name(name)
  end

  def self.alphabetical
    self.all.sort_by { |x| x.name}
  end 

  def self.new_from_filename(file_name)
    array = file_name.split(" - ")
    artist_name = array[0]
    name_1 = array[1].reverse
    name = name_1.slice!(4, name_1.length - 1).reverse
    song = self.new 
    song.artist_name = artist_name
    song.name = name
    song 
  end

  def self.create_from_filename(file_name)
    array = file_name.split(" - ")
    artist_name = array[0]
    name_1 = array[1].reverse
    name = name_1.slice!(4, name_1.length - 1).reverse
    song = self.new 
    song.artist_name = artist_name
    song.name = name
    self.all << song 
    song
  end

  def self.destroy_all
    self.all.clear
  end
 
end

