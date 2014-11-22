require 'spotify_to_mp3/logger'

describe SpotifyToMp3::Logger do
  let(:io_stream) { double }
  let(:logger) { described_class.new(io_stream) }

  describe '#info' do
    it 'prints message to stream' do
      message = 'Hello world'

      expect(io_stream).to receive(:puts).with(message)

      logger.info message
    end
  end

  describe '#error' do
    it 'prints colorized message to stream'  do
      message = 'Hello world'
      colorized_message = "\e[0;31;49m#{message}\e[0m" # red

      expect(io_stream).to receive(:puts).with(colorized_message)

      logger.error message
    end
  end
end
