# simple-deinterlacer

simple-deinterlacer is a simple bash script that will deinterlace any video file using ffmpeg.

## Dependencies
You will need to have `bash` and `ffmpeg` installed on your system for this to work.

## Usage
Simply run the script with a video file together like this:
```
$ ./script.sh example.vob
```
The script will then ask you which field order you would like to deinterlace the video with, you can check the field order of the video with a program like `mediainfo-gui`, but there is also a built-in auto detection option in the script.