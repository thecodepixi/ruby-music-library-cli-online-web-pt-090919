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
      case user_input 
        when "list songs"
          list_songs 
        when "list artists"
          list_artists
        when "list genres"
          list_genres
        when "list artist"
          list_songs_by_artist
        when "list genre"
          list_songs_by_genre
        when "play song"
          play_song
        end 
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
    sorted_artists 
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
    puts "Please enter the name of an artist:"
    artist_name = gets.chomp 
    artist = Artist.find_by_name(artist_name)
    index = 0 
    if artist != nil 
      sorted_songs = artist.songs.sort { |song_a, song_b| song_a.name <=> song_b.name}
      sorted_songs.each do |song|
        index += 1 
        puts "#{index}. #{song.name} - #{song.genre.name}"
      end 
    end 
  end 
  
  def list_songs_by_genre 
    puts "Please enter the name of a genre:"
    genre_name = gets.chomp 
    genre = Genre.find_by_name(genre_name)
    index = 0 
    if genre != nil 
      sorted_songs = genre.songs.sort { |song_a, song_b| song_a.name <=> song_b.name}
      sorted_songs.each do |song|
        index += 1 
        puts "#{index}. #{song.artist.name} - #{song.name}"
      end 
    end 
  end 
  
  def play_song 
    puts "Which song number would you like to play?"
    user_input = gets.chomp
    user_number = user_input.to_i
    sorted_songs = Song.all.sort { |song_a, song_b| song_a.name <=> song_b.name }
    n = 1
    sorted_songs.each do |song|
      if n == user_number
        puts "Playing #{song.name} by #{song.artist.name}"
      end 
      n += 1
    end 
  end 
  
 #this ends the class  
end 