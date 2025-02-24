function canteen
    send-heartbeat "select random canteen"
    echo -e "桃李园一层\n桃李园二层\n桃李园三层\n紫荆园一层\n紫荆园二层\n紫荆园三层\n清青快餐\n澜园\n玉树园" \
        | sort -R | head -n 1
end
