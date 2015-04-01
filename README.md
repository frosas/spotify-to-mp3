# Spotify to MP3

A simple command line utility to download MP3 files of Spotify tracks. *Note those files are downloaded from Grooveshark, not from Spotify itself.*

---

**THIS PROJECT IS IN MAINTENANCE MODE**

Time is finite and these days I'm focusing on other projects. Hope you understand.

- I'll keep working on the occasional bug fixing and making sure it still works on the supported platforms.
- Most probably I won't add any new feature. [Feature requests](https://github.com/frosas/spotify-to-mp3/labels/Feature) will be kept open in case somebody wants to contribute with a pull request.

---

## Installation

### Mac OS X

```bash
$ sudo gem install spotify-to-mp3
```

Probably `sudo` can be ommited if using [rvm](http://beginrescueend.com/) or similar.

### Linux (Ubuntu)

Make sure you have rubygems installed and configured:

```bash
$ sudo apt-get install ruby2.0 ruby2.0-dev
$ echo 'PATH=$PATH:/var/lib/gems/1.9/bin' | sudo tee /etc/profile.d/rubygems1.9.sh >/dev/null
```

```bash
$ sudo gem2.0 install spotify-to-mp3
```

## Usage

1. Create a file (like `songs.txt`) and copy the Spotify songs URLs to it. Plain song names are also
   accepted. It will look like this:

   ```
   http://open.spotify.com/track/1JqTcOjOn7gEpeC0JcRVPa
   spotify:track:1fE3ddAlmjJ99IIfLgZjTy
   The Drums - Money
   ```

2. Download songs. They are saved to the current directory. Errors will appear in red (like when a song is not found).

   ```bash
   $ spotify-to-mp3 songs.txt
   ```

Also, as it's common in Unix programs, you can pipe in the songs:

```bash
$ echo white knuckle ride | spotify-to-mp3
```

or simply:

```bash
$ spotify-to-mp3
```

and drag the songs from the Spotify app to the terminal.

## Changelog

2015-01-25

- Accept album URI's
- Download progress bar

A big thanks to [@dulakm](https://github.com/dulakm) for such great contributions!

2014-05-05

- Accept track IDs from stdin

2012-08-20

- Set filename artist and title from Grooveshark

2012-01-11

- Touch already downloaded songs. This way songs no more in the download list can be spotted easily.

2011-10-03

- Make it work on ruby 1.8.7 (Snow Leopard)

2011-09-26

- Both Spotify URLs and plain song names are accepted

## Development

Install Ruby.

```bash
$ gem install bundler
$ bundle
$ bundle exec spotify-to-mp3
$ bundle exec rspec
```

## Update RubyGems

Bump version in spotify-to-mp3.gemspec

```bash
$ gem build spotify-to-mp3.gemspec
$ gem push spotify-to-mp3-[version].gem
```

## TODO

- Consider multiple artists songs
- Filter Grooveshark results by artist, title and length
- Accept tracks from stdin (instead of from a file, to drag songs directly to the app)
- Exit with a single Ctrl+C
- Cleaner output
- Don't pick remixes
