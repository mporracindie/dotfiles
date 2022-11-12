export LANG=en_US.UTF-8
alias ll='ls -lGh'
alias repos='cd /Users/marcodieguez/go/src/github.com/'
alias ports='lsof -i | grep LISTEN'
alias yarncheck="yarn && yarn clean && yarn build && yarn typecheck && yarn lint"
. "$HOME/.cargo/env"

alias reload='source ~/.profile'

#Docker
alias docker_rmi_dangling="docker rmi $(docker images -qa -f 'dangling=true')"

#Github
alias gco='git checkout'
alias gp='git pull'

#Terraform
alias tf='terraform'

#Terraspace
alias tsstatus="echo 'AWS_PROFILE:'$AWS_PROFILE ' TS_ENV:'$TS_ENV ' AWS_ACCOUNT_ID:'$AWS_ACCOUNT_ID"
alias ts="tsstatus ; sleep 1 ; terraspace"
alias tsp="ts plan"
alias tsu="ts up"
alias tsd="ts down"
alias tss="ts seed"
alias tsap="ts all plan"
alias tsau="ts all up"
alias tsad="ts all down"

#BigQuery
bqschema() {
    bq show --format=json "$1"  | jq '.schema.fields'     
}

export PATH="$HOME/.poetry/bin:$PATH"

# add env_on_chdir to chpwd_functions
add-zsh-hook chpwd env_on_chdir
