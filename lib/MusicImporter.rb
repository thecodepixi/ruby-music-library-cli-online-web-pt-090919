require "pry"

class MusicImporter
  
  attr_accessor :path
  @@files = [] 
  
  def initialize(path)
    @path = path 
  end 
  
  def import 
    files.each do |song| 
      Song.create_from_filename(song)
    end 
  end 
  
  def files 
    Dir.entries(@path).select {|f| !File.directory? f}
  end 
  
end 