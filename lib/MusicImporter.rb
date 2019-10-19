require "pry"

class MusicImporter
  
  attr_accessor :path
  @@files = [] 
  
  def initialize(path)
    @path = path 
  end 
  
  def self.import 
    files.each do |song| 
      Song.creat_from_filename(song)
    end 
  end 
  
  def files 
    Dir.entries(@path).select {|f| !File.directory? f}
  end 
  
end 