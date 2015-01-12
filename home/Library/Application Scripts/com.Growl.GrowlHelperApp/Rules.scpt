using terms from application "Growl"
    on evaluate notification with notification

        -- Back-slashes are for escaping the first characters of arguments given to `terminal-notifer` (cf. issue #36).
        set title to "\\" & notification's note title
        set description to "\\" & notification's note description
        set appname to notification's app name
        try
            set appid to the id of application appname
        on error
            set appid to the id of application "Growl"
        end try

        -- Tell `terminal-notifier` to send notification.
        do shell script "/usr/local/bin/terminal-notifier -title " & quoted form of title ¬
            & " -message " & quoted form of description ¬
            & " -sender " & quoted form of appid

        -- Suppress further actions from Growl.
        return {display:none}

    end evaluate notification
end using terms from
