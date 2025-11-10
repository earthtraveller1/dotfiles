# config.nu
#
# Installed by:
# version = "0.108.0"
#
# This file is used to override default Nushell settings, define
# (or import) custom commands, or run any other startup tasks.
# See https://www.nushell.sh/book/configuration.html
#
# Nushell sets "sensible defaults" for most configuration settings, 
# so your `config.nu` only needs to override these defaults if desired.
#
# You can open this file in your default editor using:
#     config nu
#
# You can also pretty-print and page through the documentation for configuration
# options using:
#     config nu --doc | nu-highlight | less -R

mkdir ($nu.data-dir | path join "vendor/autoload")
starship init nu | save -f ($nu.data-dir | path join "vendor/autoload/starship.nu")

$env.config.edit_mode = 'vi'
$env.config.show_banner = false

$env.PATH ++= ["~/.local/bin"]

def project_names [] {
    ls --short-names $"($env.HOME)/projects" | get name
}

def projects [name: string@project_names] {
    cd $"($env.HOME)/projects/($name)"
    zellij attach --create $name
}

def windocs_names [] {
    ls --short-names $"($env.HOME)/windowshome/OneDrive/Documents" | get name
}

def windocs [name: string@windocs_names] {
    cd $"($env.HOME)/windowshome/OneDrive/Documents/($name)"
    zellij attach --create $name
}
