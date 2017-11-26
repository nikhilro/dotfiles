alias dev="cd /mnt/c/Users/nikhi/Documents/GitHub" 
alias hf="history | grep $1"

# {1} for filename
# {2} for some gcc command like -lm for math.h
runC(){
	gcc ${1} -std=c99 ${2} -o test 
	./test
	rm test
}

gitUpdate(){
	dev

	folders=( "CS137" "se101-f17-group-45" "RPS_Robot" "SE" "se101-notes" "dotfiles" ) 
	
	for i in "${folders[@]}"
	do
		cd $i
		printf "%s\n" "$i"
		git pull origin master
		git status
        	printf "\n";
		cd ..
	done

}

alias ls='command ls --human-readable --group-directories-first --color=auto -I NTUSER.DAT\* -I ntuser.dat\*'

alias subl='"/mnt/c/Program Files/Sublime Text 3/sublime_text.exe"'
alias code='"/mnt/c/Program Files/Microsoft VS Code/Code.exe"'

# Display ANSI 16 colors - doesn't work atm
printcolors () {
  for i in {0..15}; do
    printf "\x1b[48;5;%sm%3d\e[0m " "$i" "$i";
    if (( i == 15 )) || (( i > 15 )) && (( (i-15) % 6 == 0 )); then
      printf "\n";
    fi
  done
}
