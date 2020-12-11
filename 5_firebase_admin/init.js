var admin = require("firebase-admin");

var serviceAccount = require("./key.json");

admin.initializeApp({
  credential: admin.credential.cert(serviceAccount),
  // databaseURL: "https://dataclouder-demo.firebaseio.com"
});


async function subirArchivo(){
  await admin.storage().bucket("gs://dataclouder-demo").upload('../disk.jpg', {destination:'fbadmin/disk.jpg'});
}

const fileRef = admin.storage().bucket("gs://dataclouder-demo").file("fbadmin/disk.jpg");

async function descargarArchivo() {
    await fileRef.download({destination: './img.jpg'});
}

async function urlFirmada() {
    const dateExp = new Date(); 
    dateExp.setHours(dateExp.getHours() + 1);
    console.log("Url expira en: ", dateExp);
    const result = await fileRef.getSignedUrl({ action: "read" , expires : dateExp});
    console.log(result);
}

async function iniciar(){
    try{
        await subirArchivo();
        console.log("1) Se subió el archivo");
        await descargarArchivo();
        console.log("Se descargó el archivo");
        await urlFirmada();
        console.log("Se firmó el archivo");
      } catch(e){
        console.log("ocurrió un err", e)
      }
}

iniciar();