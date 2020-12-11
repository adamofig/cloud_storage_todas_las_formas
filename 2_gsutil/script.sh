# Muestra la lista de segmentos disponibles
printf "\n1) Listando buckets"
gsutil list

# Copiar un archivo
# El archivo se encuentra en un nivel anterior, se guarda en el folder files, cambia el nombre
printf "\n2) Subiendo archivo"
gsutil cp ../disk.jpg gs://dataclouder-demo/gsutil/disk.jpg

# Descargar archivo 
printf "\n3) Descargando archivo"
gsutil cp gs://dataclouder-demo/gsutil/disk.jpg descarga.jpg

# Borrar el archivo 
printf "\n4) Borrando archivo"
gsutil rm gs://dataclouder-demo/gsutil/disk.jpg 
