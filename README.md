# dotfiles
A repo to backup all the dot files on my system

## Cheatsheets/Shortcuts
* `F11` - Fullscreen
* [WSL/Windows Subsystem for Linux/Bash on Ubuntu on Windows Keyboard Shortcuts](https://technet.microsoft.com/library/mt427362.aspx)
  * `Alt + Enter` for fullscreen
* [VSCode Cheatsheet](https://code.visualstudio.com/shortcuts/keyboard-shortcuts-windows.pdf)
  * `Ctrl + Shift + P` for Command Palette
  * `Ctrl + K V` for [Markdown Preview](https://code.visualstudio.com/docs/languages/markdown#_markdown-preview)
  * `Ctrl + K Z` for Zen Mode
  * `Ctrl + P` to search files
* [Hyper Keyboard Shortcuts](https://github.com/iamstarkov/hyper-keymap/blob/master/src/default-keymap.js)
  * `Ctrl + Shift + T` for new tabs
  * `Ctrl + Tab` for navgating through tabs
  * `Ctrl + Shift + D`  to split a tabs horizontally and ` + E` for vertically
  * `Ctrl + PgDown/PgUp` to navigate through panes

## Tips/Easter Eggs
* Use `bash -c "[replace with command]"` to run bash commands from Run *(Win+R)*
* Use `Chrome.exe --app={link}` in Run (`Win+R`) to get a minimal view of the website
* `:help42` in vim
* `apt-get moo`
* sudo apt-get install sl

## Getting to my current configuration
* Install Bash on Windows, Zsh in bash, Hyper and VSCode
  * Remember to hide old repos in local GitHub folder by [changing workspace setting](https://code.visualstudio.com/docs/getstarted/settings) 
    * Hidden rn:
      ```
      "files.exclude": {
          "**/.git": true,
          "**/.svn": true,
          "**/.hg": true,
          "**/CVS": true,
          "**/.DS_Store": true,
          "**/.vscode": true,
          "**/DevCircleTorontoHackathon-master": true,
          "**/Grade12_Assignments": true,
          "**/hungr.ai": true,
          "**/MessengerBotsHackathon": true,
          "**/mrgoose": true,
          "**/hyperzsh": true,
          "**/solarized": true,
          "**/wsl-terminal": true,
      }
      ```
* Set up aliases in Bash and [use the same file for Zsh](https://askubuntu.com/questions/31216/setting-up-aliases-in-zsh)
* [Current Theme for Hyper: hyper-adventure-time](https://www.npmjs.com/package/hyper-adventure-time)
* [Current Theme for Zsh: Hyperzsh](https://www.npmjs.com/package/hyperzsh). Make edits in `GitHub\hyperzsh\hyperzsh.zsh-theme`
* [Set up `.git/config` properly](https://stackoverflow.com/questions/7773181/git-keeps-prompting-me-for-password). Or use Post Git based on powershell
  * Use `ssh://git@github.com/username/repo.git` instead `https://github.com/username/repo.git`
* Edit file `.hyper.js` in `c/users/{username}` and add local plugins in `c/users/{username}/.hyper_plugins`
* Plugins installed in Hyper so far:
   ```
    'hyper-adventure-time',
    //'hyper-dracula',
    'hyper-dark-scrollbar',
    // 'hyper-pane',
    // 'hyper-hover-header',
    // need a "," add a new plugin on the next line
    //`hyperterm-mactabs`
    //'hyper-statusline',
    //'hyper-tabs-enhanced'
    //'hyperline',
    //'hyperterm-alternatescroll',
    //'hyperlinks',
    //'hyperterm-tabs'
    ```
  * Suggestion: Download the source repo and add it as local plugin for additional customization 
* Extensions installed on VSCode
  * mostly recommended ones
  * add one for pdf viewing
  
## Common Fixes
 * Forcing Git to overwrite local changes:
    ```
    git fetch --all
    git reset --hard origin/<branch_name>
    ```
    * Alternatively, save your current local commits by creating a branch from `master` before resetting
      ```
      git checkout master
      git branch new-branch-to-save-current-commits
      git fetch --all
      git reset --hard origin/master
      ```
    * [Stackflow answer link](https://stackoverflow.com/questions/1125968/how-do-i-force-git-pull-to-overwrite-local-files)
## Links
* http://www.math.uwaterloo.ca/~snew/
* https://www.student.cs.uwaterloo.ca/~cs137/
* https://uwaterloo.ca/student-success/drop-in-tutoring
* https://piazza.com/class/j5shypk5r0g1fr?cid=6
* https://marmoset.student.cs.uwaterloo.ca/
* https://learn.uwaterloo.ca/d2l/home
* https://portal.office.com
* https://portal.uwaterloo.ca 
* https://repl.it/
* http://www.macmillanhighered.com/launchpad/calculuset3e/6503070#/start
* [seadvisor.uwaterloo.ca](https://cambridge.uwaterloo.ca/advisor/AdvisorServlet;jsessionid=3B4FD9685B0CCFB5A3562777CB9C17C9)
* [To visualize programs](http://pythontutor.com/c.html#mode=edit)

