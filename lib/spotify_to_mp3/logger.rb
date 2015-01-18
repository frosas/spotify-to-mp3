require 'colorize'

module SpotifyToMp3
  class Logger
    def initialize(io_stream)
      @io_stream = io_stream
    end

    def info(str)
      @io_stream.puts str
    end

    def succ(str)
      @io_stream.puts colorize_succ(str)
    end

    def error(str)
      @io_stream.puts colorize_error(str)
    end

    private

    def colorize_succ(str)
      str.green
    end

    def colorize_error(str)
      str.red
    end
  end
end
