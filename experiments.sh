start=`date +%s`
fichero=logs/inf_10_es-en_pred.txt
rm $fichero
python main.py > $fichero 2>&1
end=`date +%s`
runtime=$((end-start))
echo $runtime
echo $fichero  " RUNTIME: " $runtime >> $fichero
echo $fichero  " RUNTIME: " $runtime >> times.txt
