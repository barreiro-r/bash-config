#MY ALIAS

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias lt="ls  --color=always -alF --time-style=+\"%Y.%m.%d %H:%M:%S\" | sed 's/  */\t/g' | awk 'BEGIN{FS=OFS=\"\t\"} {if (\$1 != \"total\") {print \"\033[30m\"\$7\" \"\$8\" \"\$3\"\033[0m\",\$9}}' | grep -P -v '\033\[01;34m\.*\033\[[0-9]*m'"
alias l="lt | sort -nk2,2 | sort -nk1,1"  #sorted by modification date
alias lpb="l | sed 's/\x1b\[[0-9;]*m//g'" #black and white
alias .='cd ..'
alias myless='lzim'


alias today='date +%Y-%m-%d'
alias padtable='column -t -s$'"'"'\t'"'"
alias ft="TERM='screen-256color'"
alias tmux_rbarreiro="tmux -2 attach -t rbarreiro"
alias tmux_rbarreiro_create="tmux new -s rbarreiro"

#shortcuts
alias td="today"
alias rb="tmux_rbarreiro"

#functions
countcol(){
  awk 'BEGIN{OFS=FS="\t"}FNR==1{s="";for (i=1;i<=NF;i++){s=s"[" i "]" "\t"};print s}{print}' $1
}

lzim(){
  head $1 | countcol | padtable | less -S
}

wcl(){
  wc -l $* | sed 's/^\s*//' | awk '{OFS="\t";FS=" "}{print $2,$1}'
}

uniq_certo(){
  uniq -c $1 | sed -s 's/^  *//; s/ /\t/' | sed -E 's/^([0-9])*\t(.*)/\2\t\1/'
}
