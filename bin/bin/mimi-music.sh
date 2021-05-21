#!/usr/bin/env bash

cmd="youtube-dl -q --extract-audio --audio-format mp3"

songs=(
  https://youtu.be/ZCW0tjlPgMU  # Al Martino        - To Each His Own
  https://youtu.be/ALXfCIhrHvk  # Nat King Cole     - Love Me As Though There Were No Tomorrow
  https://youtu.be/OXAN-0fKse0  # Louis Armstong    - La Vie en Rose
  https://youtu.be/OxahtnSAzgU  # Andy Williams     - Can't Take My Eyes Off You
  https://youtu.be/4G-YQA_bsOU  # Simon & Garfunkel - Bridge Over Troubled Water
  https://youtu.be/A3yCcXgbKrE  # Louis Armstrong   - What A Wonderful World
  https://youtu.be/xyHoohNyYkw  # Nat King Cole     - Smile
  https://youtu.be/qQzdAsjWGPg  # Frank Sinatra     - My Way
  https://youtu.be/MYGxF7i-ubQ  # Bill Nighy        - Will You Go, Lassie, Go
  https://youtu.be/ky0rO7pM3WI  # Sarah Brightman & Andrea Bocelli - Time To Say Goodbye
  https://youtu.be/0iAzMRKFX3c  # Bette Midler      - Wind Beneath My Wings
  https://youtu.be/lb-TL5BRlDE  # Kenny Rogers      - In The Sweet By and By
  https://youtu.be/hD8trthqWZE  # Ray Lynch         - Celestial Soda Pop
  https://youtu.be/B3XdXEJEI4E  # Elvis Prestley    - Amazing Grace
  https://youtu.be/z3ktiaNTJ2Q  # Dolly Parton      - From Here to the Moon & Back
  https://youtu.be/Rj_n-uiC7nc  # Anthem Lights     - Invitation Medley
  https://youtu.be/sGZDwxnjG1g  # Willie Nelson     - Stardust
  https://youtu.be/yAHYQpaT1cU  # James Taylor & Carole King - You've Got a Friend
  https://youtu.be/AqjlPVpLiYQ  # Paul Giamatti     - Hello It's Me
)

for i in "${songs[@]}"; do
  echo "Downloading & extracting $i..."
  $cmd $i
  echo "Done."
done
