PFont font;
PFont police(int size, boolean event) {
  int which_font = (int)random(fontList.length);
  if(font == null || event) {
    font = createFont(fontList[which_font],size);
  }
  return font;
}
