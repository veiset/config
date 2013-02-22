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

# toggle keyboard layout with caps lock
alias caps="setxkbmap -layout \"us, no\" -option \"grp:caps_toggle\""
