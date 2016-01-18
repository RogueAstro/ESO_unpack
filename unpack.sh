# WARNING: it is highly recommended to create a backup of your downloaded data
# before using this script.

# WARNING: this script can create and remove large volumes of data. Make sure
# you have enough space in disk to account for *at least* double the amount
# of raw data you downloaded.

########################################

# Script description:

# You should have a directory structured like this:
# A folder containing all the data you downloaded, with a subfolder for each star
# or for each observation run (your criteria), like so:
# ESO_data > Star1, Star2, Star3...

# And for each subfolder, you should have fits files and tarballs
# StarX > *.fits, *.tar

# The actual reduced data is generally found inside the tarballs

for d in */ ; do

    # cd'ing to each subfolder
    cd $d
    
    # Optional: removes the fits files that are not reduced data
    #rm *.fits
    
    # Untar'ing the reduced data (if you use Mac OSX or if you get an error,
    # use the command without the option --force-local)
    ls *.tar |xargs -n1 tar --force-local -xvf
    #ls *.tar |xargs -n1 tar -xvf
    
    # Optional: removing the tarballs 
    #rm *.tar
    
    # Copying the data you want to the target subfolder
    # Example: the reduced 1d spectra are stored in the *s1d_A.fits files
    # WARNING: substitute "*s1d_A.fits" for whatever file you want to move
    # You can also substitute the '.' (dot at the end) for whatever target
    # subfolder you want. In the following line, we move it to the same folder
    # that corresponds to $d
    find . -name "*s1d_A.fits" -print0 | xargs -0 -I {} cp {} .
    
    # Recommended: remove the data that is not of your interest to save disk 
    # space
    rm - r data/
    
    # Optional: removing other stuff that you won't use
    #rm download*
    
    # cd'ing back to the ESO_data folder
    cd ..

done
