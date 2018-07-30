class Song
  @@all = []
  attr_accessor :name
  attr_reader :artist, :genre

  def initialize(name,arti=nil,gen=nil)
    @name = name
    self.artist = arti if arti
    self.genre = gen if gen
  end

  def self.new_from_filename(name)
    name = name.split(".")
    details = name[0].split(" - ")
    artist = Artist.find_or_create_by_name(details[0])
    genre = Genre.find_or_create_by_name(details[2])

    song = Song.find_or_create_by_name(details[1])
    song.artist = artist
    song.genre = genre

    song

  end

  def self.create_from_filename(name)
    song = Song.new_from_filename(name)
    song.save
    song 
  end

  def self.find_by_name(name)
    @@all.detect { |e| e.name==name  }
  end

  def self.find_or_create_by_name(name)
    song = Song.find_by_name(name)
    if(song)
      return song
    else
      return Song.create(name)
    end
  end

  def genre=(genre)
    @genre = genre
    @genre.add_song(self)
  end

  def artist=(artist)
    @artist = artist
    @artist.add_song(self)
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

  def self.create(name,artist=nil,genre=nil)
    song = Song.new(name,artist,genre)
    song.save
    song
  end

end
