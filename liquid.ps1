
#######################################
# LIQUID PROMPT DEFAULT TEMPLATE FILE #
#######################################

# Available features:
# LP_BATT battery
# LP_LOAD load
# LP_JOBS screen sessions/running jobs/suspended jobs
# LP_USER user
# LP_HOST hostname
# LP_PERM a colon ":"
# LP_PWD current working directory
# LP_PROXY HTTP proxy
# LP_GIT git
# LP_HG mercurial
# LP_SVN subversion
# LP_ERR last error code
# LP_MARK prompt mark
# LP_TIME current time

# Remember that most features come with their corresponding colors,
# see the README.

# add jobs, load and battery
LP_PS1="${LP_TIME}${LP_BATT}${LP_LOAD}${LP_JOBS}"
# add user, host and permissions colon
LP_PS1="${LP_PS1}[${LP_USER}${LP_HOST}${LP_PERM}"

# if not root
if [[ "$EUID" -ne "0" ]]
then
    # path in foreground color
    LP_PS1="${LP_PS1}${LP_PWD}]${LP_PROXY}"
    # add VCS infos
    LP_PS1="${LP_PS1}${LP_GIT}${LP_HG}${LP_SVN}"
else
    # path in yellow
    LP_PS1="${LP_PS1}${LP_PWD}]${LP_PROXY}"
    # do not add VCS infos
fi
# add return code and prompt mark
LP_PS1="${LP_PS1}${LP_ERR}${LP_MARK}"

# vim: set et sts=4 sw=4 tw=120 ft=sh:
