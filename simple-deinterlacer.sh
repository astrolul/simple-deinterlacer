#!/usr/bin/env bash

options=("Auto Detect Field Order" "Deinterlace Top Field First" "Deinterlace Bottom Field First" "Exit Program")
video_file=$1
PS3="> "

if [ -z "$video_file" ]; then
    echo "No Video File Provided"
    exit 1
fi

echo "Please select a Field Order:"
select choice in "${options[@]}"
do
    case $choice in
        "Auto Detect Field Order")
            ffmpeg -hide_banner -i "$video_file" -vf yadif=parity=auto:mode=send_frame -crf 0 -c:a copy 'deinterlaced.mkv'
            exit
            ;;
        "Deinterlace Top Field First")
            ffmpeg -hide_banner -i "$video_file" -vf yadif=parity=tff:mode=send_frame -crf 0 -c:a copy 'deinterlaced.mkv'
            exit
            ;;
        "Deinterlace Bottom Field First")
            ffmpeg -hide_banner -i "$video_file" -vf yadif=parity=bff:mode=send_frame -crf 0 -c:a copy 'deinterlaced.mkv'
            exit
            ;;
        "Exit Program")
            break
            ;;
        *) 
            echo "Invalid Option Selected"
            ;;
    esac
done