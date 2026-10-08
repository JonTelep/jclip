# jclip

Clip a section of a YouTube or X video to an mp4 (or mp3) in one command.
Omit the timestamps to grab the whole video.

```
jclip <url> [<start> <end>] [--mp3]
jclip https://www.youtube.com/watch?v=9DlBcS70EEk 2:53 8:05
jclip https://x.com/SmashJT/status/2107933367694205275
jclip https://x.com/SmashJT/status/2107933367694205275 --mp3
```

Output lands in `~/Videos/jclip/` (override with `JCLIP_DIR`). The full video is
cached in `~/Videos/jclip/.cache/` so further clips from the same video are instant.

## Install

```
git clone https://github.com/jtelep/jclip && cd jclip && ./install.sh
```

Needs `yt-dlp` and `ffmpeg`; `install.sh` installs them via pacman/apt/brew if missing.
