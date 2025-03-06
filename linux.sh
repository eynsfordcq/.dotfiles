# brew
BREW_PREFIX="/home/linuxbrew/.linuxbrew"
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

# alias
alias dcl='docker compose logs -f'

# functions
run_watchtower() {
    docker run --rm \
    -v /var/run/docker.sock:/var/run/docker.sock \
    containrrr/watchtower \
    --run-once
}