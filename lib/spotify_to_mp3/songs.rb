class ResolvedSong
  def initialize(source)
    @source = source
  end

  def from_grooveshark
    GroovesharkSong.new(@source.grooveshark_query)
  end

  def to_s
    "#{@source}"
  end
end

class GroovesharkSong
  def initialize(query)
    @grooveshark = SpotifyToMp3::Grooveshark.new
    @raw_grooveshark_song = @grooveshark.song(query)
  end

  def download
    download_url(@grooveshark.song_url(@raw_grooveshark_song))
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
    file = RestClient::Request.execute(:method => :post, :url => url, :raw_response => true).file
    FileUtils.mv(file.path, filename)
  end
end
