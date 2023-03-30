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
    bq show --project_id="$(cut -d '.' -f1 <<< "$1")" --format=json "$(cut -d '.' -f2-3 <<< "$1")"  | jq '.schema.fields'     
}

#Python venv
venv() {
    [[ "$VIRTUAL_ENV" == "" ]]; INVENV=$?
    if [[ $INVENV == 1 ]]; then
        echo "Deactivating virtualenv"
        deactivate
        return 0
    fi
    FILE=.venv/bin/activate
    if [[ -f $FILE ]]; then
        echo "Activating virtualenv"
        source $FILE
    else 
        REQ="requirements.txt"
        if [[ -f $REQ ]]; then
            python -m venv .venv
            source .venv/bin/activate
            pip install -r requirements.txt
            echo "Activating virtualenv"
        else
            echo "No requirements.txt file found"
        fi
    fi 
}

export PATH="$HOME/.poetry/bin:$PATH"

# add env_on_chdir to chpwd_functions
add-zsh-hook chpwd env_on_chdir
