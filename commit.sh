#!/bin/sh

dated=`date +%Y-%m-%d-%H%M%S`

git add .
git commit -m "Brandmaister digital contacts on "${dated} 
git push -u origin main 
