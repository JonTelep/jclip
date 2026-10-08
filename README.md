# jclip

Clip a section of a YouTube or X video to an mp4 (or mp3) in one command.
Omit the timestamps to grab the whole video.

```
jclip <url> [<start> <end>] [--mp3]
jclip https://www.youtube.com/watch?v=9DlBcS70EEk 2:53 8:05
jclip https://x.com/SmashJT/status/2107933367694205275
jclip https://x.com/SmashJT/status/2107933367694205275 --mp3
```

Output lands in `~/Videos/` by default. Change it with `jclip --dir ~/Clips`
(saved to `~/.config/jclip/dir`); the `JCLIP_DIR` env var overrides both. The full
video is cached in `<dir>/.cache/` so further clips from the same video are instant.

## Scripting

`jclip` prints the final file path on stdout (progress goes to stderr) and exits
non-zero on failure, so it drops straight into other tools:

```
out=$(jclip "$url") && notify-send "Saved" "$out"
JCLIP_DIR=/tmp/clips jclip "$url" 0:05 0:15 --mp3
```

## Install

```
git clone https://github.com/jtelep/jclip && cd jclip && ./install.sh
```

Needs `yt-dlp` and `ffmpeg`; `install.sh` installs them via pacman/apt/brew if missing.
It symlinks `~/.local/bin/jclip` to the checkout, so `git pull` is the whole upgrade.
