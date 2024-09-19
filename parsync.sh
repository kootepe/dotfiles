#!/bin/bash

# SETUP OPTIONS
export SRCDIR="/media/au_share/Micromet_heath/2018"
export DESTDIR="/media/eerokos/KINGSTON/ICOS/GL-ZaH/Raw/ghg/2018"
export THREADS="4"

# RSYNC DIRECTORY STRUCTURE
# rsync -zr -f"+ */" -f"- *" $SRCDIR/ $DESTDIR/
# FOLLOWING MAYBE FASTER BUT NOT AS FLEXIBLE
# cd $SRCDIR; find . -type d -print0 | cpio -0pdm $DESTDIR/
# FIND ALL FILES AND PASS THEM TO MULTIPLE RSYNC PROCESSES
cd $SRCDIR && find . ! -type d -print0 | xargs -0 -n1 -P$THREADS -I% rsync -az % $DESTDIR/%

# IF YOU WANT TO LIMIT THE IO PRIORITY,
# PREPEND THE FOLLOWING TO THE rsync & cd/find COMMANDS ABOVE:
#   ionice -c2
