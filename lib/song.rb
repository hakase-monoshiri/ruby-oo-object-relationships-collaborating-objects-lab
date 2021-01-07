class Song

    attr_accessor :name, :artist

    @@all = []


    def initialize(name)
        @name = name
        @@all << self
    end

    def self.all 
        @@all
    end

    def self.new_by_filename(filename)
        parsed_filename_array = filename.split(" - ")    
        new_song = Song.new(parsed_filename_array[1])
        new_song.artist = Artist.find_or_create_by_name(parsed_filename_array[0])
        new_song
    end

    def artist_name=(artist_name)
        found_artist = Artist.find_or_create_by_name(artist_name)
        self.artist = found_artist
    end

end
