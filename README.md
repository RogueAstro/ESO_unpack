# ESO_unpack
Did you just download dozens of gigabytes of data from ESO's archive? This script can help you unpack the data and structure the files in an IRAF-friendly way.

Usage
----------

You should have your data downloaded and structured in the following way: a main folder (say, ESO_data) containing various subfolders (for instance, one subfolder for each star or observation run). Just copy the unpack.sh file and paste it inside the main folder (outside the subfolders), open it and make the changes necessary to achieve your goal (the comments in the script file will guide you), and run the script.

On Unix systems, you may need to give the script a permission to execute, read and write files. This can be done using a command such as: 

    chmod +rwx unpack.sh