{...}: {
  home.file.".config/mako/config".text = ''
    layer=top
    markup=1
    anchor=top-right
    background-color=#2b2b2b
    text-color=#ebdbb2
    width=600
    height=1025
    max-icon-size=96
    icon-location=left
    margin=30,30,25
    padding=15,10,15
    border-size=2
    border-color=#83c07c
    progress-color=over #83c07c
    border-radius=25
    default-timeout=3000
    group-by=summary
    format=<span font="JetBrainsMono Nerd Font weight=325 Italic Bold" size="12288">%s</span>\n<span font="JetBrainsMono Nerd Font weight=325" size="12288">%b</span>

    [grouped]
    format=<span font="JetBrainsMono Nerd Font weight=325 Italic Bold" size="12288">%s</span>\n<span font="JetBrainsMono Nerd Font weight=325" size="12288">%b</span>

    [mode=do-not-disturb]
    invisible=1

  ''; # home-manager will handle it
}
