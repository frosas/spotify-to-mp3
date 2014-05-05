# Spotify to MP3

A simple command line utility to download MP3 files of Spotify tracks

## Installation

### Mac OS X (Snow Leopard & Lion)

```bash
$ sudo gem install spotify-to-mp3
```

Probably `sudo` can be ommited if using [rvm](http://beginrescueend.com/) or similar.

### Linux (Ubuntu 12.10 / 13.10)

Make sure you have rubygems installed and configured:

```bash
$ sudo apt-get install rubygems1.9 ruby1.9.1-dev
$ echo 'PATH=$PATH:/var/lib/gems/1.9/bin' | sudo tee /etc/profile.d/rubygems1.9.sh >/dev/null
```

```bash
$ sudo gem install spotify-to-mp3
```

## Usage

1. Create a file (like `songs.txt`) and copy the Spotify songs URLs to it. Plain song names are also
   accepted. It will look like this:

        http://open.spotify.com/track/1JqTcOjOn7gEpeC0JcRVPa
        spotify:track:1fE3ddAlmjJ99IIfLgZjTy
        The Drums - Money

2. Download songs. They are saved to the current directory. Errors will appear in red (like when a song is not found).

    ```bash
    $ spotify-to-mp3 songs.txt
    ```

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

```bash
$ rspec
```

## TODO

- Consider multiple artists songs
- Filter Grooveshark results by artist, title and length
- Accept tracks from stdin (instead of from a file, to drag songs directly to the app)
- Exit with a single Ctrl+C
- Cleaner output
- Don't pick remixes
