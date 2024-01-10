#!/bin/bash

files=".file1 .file2 .file3"

pushed_chg_files=""
for changed_file in ${files}; do
    if [ "${pushed_chg_files}" == "" ]; then
        pushed_chg_files="\\\"${changed_file}\\\""
    else
        pushed_chg_files="${pushed_chg_files}, \\\"${changed_file}\\\""
    fi
done
echo "pushed_chg_files=[${pushed_chg_files}]"