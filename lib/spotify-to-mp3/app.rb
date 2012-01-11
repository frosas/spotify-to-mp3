require 'rubygems'
require 'grooveshark'
require 'open-uri'
require 'colorize'
require 'cgi'

class SpotifyToMp3
  class App
    def initialize
      @context = {
        :grooveshark => Grooveshark.new,
        :spotify => Spotify.new
      }
    end

    def run
      begin
        file = ARGV.first
        raise "No songs file specified. Usage: #{$0} file" if file.nil?
        
        File.open(file).each_line{|song_id|
          song_id.strip!
          next if song_id.empty?
          begin
            song = UnresolvedSong.new(@context, song_id)
            print "Resolving \"#{song}\" "
            song = song.resolve
            print "-> Searching \"#{song}\" on Grooveshark "
            song = song.from_grooveshark
            print "-> Downloading \"#{song}\" "
            if File.exists? song.filename
              FileUtils.touch song.filename # To know about songs no longer in download list
              puts "Already exists, skipping".green
            else
              song.download
              puts "Done".green
            end
          rescue
            puts "#{$!}".red
          end
        }
      rescue
        puts "#{$!}".red
      end
    end

    private

    class UnresolvedSong
      def initialize(context, id)
        @context = context
        @id = id
      end

      def resolve
        if @id.start_with?('http://open.spotify.com/track/', 'spotify:track:')
          track = @context[:spotify].track(@id)
          source = SpotifySource.new(@context, track)
        else
          source = PlainSource.new(@context, @id)
        end
        ResolvedSong.new(@context, source)
      end

      def to_s
        @id
      end
    end

    class Source
      def grooveshark_query
        raise "Not implemented"
      end

      def to_s
        raise "Not implemented"
      end
    end

    class SpotifySource < Source
      def initialize(context, track)
        @context = context
        @track = track
      end

      def grooveshark_query
        "artist:\"#{@track.artist}\" title:\"#{@track.name}\""
      end

      def to_s
        "#{@track.artist} - #{@track.name}"
      end
    end

    class PlainSource < Source
      attr_reader :grooveshark_query, :to_s

      def initialize(context, id)
        parts = id.split(' - ', 2)
        if parts.length < 2
          @grooveshark_query = id
          @to_s = id
        else
          artist, name = parts
          @grooveshark_query = "artist:\"#{artist}\" title:\"#{name}\""
          @to_s = "#{artist} - #{name}"
        end
      end
    end

    class ResolvedSong
      def initialize(context, source)
        @context = context
        @source = source
      end

      def from_grooveshark
        GroovesharkSong.new(@context, @source.grooveshark_query)
      end

      def to_s
        "#{@source}"
      end
    end

    class GroovesharkSong
      def initialize(context, query)
        @context = context
        @raw_grooveshark_song = @context[:grooveshark].song(query)
      end

      def download
        download_url(@context[:grooveshark].song_url(@raw_grooveshark_song))
      end

      def to_s
        "#{@raw_grooveshark_song.artist} - #{@raw_grooveshark_song.name}"
      end

      def filename
        name = "#{@raw_grooveshark_song.artist} - #{@raw_grooveshark_song.name}.mp3"
        name.tr('/', '-') # / is not allowed in file names
      end

      private

      def download_url(url)
        content = open(url).read
        file = open(filename, 'wb')
        file.write(content)
        file.close
      end
    end

    class Grooveshark
      def initialize
        @client = ::Grooveshark::Client.new
      end

      def song_url(song)
        @client.get_song_url(song)
      end

      def song(query)
        song = @client.search_songs(query).first
        raise "Song not found" if song.nil?
        song
      end
    end

    class Spotify
      def track(uri)
        content = open('http://ws.spotify.com/lookup/1/.json?uri=' + CGI.escape(uri))
        json = JSON.parse(content.string)
        Track.new(json)
      end

      class Track
        attr_reader :name, :artist

        def initialize(json)
          @name = json['track']['name']
          @artist = json['track']['artists'].first['name']
        end
      end
    end
  end
end
