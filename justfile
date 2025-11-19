ROOT_DIR := `pwd`
export SOPS_AGE_KEY_FILE := ROOT_DIR + "/.secrets/age.agekey"
AGE_PUB_KEY := shell("grep '^# public key:' $1 | cut -d' ' -f4", SOPS_AGE_KEY_FILE)

default:
    @just --list

alias e := encrypt
# Encrypt FILE in place
[no-cd]
encrypt *ARGS:
    @sops --age={{AGE_PUB_KEY}} \
      --encrypt \
      --encrypted-regex '^(data|stringData)$' \
      {{ARGS}}

alias d := decrypt
# Decrypt FILE in place
[no-cd]
decrypt *ARGS:
    @sops --decrypt {{ARGS}}

[no-cd]
gen-key:
    @tr -dc A-Za-z0-9 </dev/urandom | head -c 32; echo -n
