function Remove-ItemUsingExplorer {
    param(
        [string]$target
    )

    $shell = New-Object -ComObject 'Shell.Application'
    $item = $shell.NameSpace(0).ParseName($target)

    ## fNoConfirmRecycle in SELLSTATE struct does NOT affect remote shares
    ## 他のウィンドウのボタンを自動的に押したい -VisualC++で作ったアプリ- C言語・C++・C# | 教えて!goo
    ## https://oshiete.goo.ne.jp/qa/3416508.html
    $item.InvokeVerb("delete")
}

Remove-ItemUsingExplorer z:\X
