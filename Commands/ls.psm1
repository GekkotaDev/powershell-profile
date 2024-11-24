function Invoke-Eza {
    param (
        $Options
    )

    eza --git --git-repos --group-directories-last --hyperlink --header --icons --long --time-style="+%h %m %Y %I:%M:%S %p  " $Options
}