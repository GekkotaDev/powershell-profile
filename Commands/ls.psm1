function Invoke-Eza {
    param (
        $Options
    )

    eza --git --git-repos --hyperlink --header --icons --long --time-style="+%h %m %Y %H:%M:%S" $Options
}