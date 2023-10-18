#!/usr/bin/env bash

options=("Auto Detect Field Order" "Deinterlace Top Field First" "Deinterlace Bottom Field First" "Auto Detect Field Order (ffplay)" "Deinterlace Top Field First (ffplay)" "Deinterlace Bottom Field First (ffplay)" "Exit Program")
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
            ffmpeg -hide_banner -i "$video_file" -vf "yadif=1" -c:v ffv1 -map 0:a -map 0:v -c:a copy 'deinterlaced.mkv'
            exit
            ;;
        "Deinterlace Top Field First")
            ffmpeg -hide_banner -i "$video_file" -vf "yadif=1:parity=tff" -c:v ffv1 -map 0:a -map 0:v -c:a copy 'deinterlaced.mkv'
            exit
            ;;
        "Deinterlace Bottom Field First")
            ffmpeg -hide_banner -i "$video_file" -vf "yadif=1:parity=bff" -c:v ffv1 -map 0:a -map 0:v -c:a copy 'deinterlaced.mkv'
            exit
            ;;
        "Auto Detect Field Order (ffplay)")
            ffplay -hide_banner -i "$video_file" -vf "yadif=1"
            exit
            ;;
        "Deinterlace Top Field First (ffplay)")
            ffplay -hide_banner -i "$video_file" -vf "yadif=1:parity=tff"
            exit
            ;;
        "Deinterlace Bottom Field First (ffplay)")
            ffplay -hide_banner -i "$video_file" -vf "yadif=1:parity=bff"
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
