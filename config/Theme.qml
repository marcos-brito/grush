pragma Singleton
import Quickshell

Singleton {
    // {# replace_in(`"`, data.wallpaper) #}
    readonly property string wallpaper: "/home/marcos-brito/Pictures/wallpapers/gruvbox.png"
    readonly property string font: "JetBrainsMono NFM Regular"
    readonly property string transparent: "#00000000"
    // {# replace_color(data.theme.base00) #}
    readonly property string base: "#141617"
    // {# replace_color(data.theme.base01) #}
    readonly property string overlay: "#1D2021"
    // {# replace_color(data.theme.base05) #}
    readonly property string text: "#D4BE98"
    // {# replace_color(data.theme.base04) #}
    readonly property string subtext: "#928374"
    // {# replace_color(data.theme.base0D) #}
    readonly property string highlight: "#7DAEA3"
    // {# replace_color(data.theme.base0A) #}
    readonly property string secondary: "#D8A657"
    // {# replace_color(data.theme.base08) #}
    readonly property string critical: "#EA6962"
}
