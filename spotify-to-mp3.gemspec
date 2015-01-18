Gem::Specification.new do |gem|
  gem.name = 'spotify-to-mp3'
  gem.summary = 'Spotify to MP3'
  gem.description = 'Download MP3 files of your Spotify tracks from Grooveshark'
  gem.version = '0.6.1'
  gem.author = 'Francesc Rosàs'
  gem.email = 'francescrosasbosque@gmail.com'
  gem.homepage = 'https://github.com/frosas/spotify-to-mp3'

  gem.add_runtime_dependency 'rspotify'
  gem.add_runtime_dependency 'grooveshark'
  gem.add_runtime_dependency 'colorize'
  gem.add_runtime_dependency 'rest-client'
  gem.add_runtime_dependency 'json_pure'
  gem.add_runtime_dependency 'ruby-progressbar'

  gem.add_development_dependency 'rspec'
  gem.add_development_dependency 'pry'

  gem.files = `git ls-files`.split("\n")
  gem.executables = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  gem.require_paths = ['lib']
end
