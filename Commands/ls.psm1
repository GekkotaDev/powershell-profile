function Invoke-Eza {
    param (
        $Options
    )

    eza --git --git-repos --group-directories-last --hyperlink --header --icons --long --time-style="+%h %m %Y %H:%M:%S" $Options
}