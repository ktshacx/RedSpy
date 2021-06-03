#!/system/bin/sh
#====================
# color variables
red="\e[0;31m"
green="\e[0;32m"
off="\e[0;0m"
yellow="\e[0;33m"

# main functions
function banner() {
    clear
    echo "$red"
    cat banner.txt
    echo "$off"
}

# os install functions
function termux(){
    echo -e "$red [$green+$red]$yellow Installing Python ...$off";
    apt-get install python -y
    apt-get install nmap -y
    echo -e "$red [$green+$red]$yellow Installing Requirements ...$off";
    pip install -r requirements.txt
    echo -e "$red [$green+$red]$yellow Checking Directories ...$off";
    if [ -e "/data/data/com.termux/files/usr/share/RedSpy" ]; then
        echo -e "$red [$green+$red]$yellow Previous installation found ! Do you want to replace it? [$green y$yellow/$red n$yellow]"
        read replace
        if [ "$replace" == "y" ] || [ "$replace" == "Y" || [ -z "$replace"];then
        rm -r "/data/data/com.termux/files/usr/share/RedSpy"
        rm "/data/data/com.termux/files/usr/bin/RedSpy"
        else
        echo -e "$red[$green✘$red]$yellow If you want to install you must remove the previous installation$off"
        echo -e "$red[$green✘$red] Installation Failed$off"
        exit
        fi
        fi
    echo -e "$red[$green+$red]$yellow Installing ...$off"
    mkdir "/data/data/com.termux/files/usr/share/RedSpy"
    cp "RedSpy.py" "/data/data/com.termux/files/usr/share/RedSpy"
    cp "install.sh" "/data/data/com.termux/files/usr/share/RedSpy"
    cp "reqirements.txt" "/data/data/com.termux/files/usr/share/RedSpy"
    cp "banner.txt" "/data/data/com.termux/files/usr/share/RedSpy"
    echo "#!/data/data/com.termux/files/usr/bin/bash 
python3 /data/data/com.termux/files/usr/share/RedSpy/RedSpy.py" '${1+"$@"}' > "RedSpy";
cp "RedSpy" "/data/data/com.termux/files/usr/bin"
chmod +x "/data/data/com.termux/files/usr/bin/RedSpy"
rm RedSpy
if [ -d "/data/data/com.termux/files/usr/share/RedSpy" ] ;
then
echo -e "$red [$green+$red]$yellow Tool successfully installed and will start in 5s!$off";
echo -e "$red [$green+$red]$yellow You can execute tool by typing DNA-recon$off"
sleep 5;
RedSpy
else
echo -e "$red [$green✘$red]$yellow Tool Cannot Be Installed On Your System! Use It As Portable !$off";
    exit
fi
}

function linux(){
    echo -e "$red [$green+$red]$yellow Installing Python ...$off";
    sudo apt-get install -y python
    echo -e "$red [$green+$red]$yellow Installing Requirements ...$off";
    pip3 install -r requirements.txt
    echo -e "$red [$green+$red]$yellow Checking Directories ...$off";
    if [ -d "/usr/share/RedSpy" ]; then
        echo -e "$red [$green+$red]$yellow Previous installation found ! Do you want to replace it? [$green y$yellow/$red n$yellow]"
        read replace
        if [ "$replace" == "y"];then
        sudo rm -r "/usr/share/RedSpy"
        sudo rm "/usr/share/icons/redspy_logo.png"
        sudo rm "/usr/share/applications/RedSpy.desktop"
        sudo rm "/usr/local/bin/RedSpy"
        else
        echo -e "$red[$green✘$red]$yellow If you want to install you must remove the previous installation$off"
        echo -e "$red[$green✘$red] Installation Failed$off"
        exit
        fi
        fi
    echo -e "$red[$green+$red]$yellow Installing ...$off"
    mkdir "/usr/share/RedSpy"
    sudo cp "RedSpy.py" "/usr/share/RedSpy"
    sudo cp "install.sh" "/usr/share/RedSpy"
    sudo cp "RedSpy.desktop" "/usr/share/applications"
    sudo cp "redspy_logo.png" "/usr/share/icons"
    sudo cp "reqirements.txt" "/usr/share/RedSpy"
    sudo cp "banner.txt" "/usr/share/RedSpy"
    echo "#!/usr/bin/bash 
python3 /usr/share/RedSpy/RedSpy.py" '${1+"$@"}' > "RedSpy";
sudo cp "RedSpy" "/usr/local/bin"
chmod +x "/usr/bin/RedSpy"
rm RedSpy
if [ -d "/usr/share/RedSpy" ] ;
then
echo -e "$red [$green+$red]$yellow Tool successfully installed and will start in 5s!$off";
echo -e "$red [$green+$red]$yellow You can execute tool by typing DNA-recon$off"
sleep 5;
RedSpy
else
echo -e "$red [$green✘$red]$yellow Tool Cannot Be Installed On Your System! Use It As Portable !$off";
    exit
fi
}
if [ -d "/data/data/com.termux/files/usr/" ]; then
banner
echo -e "$red [$green+$red]$yellow RedSpy Will Be Installed In Your System$off";
termux
elif [ -d "/usr/bin/" ];then
banner
echo -e "$red [$green+$red]$yellow RedSpy Will Be Installed In Your System$off";
linux
else
echo -e "$red [$green✘$red]$yellow Tool Cannot Be Installed On Your System! Use It As Portable !$off";
    exit
fi
