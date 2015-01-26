Gem::Specification.new do |gem|
  gem.name = 'spotify-to-mp3'
  gem.summary = 'Spotify to MP3'
  gem.description = 'Download MP3 files of your Spotify tracks from Grooveshark'
  gem.version = '0.7.1'
  gem.author = 'Francesc Rosàs'
  gem.email = 'francescrosasbosque@gmail.com'
  gem.homepage = 'https://github.com/frosas/spotify-to-mp3'

  gem.add_runtime_dependency 'rspotify', '~> 1.11.0'
  gem.add_runtime_dependency 'grooveshark', '~> 0.2.12'
  gem.add_runtime_dependency 'colorize', '~> 0.7.5'
  gem.add_runtime_dependency 'ruby-progressbar', '~> 1.7.1'

  gem.add_development_dependency 'rspec', '~> 2.14.1'
  
  gem.files = `git ls-files`.split("\n")
  gem.executables = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  gem.require_paths = ['lib']
end
