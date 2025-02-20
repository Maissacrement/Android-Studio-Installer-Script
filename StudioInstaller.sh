#!/usr/bin/env bash

# Author: Let's FOSS
# Shell Script for Installing JDK, Android Studio & Creating Desktop Icon
# Github: https://github.com/letsfoss/Android-Studio-Installer-Script
# Android Studio Version: 4.1.2 on 25/01/2021

# Install JDK8
JDKInstall (){
	printf "Installing JDK8\n"
	printf "\n Enter your Password then Sit back and Relax\n"
	apt update -y
	apt install openjdk-8-jdk openjdk-8-jre -y
	printf "\n Setting Java Path Variable\n"
	export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64
	printf "\n Testing JAVA_HOME Path\n"
	echo $JAVA_HOME
	printf "\n Adding JAVA bin directory to the PATH variable\n"
	export PATH=$PATH:$JAVA_HOME/bin
	printf "\n Testing PATH Variable\n"
	echo $PATH
	printf "\n Testing Java Installation\n"
	java -version
}

# Download Android Studio
DownloadAndroidStudio (){
	echo "\n Downloading Android Studio \n"
	wget -c "https://redirector.gvt1.com/edgedl/android/studio/ide-zips/4.1.3.0/android-studio-ide-201.7199119-linux.tar.gz"
}

# Install Fastboot & ADB Tools
FastbootADB (){
	printf "\n Install ADB Tools \n"
	apt install android-tools-adb android-tools-fastboot -y
	printf "\n Done installing ADB Tools"
}

# Install Android Studio
InstallAndroidStudio (){
	echo "\n Installing Android Studio \n"
	tar -xzf android-studio-ide-201.7199119-linux.tar.gz -C /opt

	mkdir -p "$HOME"/.local/share/applications
	cat > "$HOME"/.local/share/applications/android-studio.desktop <<-EOF
		[Desktop Entry]
		Version=4.1.3
		Type=Application
		Name=Android Studio
		Exec="/opt/android-studio/bin/studio.sh" %f
		Icon=/opt/android-studio/bin/studio.png
		Categories=Development;IDE;
		Terminal=false
		StartupNotify=true
		StartupWMClass=android-studio
	EOF

    chmod +x "$HOME"/.local/share/applications/android-studio.desktop

	echo "\n Installing Finished \n"
	rm -rf android-studio*
	rm -rf StudioInstaller.sh
}

JDKInstall
FastbootADB
DownloadAndroidStudio
InstallAndroidStudio
