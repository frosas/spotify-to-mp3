class SpotifyToMp3::Grooveshark::UriResolver
  def resolve(uri)
    content = open('http://ws.spotify.com/lookup/1/.json?uri=' + CGI.escape(uri))
    json = JSON.parse(content.string)
    SpotifyToMp3::Grooveshark::Track.new(json)
  end

  def resolvable?(uri)
    uri.start_with?('http://open.spotify.com/track/', 'spotify:track:')
  end
end
