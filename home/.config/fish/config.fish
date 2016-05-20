function fish_prompt --description 'Write out the prompt'
  # Just calculate these once, to save a few cycles when displaying the prompt
  if not set -q __fish_prompt_hostname
    # set -g __fish_prompt_hostname (hostname|cut -d . -f 1)
  end

  if not set -q __fish_prompt_normal
    set -g __fish_prompt_normal (set_color normal)
  end

  if not set -q __git_cb
    set __git_cb ":"(set_color brown)(git branch ^/dev/null | grep \* | sed 's/* //')(set_color normal)""
  end

  switch $USER
    case root

    if not set -q __fish_prompt_cwd
      if set -q fish_color_cwd_root
          set -g __fish_prompt_cwd (set_color $fish_color_cwd_root)
      else
          set -g __fish_prompt_cwd (set_color $fish_color_cwd)
      end
    end

    printf '%s%s%s%s# ' $__fish_prompt_hostname "$__fish_prompt_cwd" (prompt_pwd) "$__fish_prompt_normal" $__git_cb

    case '*'

    if not set -q __fish_prompt_cwd
      set -g __fish_prompt_cwd (set_color $fish_color_cwd)
    end

    printf '%s%s%s%s$ ' $__fish_prompt_hostname "$__fish_prompt_cwd" (prompt_pwd) "$__fish_prompt_normal" $__git_cb
  end
end

set -xU HOMEBREW_GITHUB_API_TOKEN 4934df65b4fcc095b3d1473ef5154d538c9a087b
set -xU EDITOR /usr/local/bin/vim
# set -U fish_user_paths /Users/senthil/.rvm/gems/ruby-2.2.1/bin $fish_user_paths /Users/senthil/.gobin /Users/senthil/o-ri /Users/senthil/work/klient-go/bin

set -x TERM xterm-256color

alias ls="ls --color=auto"
#alias git="kd run git"

# .envrc file
eval (direnv hook fish)

# go package manager
function gvm
  bass source ~/.gvm/scripts/gvm ';' gvm $argv
end
gvm use go1.4.3

##ruby package manager
#rvm default

## nvm package manager
#test -s /Users/senthil/.nvm-fish/nvm.fish; and source /Users/senthil/.nvm-fish/nvm.fish
# nvm use v0.10.10

set -x TERM xterm-256color

function clear
  command "clear"
  printf '\e[3J'
end
