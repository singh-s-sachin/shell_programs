echo "NAME : Muhammad Bin Omar, ID : S1703656 "
case "$1" in
-d)cd ~/trashCan
	rm ~/trashCan/*
	cd ~/
	rm Paths
	touch Paths
	cd ~/trashCan
	ls -1
	for line in `ls`
	do
	echo "Are you sure you want to permanently delete this file?" $line "Yes/No"
	read ans
	case "$ans" in
	Y|y|yes|Yes|YES) rm $line;;
	N|n|no|No|NO) echo "File still exist!";;
	esac
	done
	cd
	rm Paths
	touch Paths;;

-r)cd ~/trashCan
	restore=`grep $2 ~/Paths`
	filename=`basename "$restore"`
	echo "Where would you like to save this file?"
	read location
	location1=`readlink -f $location`
	mv -i $filename "$location1"/$filename;;
-t)du -ch ~/trashcan | grep total;;  
-l)cd ~/trashcan
	for line in *
	do
    echo "$line"
    stat -x ~/trashcan/$line |grep Size | grep FileType
	done;;
-m)gnome-terminal -title=Muhammad Bin Omar,S1703656;;
-k)-9 $PPID;;
*)echo "Are you sure you want to move this file to the TrashCan?" "(Yes/No)"
	read ans
	case "$ans" in
	Y|y|yes|Yes|YES)  mv "$1" "$HOME/trashCan";;
	N|n|no|No|NO) echo "File still exist";;
	esac
esac	