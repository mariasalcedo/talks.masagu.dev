#!/bin/sh


# Build slides

yarn_slidev (){
   
   for slide in $(ls ./slides); do

       echo "######################"
       echo "### Build ${slide} ###"       
       echo "######################"

       yarn slidev build "slides/${slide}/slides.md" --out "../../dist/${slide}" --base "/${slide}"
       built_slides+=($slide)
       echo ${slide}
   
   done 
}

yarn_slidev

