require "pry"

class MusicLibraryController
  
  def initialize(path = "./db/mp3s")
    MusicImporter.new(path).import 
  end 
  
  def call 
    user_input = "" 
    puts "Welcome to your music library!"
    puts "To list all of your songs, enter 'list songs'."
    puts "To list all of the artists in your library, enter 'list artists'."
    puts "To list all of the genres in your library, enter 'list genres'."
    puts "To list all of the songs by a particular artist, enter 'list artist'."
    puts "To list all of the songs of a particular genre, enter 'list genre'."
    puts "To play a song, enter 'play song'."
    puts "To quit, type 'exit'."
    until user_input == "exit"
      puts "What would you like to do?"
      user_input = gets.chomp 
    end 
   # this ends the call method  
  end 
  
  def list_songs 
    sorted_songs = Song.all.sort { |song_a, song_b| song_a.name <=> song_b.name }
    sorted_songs.each.do |song|
      puts "#{song.index + 1}. #{song.artist.name} - #{song.name} - #{genre.name}"
    end 
    end 
  end 
 #this ends the class  
end 