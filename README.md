# Spotify to MP3

A simple command line utility to download MP3 files of Spotify tracks

## Installation

### Mac OS X (Snow Leopard & Lion)

    $ sudo gem install spotify-to-mp3

Probably `sudo` can be ommited if using [rvm](http://beginrescueend.com/) or similar.

### Linux (Ubuntu 11.04)

Make sure you have rubygems installed and configured:

    $ sudo apt-get install rubygems1.8
    $ echo 'PATH=$PATH:/var/lib/gems/1.8/bin' | sudo tee /etc/profile.d/rubygems1.8.sh >/dev/null

<span></span>

    $ sudo gem install spotify-to-mp3

### Windows (not tested)

[Install Ruby](http://rubyinstaller.org/)

    > gem install spotify-to-mp3

## Usage

1. Drag Spotify songs to a file (eg, songs.txt). Plain song names are also 
   accepted. It may look like this:

        http://open.spotify.com/track/1JqTcOjOn7gEpeC0JcRVPa
        spotify:track:1fE3ddAlmjJ99IIfLgZjTy
        The Drums - Money

2. Download songs. Errors will appear in red (eg, when a song is not found)

        $ spotify-to-mp3 songs.txt

## Changelog

2012-08-20

- Set filename artist and title from Grooveshark

2012-01-11

- Touch already downloaded songs. This way songs no more in the download list can be spotted easily.

2011-10-03

- Make it work on ruby 1.8.7 (Snow Leopard)

2011-09-26

- Both Spotify URLs and plain song names are accepted

## Testing

[![Build Status](https://secure.travis-ci.org/frosas/spotify-to-mp3.png)](http://travis-ci.org/frosas/spotify-to-mp3)

```bash
$ rspec
```

## TODO

- Consider multiple artists songs
- Filter Grooveshark results by artist, title and length
- It seems Grooveshark API fails after hundreds of calls
- Accept tracks from stdin (instead of from a file)
- Test downloads
- Test App class
