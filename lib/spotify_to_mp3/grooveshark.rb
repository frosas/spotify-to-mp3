require 'net/http'
require 'spotify_to_mp3/grooveshark/track'

module SpotifyToMp3
  class Grooveshark
    def initialize(client)
      @client = client
    end

    def get_track(query)
      client_track = @client.search_songs(query).first or raise "Track not found"
      Track.new(client_track)
    end

    def download(options)
      track = options.fetch(:track)
      track_num_ = options.fetch(:number)
      track_num_ += 1
      track_name = track.filename
      track_number = "%.2i" %track_num_
      on_response = options.fetch(:on_response)
      on_body_chunk = options.fetch(:on_body_chunk)
      
      url = URI(@client.get_song_url(track.client_track))
      Net::HTTP.start(url.host) do |http|
        http.request_post("#{url.path}?#{url.query}", "") do |response|
          on_response.call(response)
          File.open("#{track_number} - #{track_name}", 'w') do |f|
            response.read_body do |chunk|
              on_body_chunk.call(chunk)
              f.write(chunk)
            end
          end
        end
      end
    end
  end
end
