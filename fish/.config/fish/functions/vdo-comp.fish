function vdo-comp
    if test (count $argv) -lt 1
        echo "Usage: vdo-comp <input_file>"
        return 1
    end
    set input_file $(realpath $argv[1])
    set output_file (string replace -r -- '\.([a-zA-Z0-9]+)$' '-compressed.mp4' $input_file)
    ffmpeg -y -i $input_file -c:v libx264 -preset slow -crf 21 -b:v 2M -maxrate 3M -bufsize 4M -c:a aac -b:a 96k -movflags +faststart $output_file
end
