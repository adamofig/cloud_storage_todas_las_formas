OBJECT_LOCATION='../readme.md'
OAUTH2_TOKEN='ya29.a0Ae4lvC2m9ns63RiskhsJvv7taDpa4O8H1_HrzPs2WiQ3mvuLjvieVeKvo7T9UvNf4xNpf_U2qwF2P6EUB-6nNFXjs_JQmecJVqyRjHgrngPC2XxkwGwd9smvAGcCwHJ73XSbJYPI4z_Vtxeu0SyJPFbURyR0vRBkczI'
OBJECT_CONTENT_TYPE='application/octet-stream'
BUCKET_NAME='dataclouder-demo'
OBJECT_NAME='readme.md'

echo "Subiendo $OBJECT_LOCATION a $BUCKET_NAME/$OBJECT_NAME ..." 

curl -X POST --data-binary @$OBJECT_LOCATION \
-H "Authorization: Bearer $OAUTH2_TOKEN" \
-H "Content-Type: $OBJECT_CONTENT_TYPE" \
"https://storage.googleapis.com/upload/storage/v1/b/$BUCKET_NAME/o?uploadType=media&name=$OBJECT_NAME"
