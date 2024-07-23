export myname11="${BASH_SOURCE[0]##*/}" ;
q_pls1  "$myname11" ;
#
##----- SSHs ... :--------------------------------------------------
##-- ssh-agent autostart with login (for now only for this user !) , from arx https://wiki.archlinux.org/title/SSH_keys#SSH_agents :
if ! pgrep -u "$USER" ssh-agent > /dev/null; then
	ssh-agent  >|  "$XDG_RUNTIME_DIR/ssh-agent.env"  ##--/OR also with time-limit, eg one hour :   -t 1h
fi
: ${SSH_AUTH_SOCK:=""}   ##--just to be defined, if not already set for the agent !!
if [[ ! -f "$SSH_AUTH_SOCK" ]]; then
	source "$XDG_RUNTIME_DIR/ssh-agent.env" >/dev/null
fi
##------------------------------------------------------------------
#
q_ple1  "$myname11" ;


