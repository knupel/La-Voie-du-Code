void save_image(String nom) {
  String extension = "jpg" ; // png, tif, tga sont possible aussi
  String date = year() + "_" +month() + "_" + day() + "_" + hour() + "_" + minute() + "_" +second();
  String nom_du_fichier = nom+"_"+date+"."+extension;
  String chemin_relatif = "mes_images/";
  saveFrame(chemin_relatif+nom_du_fichier);
}
