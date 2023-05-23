#!
tput civis

Green='\033[0;32m'        # Green
Yellow='\033[0;33m'       # Yellow
Red='\033[0;31m'          # Red
Cyan='\033[0;36m'         # Cyan
Color_Off='\033[0m'       # Text Reset

Folders=$(ls)
clear
Script_Path=$PWD

for folder in ${Folders[@]}
do
    if [[ -d $folder ]]
    then
      #Set repo path, display it and enter to that location
      path=$PWD/$folder
      echo -e -n $Cyan$folder$Color_Off
      cd $path

      #Get status of repo
      Repo_Status=$( sudo git status )

      #Verify if repo is correctly updated
      if echo $Repo_Status  | grep -q "limpio"
      then
        echo -e -n '\t'$Green"OK"$Color_Off
      else
        echo -e -n '\t'$Yellow"Fail"$Color_Off
      fi

      #Verify if there is a fatal issue at repo
      if echo $Repo_Status  | grep -q "fatal"
      then
        echo -e $Red ": Fatal"
      else
        echo
      fi

      #Back to original path
      cd $Script_Path
    fi
done

tput cnorm
