#! /bin/bash

if [ -e /easy-storage-gaming/client/client.config ]
then
    echo -e '\e[32m' "Config Checked!"
else
    echo -e '\e[31m' "Config Not Found"



    title="Download New Config"
    prompt="Pick an branch: "
    options=("Main" "Pre-Release" "Beta" "Alpha")
    echo "$title"
    PS3="$prompt "
    select opt in "${options[@]}" "Quit"; do 

        case "$REPLY" in

        1 ) echo "You picked $opt which is version $REPLY"
            echo -e '\e[32m' "Downloading..."
            wget --directory-prefix=/easy-storage-gaming/client https://www.tyioline.net/download/main/client/client.config; exit;;

        2 ) echo "You picked $opt which is version $REPLY"
            echo -e '\e[32m' "Downloading..."
            wget --directory-prefix=/easy-storage-gaming/client https://www.tyioline.net/download/pre-release/client/client.config; exit;;

        3 ) echo "You picked $opt which is version $REPLY"
            echo -e '\e[32m' "Downloading..."
            wget --directory-prefix=/easy-storage-gaming/client https://www.tyioline.net/download/beta/client/client.config; exit;;

        4 ) echo "You picked $opt which is version $REPLY"
            echo -e '\e[32m' "Downloading..."
            wget --directory-prefix=/easy-storage-gaming/client https://www.tyioline.net/download/alpha/client/client.config; exit;;

        $(( ${#options[@]}+1 )) ) echo "Check Ended!"; break;;
        *) echo "Invalid option. Try another one.";continue;;

        esac

    done


    while opt=$(zenity --title="$title" --text="$prompt" --list \
                        --column="Options" "${options[@]}"); do

        case "$opt" in
        "${options[0]}" ) zenity --info --text="You picked $opt, version 0";;
        "${options[1]}" ) zenity --info --text="You picked $opt, version 0";;
        "${options[2]}" ) zenity --info --text="You picked $opt, version 0";;
        "${options[3]}" ) zenity --info --text="You picked $opt, version 0";;
        *) zenity --error --text="Invalid branch. Try another one.";;
        esac

done
fi
