function gitc --wraps=git\ branch\ \|\ fzf\ --preview\ \'git\ show\ --color=always\ \{-1\}\'\ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ --bind\ \'enter:become\(git\ checkout\ \{-1\}\)\'\ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ --height\ 40\%\ --layout\ reverse --description alias\ gitc=git\ branch\ \|\ fzf\ --preview\ \'git\ show\ --color=always\ \{-1\}\'\ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ --bind\ \'enter:become\(git\ checkout\ \{-1\}\)\'\ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ --height\ 40\%\ --layout\ reverse
  git branch | fzf --preview 'git show --color=always {-1}'                  --bind 'enter:become(git checkout {-1})'                  --height 40% --layout reverse $argv
        
end
