## Copy a file or directory by Windows Explorer
##
##

function Copy-ItemUsingExplorer {
    param(
        [string]$source,
        [string]$destination
    )

    $shell = New-Object -ComObject 'Shell.Application'
    $folder = $shell.NameSpace((gi $destination).FullName)
    ## 16: Respond with "Yes to All" for any dialog box that is displayed
    $folder.CopyHere((gi $source).FullName, 16)
}

$src = $Args[0]
$dst = $Args[1]

Copy-ItemUsingExplorer $src $dst
