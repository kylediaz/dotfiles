function dopamine
    if test "$status" = 0 # Exit code 0, OK
        set file /System/Library/Sounds/Glass.aiff
    else # Error
        set file /System/Library/Sounds/Sosumi.aiff
    end
    afplay $file &> /dev/null &
end
