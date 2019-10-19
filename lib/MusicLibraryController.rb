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
    index = 0 
    sorted_songs.each do |song| 
      index += 1 
      puts "#{index}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
    end 
  end 
  
  def list_artists 
    sorted_artists = Artist.all.sort { |artist_a, artist_b| artist_a.name <=> artist_b.name }
    index = 0 
    sorted_artists.each do |artist| 
      index += 1 
      puts "#{index}. #{artist.name}"
    end 
  end 
  
  def list_genres
    sorted_genres = Genre.all.sort { |genre_a, genre_b| genre_a.name <=> genre_b.name }
    index = 0 
    sorted_genres.each do |genre|
      index += 1 
      puts "#{index}. #{genre.name}"
    end 
  end 
  
  def list_songs_by_artist
    puts "Input an artist name"
    artist_name = gets.chomp 
  end 
 #this ends the class  
end 