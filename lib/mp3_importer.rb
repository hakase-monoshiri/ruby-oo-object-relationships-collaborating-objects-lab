class MP3Importer

    attr_accessor :path


    def initialize(file_path)
        @path = file_path
    end


    def files
        mp3_files = Dir.entries(@path)
        mp3_files.select{|filename| filename.end_with?(".mp3")}
    end

    def import
        files.each do |filename|
            filename.chomp(".mp3")
            Song.new_by_filename(filename)
        end
    end


end
