# Spotify to MP3

A simple command line utility to download MP3 files of Spotify tracks

## Installation

    $ gem install spotify-to-mp3

## Usage

1. Drag Spotify songs to a file (eg, songs.txt). It will look like this:

        http://open.spotify.com/track/1JqTcOjOn7gEpeC0JcRVPa
        http://open.spotify.com/track/4pQIl2gJyRDKiwIhEOc1gW
        http://open.spotify.com/track/2rREB1sRvcb5i6AZRhOhey
        http://open.spotify.com/track/6UOvd5f3oyfIGW3GA8dn89

2. Download songs. Errors will appear in red (eg, when a song is not found)

        $ spotify-to-mp3 < songs.txt

## TODO

- Get best song on Grooveshark
  - Best matching artist, title and length
  - Best quality
- Consider multiple artists songs
- Show download progress
- Estimated download time
  - Per song
  - Total
