# jclip

Clip a section of a YouTube or X/Twitter video to mp4 or mp3 in one command.

```
jclip https://www.youtube.com/watch?v=9DlBcS70EEk 2:53 8:05
```

That's it. The clip lands in `~/Videos/`.

<!-- demo: replace with your video link or gif -->
[▶ Watch the demo](https://github.com/JonTelep/jclip)

## Install

Requires `yt-dlp` and `ffmpeg`. Install them for your OS, then grab the script.

| OS | Dependencies |
|----|--------------|
| macOS | `brew install yt-dlp ffmpeg` |
| Arch | `sudo pacman -S yt-dlp ffmpeg` |
| Debian/Ubuntu | `sudo apt install yt-dlp ffmpeg` |
| Windows | Use [WSL](https://learn.microsoft.com/windows/wsl/install), then follow the Linux steps |

```
curl -fsSL https://raw.githubusercontent.com/JonTelep/jclip/main/jclip -o ~/.local/bin/jclip && chmod +x ~/.local/bin/jclip
```

Make sure `~/.local/bin` is on your `PATH`.

**Or clone it** (upgrade with `git pull`):

```
git clone https://github.com/JonTelep/jclip && cd jclip && ./install.sh
```

`install.sh` installs the dependencies via pacman/apt/brew if missing and symlinks
`~/.local/bin/jclip` to the checkout.

## Usage

```
jclip <url> [<start> <end>] [--mp3]
jclip --dir <path>
```

```
jclip https://www.youtube.com/watch?v=9DlBcS70EEk 2:53 8:05   # clip to mp4
jclip https://www.youtube.com/watch?v=9DlBcS70EEk 2:53 8:05 --mp3
jclip https://x.com/SmashJT/status/2107933367694205275        # whole video
jclip https://x.com/SmashJT/status/2107933367694205275 --mp3  # whole video as mp3
```

Timestamps are anything ffmpeg accepts: `90`, `1:30`, `1:02:30`, `1:30.5`.

### Output directory

Default is `~/Videos/`. Change it permanently:

```
jclip --dir ~/Clips        # saved to ~/.config/jclip/dir
```

Or per invocation with `JCLIP_DIR=/tmp/clips jclip ...`. The env var wins over the config file.

The full video is cached in `<dir>/.cache/` so further clips from the same video are instant.
Delete that folder to reclaim space.

## Scripting

`jclip` prints the final file path on stdout (progress goes to stderr) and exits
non-zero on failure, so it composes with other tools:

```
out=$(jclip "$url") && notify-send "Saved" "$out"
JCLIP_DIR=/tmp/clips jclip "$url" 0:05 0:15 --mp3
```

## How it works

One bash script. `yt-dlp` downloads the best mp4+m4a once per video id; `ffmpeg`
cuts the section (re-encoding to H.264/AAC for frame-accurate edges, or to mp3 with `--mp3`).

## License

[MIT](LICENSE)
