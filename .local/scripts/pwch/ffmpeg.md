## FFMPEG

### webcamming

ffmpeg -y -i /dev/video0 out.mkv

### determining available resolutions

xrandr

### find size and offset of particular window to capture

xwininfo

### find out which pulseaudio sound sources exist 

pactl list sources
to record, find the input source (not output)

### The entire ffmpeg command.

ffmpeg -video_size 1366x768 -framerate 25 -f x11grab -i :0.0 -f pulse -ac 2 -i 1 output.mkv -async 1 -vsync 1

+ video_size 1920×1080: Sets the size of the video capture. This is the value we used xrandr to find.
+ framerate 25: Sets the frames per second value.
+ f x11grab: Force the video format to a specific type. Here we’re setting the input format to the output of your X server.
+ i :0.0: This specifies the video input will come from the main screen.
+ f pulse: Sets the expected format to be PulseAudio.
+ ac 2: Set two audio channels
+ i 1: Take audio input from PulseAudio source #1. This is the value we used pactl to discover.
+ output.mkv: The name of the file we wish to create.
+ async 1: Set the audio sync method. This is a deprecated parameter, but we’re using it here to avoid error messages that can be ignored.
+ vsync 1: set the video sync method. This is a deprecated parameter, but we’re using it here to avoid error messages that can be ignored.

### Extract audio from video
ffmpeg -i sample.avi -q:a 0 -map a sample.mp3

### Capture only video, no audio
ffmpeg -video_size 1366x768 -framerate 25 -f x11grab -i :0.0 output.mkv -vsync 1

### Directory
If you don't specify a directory to save the video, it will be saved in the directory ffmpeg was launched from.

### Converting files
ffmpeg -i output.mkv output.mp4
general formula : ffmpeg -i output.oldformat output.wantedformat

### Add background music
ffmpeg -i arch-install.mp4  -i archinstall-soundtrack.mp4 -c copy -map 0:v:0 -map 1:a:0 output2.mp4

### concatenating files
create a list of files in a FILE
ex : filename
	file "file1_path"
	file2 "file1_path"
	file3 "file1_path"
run : ffmpeg -f concat -safe 0 -i /home/soimuen/Downloads/FILENAME -c copy output.webm
### cutting videos
ffmpeg -ss 00:01:00 -i input.mp4 -to 00:02:00 -c copy output.mp4

### Burning subs to video
NOTE: This solution "burns the subtitles" into the video, so that every viewer of the video will be forced to see them.

Use the libass library (make sure your ffmpeg install has the library in the configuration --enable-libass).

First convert the subtitles to .ass format:

ffmpeg -i subtitles.srt subtitles.ass
Then add them using a video filter:

ffmpeg -i mymovie.mp4 -vf ass=subtitles.ass mysubtitledmovie.mp4

### Info source
https://www.howtogeek.com/446706/how-to-create-a-screencast-on-linux/
ffmpeg.org
stackexchange
https://ostechnix.com/20-ffmpeg-commands-beginners/
https://wiki.archlinux.org/index.php/FFmpeg#Recording_webcam
