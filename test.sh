#!/bin/bash
function create {
    for(( i=1; i<=10; i++ ));
    do
        mkdir dir$i
    done

    for(( i=1; i<=10; i++ ));
    do
        cd dir$i
        mkdir node_modules
        mkdir tmp$i
        mkdir file
        mkdir file/node_modules
        echo "temp file for dir$i" >> temp_file_$i.txt
        echo "this is content of node_modules file$i" >> node_modules/file_content$1.txt
        cd ..
    done

}
function destroy {
    for(( i=1; i<=10; i++ ));
    do
        rm -r dir$i
    done
    
}
if [ $1 = "create" ]; 
then
    echo "creating the testing environment!!!"
    create
elif [ $1 = "destroy" ];
then
    echo "destroying the testing environment!!!"
    destroy
else
    echo "invalid command!!!"
fi