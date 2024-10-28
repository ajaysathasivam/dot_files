function fish_prompt -d "Write out the prompt"
    # This shows up as USER@HOST /home/user/ >, with the directory colored
    # $USER and $hostname are set by fish, so you can just use them
    # instead of using `whoami` and `hostname`
    printf '%s@%s %s%s%s > ' $USER $hostname \
        (set_color $fish_color_cwd) (prompt_pwd) (set_color normal)
end

if status is-interactive
    # Commands to run in interactive sessions can go here
    set fish_greeting

end

starship init fish | source
if test -f ~/.cache/ags/user/generated/terminal/sequences.txt
    cat ~/.cache/ags/user/generated/terminal/sequences.txt
end

alias pamcan=pacman

# function fish_prompt
#   set_color cyan; echo (pwd)
#   set_color green; echo '> '
# end

alias sublime="/opt/sublime_text/sublime_text"
alias update="sudo pacman -Syu"
alias updaterp="sudo pacman -Sy"
alias in="sudo pacman -Sy "
alias un="sudo pacman -Rns "
alias code="/usr/bin/vscodium"
alias 2b="cd ../../"
alias wget="wget -cO ($1) ($2)"
#export limit= /home/novo/.config/ags/scripts/hyprland/workspace_limit.sh
export BROWSER=zen-browser
alias d1="cd $HOME/Disk/B2"
#alias ls='ls --color=auto'
#alias la='ls -a'
#alias ll='ls -alFh'
alias l='ls --color=never'
alias l.="ls -A | egrep '^\.'"
alias listdir="ls -d */ > list"
#alias md='sudo mount /dev/sd${1:-sdb2} ~/Disk/B2/'
#alias ud='sudo mount /dev/sd${1:-sdb2} ~/Disk/B2/'
function md
    # Check for the -m (mount) and -u (unmount) options
    if test "$argv[1]" = "-m"
        set action "mount"
    else if test "$argv[1]" = "-u"
        set action "umount"
    else
        echo "Usage: md -m [device] to mount or md -u [device] to unmount"
        return
    end

    # Set the device with a default to "sdb2" if no second argument is provided
    set device "sd$argv[2]"
    # Check if the argument is empty and default to "sdb2" if it is
    if test -z "$argv[2]"
        set device "sdb2"
    end
    set path "$argv[3]/"
    if test -f "argv[3]"
        set path "B2/"
    end 
    # Perform the chosen action (mount or unmount)
    if test "$action" = "mount"
        sudo mount /dev/$device ~/Disk/$path/
    else if test "$action" = "umount"
        sudo umount /dev/$device 
    end
end

