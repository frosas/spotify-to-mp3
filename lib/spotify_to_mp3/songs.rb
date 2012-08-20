class UnresolvedSong
  def initialize(context, id)
    @context = context
    @id = id
  end

  def resolve
    resolver = SpotifyToMp3::Grooveshark::UriResolver.new
    if resolver.resolvable?(@id)
      track = SpotifyToMp3::Grooveshark::UriResolver.new.resolve(@id)
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
    file = RestClient::Request.execute(:method => :post, :url => url, :raw_response => true).file
    FileUtils.mv(file.path, filename)
  end
end
