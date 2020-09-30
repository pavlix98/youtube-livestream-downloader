VIDEO_NAME=$(youtube-dl --get-title https://www.youtube.com/watch?v=${1})
FILE_NAME=$(date +'%Y-%m-%d_%T')--${VIDEO_NAME// /_}

BEST_FORMAT=$(youtube-dl --list-formats https://www.youtube.com/watch?v=${1} | grep best | awk '{print $1}')

STREAM_URL=$(youtube-dl -f ${BEST_FORMAT} -g https://www.youtube.com/watch?v=${1})

ffmpeg -i ${STREAM_URL} -to ${2} ./files/${FILE_NAME}.mp4
