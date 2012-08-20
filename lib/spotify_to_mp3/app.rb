module SpotifyToMp3
  class App
    def initialize(track_id_resolver, grooveshark)
      @track_id_resolver = track_id_resolver
      @grooveshark = grooveshark
    end

    def run
      file = ARGV.first or raise "No songs file specified. Usage: #{$0} file"
      file_track_ids(file).each do |track_id|
        begin
          puts "Resolving \"#{track_id}\" ".blue
          track = @track_id_resolver.resolve(track_id)

          puts "Searching \"#{track}\" on Grooveshark ".blue
          grooveshark_track = @grooveshark.get_track(track.grooveshark_query)

          puts "Downloading \"#{grooveshark_track}\" ".blue
          if File.exists? grooveshark_track.filename
            FileUtils.touch grooveshark_track.filename # To know about songs no longer in download list
            puts "Already exists, skipping".green
          else
            @grooveshark.download(grooveshark_track)
            puts "Done".green
          end
        rescue Exception => exception # For some reason without the "Exception" it is ignored
          puts exception.message.red
          # Continue with the next track
        end
      end
    rescue
      puts "#{$!}".red
    end

    def file_track_ids(file)
      Class.new do
        include Enumerable

        def initialize(file)
          @file = file
        end

        def each
          File.open(@file) do |file|
            file.each_line do |track_id|
              track_id.strip!
              next if track_id.empty?
              yield track_id
            end
          end
        end
      end.new(file)
    end
  end
end
