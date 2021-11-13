# RegEx Reference Shell Script

## TODO List
- fix ```pcregrep```
- Figure out how to do ```[OPTION] ---- [description...]```  tab complete
- [x] Fix installer issues with path and sourcing

## Goals and Ideas
### Big goals

- Sortable category menu
- Have portable installer
- Create interactive mode

### Small goals

- Match categories dynamically using regex and output it into a file
- [x] Install the program like any other script
- Get user input filtering down with regex

### Current issues

- ```pcregrep``` is not executing properly in the regref_completion shell script to find the categories dynamically using regex.
- [x] ```$PATH``` for some reason not updating during install and gives ```permission``` denied with zsh and ```command not found``` with bash
