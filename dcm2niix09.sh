#!/bin/bash


# Your project paths on your local machine/MASSIVE

#ID=C003
ID=$(</home/mkoeda/kg98/mkoeda/005_PET_and_resting/MRI/SubjectIDs3.txt)

PROJDIR_anat=/home/mkoeda/kg98/mkoeda/005_PET_and_resting/MRI/1_Rawdata_dcm/$ID/anat
PROJDIR_func=/home/mkoeda/kg98/mkoeda/005_PET_and_resting/MRI/1_Rawdata_dcm/$ID/func
#PROJDIR=/projects/kg98/Thapa/Nabi/berk_cakmak/berk_cakmak/DICOM
RAWDATADIR=/home/mkoeda/kg98/mkoeda/005_PET_and_resting/MRI/2_Rawdata_nii

if [ ! -d $PROJDIR_anat ]; then mkdir $PROJDIR; echo "making directory"; fi
if [ ! -d $PROJDIR_func ]; then mkdir $PROJDIR; echo "making directory"; fi
if [ ! -d $RAWDATADIR ]; then mkdir $RAWDATADIR; echo "making directory"; fi




# load modules
module purge;
# Load the dcm2niix software
module load mricrogl/1.0.20170207
# Module toggles (on/off)
MODULE1=1 #dcm2niix


# Dynamic directories
	#SUBDICOMDIR=$DICOMDIR/$ID
	OUTDIR=$RAWDATADIR/$ID;
	EPIOUTDIR=$OUTDIR/func;
	T1OUTDIR=$OUTDIR/anat;


# populate rawdata dir with subjects folders

if [ ! -d $OUTDIR ]; then mkdir $OUTDIR; echo "$ID - making directory"; fi
if [ ! -d $EPIOUTDIR ]; then mkdir $EPIOUTDIR; echo "$ID - making func directory"; fi
if [ ! -d $T1OUTDIR ]; then mkdir $T1OUTDIR; echo "$ID - making anat directory"; fi

#T1
		dcm2niix -f ""$ID"_T1w" -o $T1OUTDIR -b -m n -z y $PROJDIR_anat

#fMRI epi
		dcm2niix -f ""$ID"_task-rest_bold" -o $EPIOUTDIR -b -m n -z y $PROJDIR_func
	if	
		echo -e "\nFinished MODULE 1: dcm2niix convert: $ID \n"
	else
		echo -e "\nSkipping MODULE 1: dcm2niix convert: $ID \n"
        
	###################################################################################################
done
