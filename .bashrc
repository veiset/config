#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

# radeon gpu power management (laptop)
alias profilepm='sudo bash -c "echo profile > /sys/class/drm/card0/device/power_method"'
alias auto='profilepm && sudo bash -c "echo auto > /sys/class/drm/card0/device/power_profile"'
alias low='profilepm && sudo bash -c "echo low > /sys/class/drm/card0/device/power_profile"'
alias mid='profilepm && sudo bash -c "echo mid > /sys/class/drm/card0/device/power_profile"'
alias high='profilepm && sudo bash -c "echo high > /sys/class/drm/card0/device/power_profile"'
alias dynpm='sudo bash -c "echo dynpm > /sys/class/drm/card0/device/power_method"'
alias gpu=" cat /sys/kernel/debug/dri/0/radeon_pm_info /sys/class/drm/card0/device/power_method"

# FAST! WE HAVE NO TIME, GET ME TO <location>!!!
alias cgit="cd /home/vz/dev/git/"
alias cma="cd /home/vz/dev/git/master/"
alias cthe="cd /home/vz/dev/git/master/thesis"
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias p='python2'
alias p3='python3'

# pretty colors
alias ls='ls --color=auto'
alias egrep='egrep --color=auto'
alias grep='grep --color=auto'

# toggle keyboard layout with caps lock
alias caps="setxkbmap -layout \"us, no\" -option \"grp:caps_toggle\""

# PS1
function subLevel {
   pwd | grep -o '/' | wc -l
}

PS1='[\D{%H:%M} \u@\h:`subLevel` \W]\$ '

# auto complete
complete -cf sudo
complete -cf man

# editor
EDITOR=vim ; export EDITOR

# watch a folder for changes and execute a command, eg:
# watchstuff test/ py.test -v test/
watchdir() {
    while true; do
        change=$(inotifywait -e close_write,moved_to,create $1)
        clear
        ${*:2}
    done
}
watchtests() { 
    watchdir test/ py.test -v test/ 
}

