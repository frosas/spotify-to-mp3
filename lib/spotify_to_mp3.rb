require 'rubygems'
require 'grooveshark'
require 'open-uri'
require 'colorize'
require 'rest-client'
require 'fileutils'

require 'spotify_to_mp3/services'
require 'spotify_to_mp3/songs'
require 'spotify_to_mp3/sources'

module SpotifyToMp3

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
              begin
                song.download
                puts "Done".green
              rescue Exception => exception
                puts exception.message.red
              end
            end
          rescue
            puts "#{$!}".red
          end
        }
      rescue
        puts "#{$!}".red
      end
    end
  end
end
