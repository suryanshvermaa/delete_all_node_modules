#!/bin/bash
function delete_node_modules {
    filesArr=$(ls)
    if [ "$filesArr" = "" ];
    then
        cd ..
        return
    else 
        for item in $filesArr; do
        if [ $item = "node_modules" ]
        then
            echo "deleting node_modules in dir $(pwd)"
            rm -r node_modules
        elif [ -d $item ];
        then
            cd $item
            delete_node_modules
        else
            continue 
        fi
        done
        cd ..
    fi
}
cd $1
if [ "$1" != "" ];
then 
    delete_node_modules
else
    echo "please provide path"
fi

