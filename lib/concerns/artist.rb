require "pry"

class Artist 
    extend Concerns::Findable
    attr_accessor :name, :songs
    @@all = [] 
  
  def initialize(name)
    @name = name 
    @songs = [] 
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
   new_artist = self.new(name)
   new_artist.save 
   new_artist
 end 
 
 def add_song(song)
   if song != nil 
    if !song.artist 
      song.artist = self 
    end 
    if !@songs.include?(song)
      @songs << song
    end 
  end 
 end 
 
 def genres 
  genres = [] 
  @songs.each do |song| 
    if !genres.include?(song.genre)
      genres << song.genre
    end 
  end 
  genres  
 end 
 
end 