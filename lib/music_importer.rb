class MusicImporter
  attr_accessor :path

  def initialize(file_path)
    @path = file_path
  end

  def files
    entries = Dir.entries(@path).select { |f| !File.directory? f }
    entries
  end

  def import
    self.files.each do |file|
      Song.create_from_filename(file)
    end
  end
end
