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
    song = Song.new
    @@all << song
    song
  end

  def self.new_by_name(name)
    song = Song.create
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = Song.new
    song.name = name
    @@all << song
    song
  end

  def self.find_by_name(name)
    Song.all.find do |song|
      song.name == name
    end
  end

  def self.find_or_create_by_name(name)
    song_in = Song.find_by_name(name)
    if song_in == nil
      song_in = Song.create_by_name(name)
    end
    song_in
  end

  def self.alphabetical
    Song.all.sort_by do |song|
      song.name
    end

  end

  def self.new_from_filename(filename)
    parsed_filename = filename.split(" - ")
    #binding.pry
    song = Song.new
    song.name = parsed_filename[1].chop.chop.chop.chop
    song.artist_name = parsed_filename[0]
    song
  end

  def self.create_from_filename(filename)
    song = Song.new_from_filename(filename)
    song.save
  end

  def self.destroy_all
    @@all = []
  end 

end
