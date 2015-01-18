require 'net/http'
require 'ruby-progressbar'
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

    def download(track)
      url = @client.get_song_url(track.client_track)
      uri = URI(url)

      Net::HTTP.start(uri.host) do |http|
        http.request_post("#{uri.path}?#{uri.query}", "") do |response|
          half_win = $stdin.winsize[1] / 2
          title = track.to_s[0..half_win.pred].ljust half_win
          title = title.gsub(/.{3}$/, '...') if track.to_s.length > half_win

          pbar = ProgressBar.create(
            :title => title,
            :total => response['content-length'].to_i,
            :format => '%t %p%% [%B] %E')

          File.open(track.filename, 'w') do |f|
            response.read_body do |str|
              f.write str
              str.length.times { pbar.increment }
            end
          end

          pbar.finish
        end
      end
    end
  end
end
