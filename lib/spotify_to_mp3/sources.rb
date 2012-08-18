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
