#!/usr/bin/env bash
# Symlinks jclip into ~/.local/bin and installs deps if missing.
set -e
cd "$(dirname "$0")"
if ! command -v yt-dlp >/dev/null || ! command -v ffmpeg >/dev/null; then
  if command -v pacman >/dev/null; then sudo pacman -S --needed yt-dlp ffmpeg
  elif command -v apt >/dev/null; then sudo apt install -y yt-dlp ffmpeg
  elif command -v brew >/dev/null; then brew install yt-dlp ffmpeg
  else echo "install yt-dlp and ffmpeg, then re-run"; exit 1; fi
fi
mkdir -p ~/.local/bin && ln -sf "$PWD/jclip" ~/.local/bin/jclip
echo "installed: $(command -v jclip || echo "~/.local/bin/jclip (add ~/.local/bin to PATH)")"
