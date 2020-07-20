class Song
  attr_accessor :name, :artist_name

  @@all = []
  def initialize 
    @name=name
    @artist_name=artist_name
  end

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
      song.name = name
      song
  end
  def self.create_by_name(name)
      song = self.create
      song.name = name
      song
  end
  def self.find_by_name(name)
    self.all.find{|song| song.name == name}
  end
  def self.find_or_create_by_name(name)
    if self.find_by_name(name)
      self.find_by_name(name)
    else 
      self.create_by_name(name)
    end
  end

  def self.alphabetical
    @@all.sort_by{ |obj| obj.name}
  end

  def self.new_from_filename(filename)
    new_song=self.new
    replaced_name=filename.gsub(" - ",".")
    splited_name=replaced_name.split(".")
    new_song.name= splited_name[1]
    new_song.artist_name=splited_name[0]
    new_song
  end
  def self.create_from_filename(filename)
    new_song=self.create
    replaced_name=filename.gsub(" - ",".")
    splited_name=replaced_name.split(".")
    new_song.name= splited_name[1]
    new_song.artist_name=splited_name[0]
    new_song
  end
  def self.destroy_all
    self.all.clear
  end

end
  

