# Spotify to MP3

A simple command line utility to download MP3 files of Spotify tracks

## Installation

### Mac OS X (Lion)

    $ gem install spotify-to-mp3

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

1. Drag Spotify songs to a file (eg, songs.txt). It will look like this:

        http://open.spotify.com/track/1JqTcOjOn7gEpeC0JcRVPa
        http://open.spotify.com/track/4pQIl2gJyRDKiwIhEOc1gW
        http://open.spotify.com/track/2rREB1sRvcb5i6AZRhOhey
        http://open.spotify.com/track/6UOvd5f3oyfIGW3GA8dn89

2. Download songs. Errors will appear in red (eg, when a song is not found)

        $ spotify-to-mp3 songs.txt

## Changelog

Sep/26/2011

- Both Spotify URLs and song names are accepted

## TODO

- Consider multiple artists songs
- Estimated download time
  - Per song
  - Total
- Touch existing files so they can be distingued from non downloaded
- Distinguish internal errors from user errors
- Filter Grooveshark results by artist, title and length
