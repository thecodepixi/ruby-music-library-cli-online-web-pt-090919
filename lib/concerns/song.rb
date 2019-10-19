require "pry"
class Song
  attr_accessor :name
  attr_reader :artist, :genre 
  @@all = [] 
  
  def initialize(name, artist=nil, genre=nil)
    @name = name 
    if artist 
      self.artist=(artist)
    end 
    if genre
      self.genre=(genre)
    end 
  end 
  
  def self.all 
    @@all 
  end 
  
  def save 
    @@all << self 
  end 
 
 def self.destroy_all 
   @@all.clear 
 end 
 
 def self.create(name)
   if !self.all.include?(name)
    new_song = self.new(name)
  end 
   new_song.save 
   new_song 
 end 
 
 def artist=(artist)
   if artist != nil 
    if !Artist.all.include?(artist)
      Artist.find_or_create_by_name(artist) 
    end 
    @artist = artist
    artist.add_song(self)
  end 
 end 
 
 def genre=(genre)
   @genre = genre
   genre.add_song(self)
 end 
 
 def self.find_by_name(name) 
   self.all.detect { |song| song.name == name }
 end 
 
 def self.find_or_create_by_name(name)
   if !self.find_by_name(name)
     self.create(name)
   else 
    self.find_by_name(name)
  end 
 end 
 
  def self.new_from_filename(filename)
    file = filename.split(" - ")
    song = Song.new(file[1])
    song.artist = Artist.find_or_create_by_name(file[0])
    song.genre = Genre.find_or_create_by_name(file[2].split(".")[0])
    song 
  end 
  
  def self.create_from_filename(filename)
    self.new_from_filename(filename).save 
  end 
 
end 