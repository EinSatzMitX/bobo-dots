_: {
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
    border-color=#fabd2f
    progress-color=over #fe8019
    border-radius=5
    default-timeout=3000
    group-by=summary
    format=<span font="JetBrainsMono Nerd Font" weight="bold" foreground="#fe8019" size="15360">%s</span>\n<span size="8192">────────────────────────────────────────</span>\n<span font="JetBrainsMono Nerd Font" size="12288">%b</span>

    [grouped]
    format=<span font="JetBrainsMono Nerd Font" weight="bold" foreground="#fe8019" size="15360">%s</span>\n<span size="8192">────────────────────────────────────────</span>\n<span font="JetBrainsMono Nerd Font" size="12288">%b</span>

    [mode=do-not-disturb]
    invisible=1

  ''; # home-manager will handle it
}
