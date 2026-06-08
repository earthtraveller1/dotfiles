function prompt {
  $loc = $executionContext.SessionState.Path.CurrentLocation;

  # This is to make it so that the terminal knows where the shell is located
  $out = ""
  if ($loc.Provider.Name -eq "FileSystem") {
    $out += "$([char]27)]9;9;`"$($loc.ProviderPath)`"$([char]27)\"
  }

  # This is to format the prompt: in this case, \n is `n and \033 is `e
  $out += "`e[92m[$loc]`n`e[0m - > "
  return $out
}

function nvim {
    $old_title = $Host.UI.RawUI.WindowTitle
    $Host.UI.RawUI.WindowTitle = "Neovim"
    & "nvim.exe" $args
    $Host.UI.RawUI.WindowTitle = $old_title
}

#f45873b3-b655-43a6-b217-97c00aa0db58 PowerToys CommandNotFound module

Import-Module -Name Microsoft.WinGet.CommandNotFound
#f45873b3-b655-43a6-b217-97c00aa0db58

