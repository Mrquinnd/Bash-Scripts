#!/bin/bash
#Changelog, getting the first line
firstline=$(head -n 1 source/changelog.md)

#Splits this string into an array
read -a firstline <<< $splitfirstline

#gets the version number and print it to the terminal.
version=${splitfirstline[1]}
echo "You are building version" $version


echo 'Do you want to continue? (enter "1" for yes, "0" for no)'
#Get user input and assign it to versioncontinue
read $versioncontinue
if [ $versioncontinue -eq 1 ]
then
  echo 'OK'
else
  echo "Please come back when you are ready"
fi

#Iterating over files in the source directory and printing names to the terminal.
for filename in source/*
do
  echo $filename
done

if [ "$filename" == "source/secretinfo.md" ]
then
  echo "Not copying" $filename
else
  echo "Copying" $filename
  cp $filename build/.
fi

echo "Build version $version contains:"
ls

