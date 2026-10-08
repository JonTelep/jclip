# jclip

Clip a section of a YouTube or X video to an mp4 (or mp3) in one command.

```
jclip <youtube url> <start> <end> [--mp3]
jclip https://www.youtube.com/watch?v=9DlBcS70EEk 2:53 8:05
```

Output lands in `~/Videos/jclip/` (override with `JCLIP_DIR`). The full video is
cached in `~/Videos/jclip/.cache/` so further clips from the same video are instant.

## Install

```
git clone https://github.com/jtelep/jclip && cd jclip && ./install.sh
```

Needs `yt-dlp` and `ffmpeg`; `install.sh` installs them via pacman/apt/brew if missing.
