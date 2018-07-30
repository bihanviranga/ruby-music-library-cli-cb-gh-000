require 'concerns/concerns.rb'

class Genre
  extend Concerns::Findable
  @@all = []
  attr_accessor :name

  def initialize(name)
    @name = name
    @songs = []
  end

  def artists
    @songs.collect{ |song| song.artist }.uniq
  end

  def songs
    @songs
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all=[]
  end

  def save
    @@all << self
  end

  def self.create(name)
    genre = Genre.new(name)
    genre.save
    genre
  end

  def add_song(song)
    @songs << song if !(@songs.include?(song))
  end

end
