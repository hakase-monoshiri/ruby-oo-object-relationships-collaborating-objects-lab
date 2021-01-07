class Artist

    attr_accessor :name

    @@all = []

    def initialize(name)
        @name = name
        @@all << self
    end

    def self.all
        @@all
    end

    def add_song(song)
        song.artist = self
    end

    def songs
        Song.all.select{|individual_song| individual_song.artist == self}
    end

    def self.find_or_create_by_name(artist_name)
    found_artist = self.all.find{|individual_artist| individual_artist.name == artist_name}
    if found_artist == nil
        found_artist = Artist.new(artist_name)
    end
    found_artist
    end

    def print_songs
        self.songs.each do |individual_song|
            puts individual_song.name
            end
    end

end
