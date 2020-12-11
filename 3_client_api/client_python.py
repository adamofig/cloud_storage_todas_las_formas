# pip install google-cloud-storage
# gcloud auth application-default login

from google.cloud import storage
client = storage.Client()

bucket = client.get_bucket('dataclouder-demo')

# Subiendo la image disk.jpg
blob = bucket.blob('client_python/disk.jpg')
blob.upload_from_filename("../disk.jpg")
print("1) Se subió la imagen")

# Subiendo un archivo con datos de string
bucket.blob('client_python/data.txt').upload_from_string('archivo de datos')
print("2) Se creó el archivo con texto")

# Descargando archivos
blob.download_to_filename("imagen.jpg")
print("3) Se decargó la imagen")
archivo_string = bucket.blob('client_python/data.txt').download_as_string()
print("4) Se decargo el texto el variable :" , archivo_string)

print("5) Haciendo publico el archivo")
blob.make_public()
print(blob.self_link, ":", blob.size, ":", blob.public_url)
# blob2 = bucket.blob('remote/path/storage.txt')
# blob2.upload_from_filename(filename='./local/path.txt')

print("6) Firmando el archivo")
storage_client = storage.Client.from_service_account_json('./keys.json')
blob = storage_client.get_bucket('dataclouder-demo').blob('client_python/disk.jpg')

from datetime import timedelta
url_signed = blob.generate_signed_url(expiration=timedelta(days=0,seconds=300))
print("El archivo esta firmado", url_signed)
