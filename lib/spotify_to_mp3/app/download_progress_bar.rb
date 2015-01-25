require 'ruby-progressbar'
require 'forwardable'

module SpotifyToMp3
  class App
    class DownloadProgressBar
      extend Forwardable
      
      def_delegators :@progress_bar, :progress, :progress=, :finish
      
      def initialize(options)
        track = options.fetch(:track)
        track_number = options.fetch(:track_number)
        track_size = options.fetch(:track_size)
        total_tracks = options.fetch(:total_tracks)
        
        @progress_bar = ProgressBar.create(
          title: cut_title("[#{track_number}/#{total_tracks}] #{track}"),
          total: track_size,
          format: "%t %p%% [%B] %E"
        )
      end
      
      private
      
      def cut_title(title)
        win_half = $stdout.winsize[1] / 2
        cut_title = title[0..win_half.pred].ljust win_half
        cut_title.gsub(/.{3}$/, '...') if title.length > win_half
        cut_title
      end
    end
  end
end