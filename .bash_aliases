alias 2b='cd ~/github/SE/2B'
alias cs246e='cd ~/github/SE/2A/CS246E/cs246e/1189'
alias cs='cd ~/Github/SE/2B/CS247'
alias se='cd ~/Github/SE/2A/SE212'
alias spcom='cd ~/Github/SE/SPCOM223'
alias chem='cd ~/Github/SE/2A/CHE102'
alias ece='cd ~/Github/SE/2A/ECE222'
alias job='cd ~/Github/SE/2A/JobSearch'
alias stat='cd ~/Github/SE/2A/STAT206'
alias smf='cd ~/Github/SE/2A/SMF213'
alias dcp='cd ~/github/daily-coding-problem'

backup(){
	mkdir -p ./sensitive/pgp 
	cd sensitive/pgp
	gpg --armor --export > pgp-public-keys.asc
	gpg --armor --export > pgg-private-keys.asc
	gpg --export-ownertrust > pgp-ownertrust.asc
	cd ../..

	sudo cp -rf ~/.ssh/. ./sensitive/ssh
	
	mkdir -p ./sensitive/bash
	sudo cp -f ~/.bash_aliases ./sensitive/bash

	sudo cp -rf /etc/NetworkManager/system-connections/. ./sensitive/wifi

	sudo zip -r linux-system-backup.zip sensitive/.

	sudo rm -rf sensitive
}

restore(){
	unzip -o linux-system-backup.zip
	sudo cp -rf ./ssh/. ~/.ssh
	sudo chmod 600 ~/.ssh/{id_rsa,environment}	

	gpg --import pgp-public-keys.asc
	gpg --import ppg-private-keys.asc
	gpg --import-ownertrust pgp-ownertrust.asc

	sudo cp -f ./bash/.bash_aliases ~

	sudo stop network-manager
	sudo cp -rf ./wifi/. /etc/NetworkManager/system-connections
	export MAC=$(iw dev | grep addr | awk '{print $2}')
	sudo perl -i.bak -pe  's/^(mac-address=)(.*)/$1$ENV{MAC}/' /etc/NetworkManager/system-connections/*
	sudo chown root.root /etc/NetworkManager/system-connections/*
	sudo start network-manager
}


cdls(){
	cd $1 && ls
}

copy(){
	cat $1 | xclip -selection clipboard
}

parallel_commands(){
	for cmd in "$@"; do {
  		echo "Process \"$cmd\" started";
  		$cmd & pid=$!
  		PID_LIST+=" $pid";
	} done

	trap "kill $PID_LIST" SIGINT

	echo "Parallel processes have started";

	wait $PID_LIST

	echo
	echo "All processes have completed";
}

get-cs246e() {
	ssh -Y nkgupta@linux.student.cs.uwaterloo.ca "cd ~/cs246e/1189 && git pull"
	rsync -ave ssh --exclude=1189/.git nkgupta@linux.student.cs.uwaterloo.ca:~/cs246e /home/nikhil/Github/SE/2A/CS246E/
}

get-cs247() {
	ssh -Y nkgupta@linux.student.cs.uwaterloo.ca "cd ~/1195 && git pull"
	rsync --update -ave ssh --exclude=.git nkgupta@linux.student.cs.uwaterloo.ca:~/1195 ~/github/SE/2b/cs247
}

tmnt-start-services() {
	sudo systemctl start nginx
	sudo systemctl start mongodb
	sudo systemctl start redis
	docker start neo4j
	nvm use tmnt
}

tmnt-start() {
    # Start services
    sudo systemctl start nginx
    sudo systemctl start mongodb
    sudo systemctl start redis
    docker start neo4j
    nvm use tmnt

    TMNT_DIR=~/Github/tmnt

    # Concurrently run client and server
    cd $TMNT_DIR
    concurrently "yarn start-server" "yarn start-client"
}

tmnt-stop() {
    docker stop neo4j
    sudo systemctl stop mongodb
    sudo systemctl stop redis
    sudo systemctl stop nginx
    nvm use default
}

ppa-list() {
#! /bin/sh
# Script to get all the PPA installed on a system
for APT in `find /etc/apt/ -name \*.list`; do
    grep -Po "(?<=^deb\s).*?(?=#|$)" $APT | while read ENTRY ; do
        HOST=`echo $ENTRY | cut -d/ -f3`
        USER=`echo $ENTRY | cut -d/ -f4`
        PPA=`echo $ENTRY | cut -d/ -f5`
        #echo sudo apt-add-repository ppa:$USER/$PPA
        if [ "ppa.launchpad.net" = "$HOST" ]; then
            echo sudo apt-add-repository ppa:$USER/$PPA
        else
            echo sudo apt-add-repository \'${ENTRY}\'
        fi
    done
done
}

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

gitconfig() {
	git config user.name "Nikhil Gupta"
	git config user.email "niks.gupta09@gmail.com"
	git config user.signingkey 6A2350A4708CD1E5
}
