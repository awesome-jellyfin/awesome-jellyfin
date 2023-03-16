#!/bin/bash

# Author: u/ProductRockstar
# https://www.reddit.com/r/jellyfin/comments/11dgmp3/script_to_add_language_overlay_to_movie_poster/

MOVIES_DIR="/mnt_data/media/movies"
OVERLAY_DIR="/mnt_data/media"

while true 
do
  cd "$MOVIES_DIR"
  for dir in */; do
    cd "$MOVIES_DIR/$dir"
    pwd

    flink=$(readlink -f poster.jpg)
    creatortool=$( exiftool -f -s3 -"creatortool" "$flink" )

    if [ "${creatortool}" != "993" ]; then
      mlink=$(readlink -f *.mkv)
      langs=$( ffprobe "$mlink" -show_entries stream=index:stream_tags=language -select_streams a -v 0 -of json=c=1 | jq --raw-output '.streams[].tags.language')

      GER='ger'
      DUT='dut'

      case $langs in

        *"$DUT"*)
          widthposter=$( exiftool -f -s3 -"ImageWidth" "$flink" )
	        convert "$OVERLAY_DIR/dut_overlay.png" -resize "$widthposter" "$OVERLAY_DIR/dut_overlay_tmp.png"
	        convert  "$flink"  "$OVERLAY_DIR/dut_overlay_tmp.png" -flatten  "$flink"
	        chmod +644 "$flink"
	        chown nobody "$flink"
	        exiftool -creatortool="993" -overwrite_original "$flink"
          ;;

        *"$GER"*)
          widthposter=$( exiftool -f -s3 -"ImageWidth" "$flink" )
	        convert "$OVERLAY_DIR/ger_overlay.png" -resize "$widthposter" "$OVERLAY_DIR/ger_overlay_tmp.png"
	        convert  "$flink"  "$OVERLAY_DIR/ger_overlay_tmp.png" -flatten  "$flink"
	        chmod +644 "$flink"
	        chown nobody "$flink"
	        exiftool -creatortool="993" -overwrite_original "$flink"
          ;;
      esac

    fi
  done
  sleep 90000
done
