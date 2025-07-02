function ytdla --wraps='yt-dlp -f bestaudio --extract-audio --audio-format mp3' --description 'alias ytdla=yt-dlp -f bestaudio --extract-audio --audio-format mp3'
  yt-dlp -f bestaudio --extract-audio --audio-format mp3 $argv
        
end
