require 'pry'

class MusicLibraryController
  def initialize(path="./db/mp3s")
    mi = MusicImporter.new(path)
    mi.import
  end

  def call
    input = ""
    until input=="exit" do
      puts "Welcome to your music library!"
      puts "To list all of your songs, enter 'list songs'."
      puts "To list all of the artists in your library, enter 'list artists'."
      puts "To list all of the genres in your library, enter 'list genres'."
      puts "To list all of the songs by a particular artist, enter 'list artist'."
      puts "To list all of the songs of a particular genre, enter 'list genre'."
      puts "To play a song, enter 'play song'."
      puts "To quit, type 'exit'."
      puts "What would you like to do?"

      input = gets.strip
    end
  end

  def list_songs_by_artist
    gets
    puts "Please enter the name of an artist:"
    name = gets.strip
    songs = Artist.find_by_name(name).songs.collect { |song| song.name }
    songs = songs.uniq.sort

    i = 1
    songs.each do |song|
      s_ins = Song.find_by_name(song)
      puts "#{i}. #{song} - #{s_ins.genre.name}"
      i += 1
    end

  end

  def list_genres
    genres = []
    Genre.all.each do |genre|
      genres << genre.name
    end

    genres = genres.uniq.sort
    i =1

    genres.each do |genre|
      puts "#{i}. #{genre}"
      i += 1
    end

  end

  def list_artists
    artists = []
    Artist.all.each do |artist|
      artists << artist.name
    end

    artists = artists.uniq.sort
    i=1

    artists.each do |artist|
      a_ins = Artist.find_by_name(artist)
      puts "#{i}. #{a_ins.name}"
      i += 1
    end
  end

  def list_songs
    songs = []
    Song.all.each do |song|
      songs << song.name
    end

    songs = songs.uniq.sort
    i = 1
    songs.each do |song|
      s_ins = Song.find_by_name(song)
      puts "#{i}. #{s_ins.artist.name} - #{s_ins.name} - #{s_ins.genre.name}"
      i += 1
    end
  end

end
