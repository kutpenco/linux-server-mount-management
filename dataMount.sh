#!/bin/bash
echo "Olá, "
whoami
echo "Autentique-se como SU para continuar:"
sudo whoami

PS3='Please enter your choice: '
options=("Mount" "Umount" "Only List" "Mounted Path" "Quit")
select opt in "${options[@]}"
do
    case $opt in
        "Mount")
            clear;
            echo "You chose choice $REPLY which is $opt"
            echo "Listing Mount Options"
            sudo fdisk -l /dev/sda;
            echo
            echo
            echo "Which one you wants to Unmont? Provides a Source Name SDA"
            read opt;
            echo
            if [ $opt = '' ]; then
             exit;
            else
             case $opt in
              sda1) echo "You chose Option SDA1"
               if [ -d "/home/ubuntu/HD01" ]
               then
                echo "Directory HD01 exists."
                sudo umount /home/ubuntu/HD01;
                sudo mount /dev/sda1 /home/ubuntu/HD01;
               else
                echo "Error: Directory HD01 does not exists. Creating..."
                mkdir /home/ubuntu/HD01;
                sudo mount /dev/sda1 /home/ubuntu/HD01;
               fi
               ;;
              sda2) echo "You chose Option SDA2"
               if [ -d "/home/ubuntu/HD02" ]
               then
                echo "Directory HD02 exists."
                sudo umount /home/ubuntu/HD02;
                sudo mount /dev/sda1 /home/ubuntu/HD02;
               else
                echo "Error: Directory HD02 does not exists. Creating"
                mkdir /home/ubuntu/HD02;
                sudo mount /dev/sda2 /home/ubuntu/HD02;
               fi
              ;;
              sda3) echo "You chose Option SDA3"
               if [ -d "/home/ubuntu/HD03" ]
               then
                echo "Directory HD03 exists."
                sudo umount /home/ubuntu/HD03;
                sudo mount /dev/sda1 /home/ubuntu/HD03;
               else
                echo "Error: Directory HD03 does not exists. Creating"
                mkdir /home/ubuntu/HD03;
                sudo mount /dev/sda3 /home/ubuntu/HD03;
               fi
              ;;
              sda4) echo "You chose Option SDA4"
               if [ -d "/home/ubuntu/HD04" ]
               then
                echo "Directory HD04 exists."
                sudo umount /home/ubuntu/HD04;
                sudo mount /dev/sda1 /home/ubuntu/HD04;
               else
                echo "Error: Directory HD04 does not exists. Creating"
                mkdir /home/ubuntu/HD04;
                sudo mount /dev/sda4 /home/ubuntu/HD04;
               fi
              ;;
              sda5) echo "You chose Option SDA5"
               if [ -d "/home/ubuntu/HD05" ]
               then
                echo "Directory HD05 exists."
                sudo umount /home/ubuntu/HD05;
                sudo mount /dev/sda1 /home/ubuntu/HD05;
               else
                echo "Error: Directory HD05 does not exists. Creating"
                mkdir /home/ubuntu/HD05;
                sudo mount /dev/sda5 /home/ubuntu/HD05;
               fi
              ;;
              *) echo "invalid option";;
              \n)exit;;
              x)exit;;
             esac
            fi
            ;;
        "Umount")
            clear;
            echo "You chose choice $REPLY which is $opt"
            echo "Listing Mounted Options"
            findmnt -S /dev/sda1;
            findmnt -S /dev/sda2;
            findmnt -S /dev/sda3;
            findmnt -S /dev/sda4;
            findmnt -S /dev/sda5;
            echo "Which one you wants to Unmont? Provides a Source Name or ALL"
            read opt;
            if [ $opt = '' ]; then
             exit;
            else
             case $opt in
              sda1) echo "You chose Option SDA1"
              sudo umount /home/ubuntu/HD01;
              rm -r /home/ubuntu/HD01;
              ;;
              sda2) echo "You chose Option SDA2"
              sudo umount /home/ubuntu/HD02;
              rm -r /home/ubuntu/HD02;
              ;;
              sda3) echo "You chose Option SDA3"
              sudo umount /home/ubuntu/HD03;
              rm -r /home/ubuntu/HD03;
              ;;
              sda4) echo "You chose Option SDA4"
              sudo umount /home/ubuntu/HD04;
              rm -r /home/ubuntu/HD04;
              ;;
              sda5) echo "You chose Option SDA4"
              sudo umount /home/ubuntu/HD05;
              rm -r /home/ubuntu/HD05;
              ;;
              all)
               sudo umount /home/ubuntu/HD01;
               rm -r /home/ubuntu/HD01;
               sudo umount /home/ubuntu/HD02;
               rm -r /home/ubuntu/HD02;
               sudo umount /home/ubuntu/HD03;
               rm -r /home/ubuntu/HD03;
               sudo umount /home/ubuntu/HD04;
               rm -r /home/ubuntu/HD04;
               sudo umount /home/ubuntu/HD05;
               rm -r /home/ubuntu/HD05;
              ;; 
              *) echo "invalid option";;
              \n)exit;;
              x)exit;;
             esac
            fi

            ;;
        "Only List")
            clear;
            echo "You chose choice $REPLY which is $opt"
            sudo fdisk -l /dev/sda;
            ;;
        "Mounted Path")
            clear;
            echo "Showing mounted Paths"
            findmnt -S /dev/sda1;
            findmnt -S /dev/sda2;
            findmnt -S /dev/sda3;
            findmnt -S /dev/sda4;
            findmnt -S /dev/sda5;
            ;;
        "Quit")
            break
            ;;
        *) echo "invalid option $REPLY";;
    esac
done
