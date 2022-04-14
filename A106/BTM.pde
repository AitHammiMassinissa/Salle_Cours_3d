
class BTM {

  PShape creerBTM(int cote, String plafond,String cote_droit_exterieur) {
    PShape shape1 = createShape();
    PShape shape2 = createShape();
    PShape shape3 = createShape();

    float f = cote/2f;
    shape1.beginShape(QUADS);

    PImage Image_Plafond = loadImage(plafond);
    PImage Image_cote_droit_exterieur = loadImage(cote_droit_exterieur);
    PShape groupe = createShape(GROUP); 
  
  
   
/****************Mure de face*****************/
shape1.fill(color(#E8FCFB));
shape1.vertex(-f*3, -f, f);
shape1.vertex( f, -f, f, 0, 1);
shape1.vertex( f, f, f, 1, 1 );
shape1.vertex(-f*3, f, f, 1, 0);
/**************Mure de droite****************/
shape1.fill(color( #FCFCFA));
shape1.vertex(f-1, f, f, 1, 0);
shape1.vertex(f-1, f, -f*4, 1, 1);
shape1.vertex(f-1, -f, -f*4, 0, 1);
shape1.vertex(f-1, -f, f, 0, 0);

/****************Mure oposé au mur de face*****************/
shape1.fill(color(#E8FCFB));
shape1.vertex(f, -f, -f*4, 0, 0);
shape1.vertex(-f*3, -f, -f*4, 0, 1);
shape1.vertex(-f*3, f, -f*4, 1, 1);
shape1.vertex(f, f, -f*4, 1, 0);

/****************Sole*****************/
shape1.fill(color(#9B450B));
shape1.vertex(-f*3, f, f, 0, 0);
shape1.vertex(f, f, f, 0, 1);
shape1.vertex(f, f, -f*4, 1, 1);
shape1.vertex(-f*3, f, -f*4, 1, 0);

/**************Mure de gauche****************/
shape1.fill(color(#FCFCFA));
shape1.vertex(-f*3, -f, -f*4, 0, 0);
shape1.vertex(-f*3, -f, f, 0, 1);
shape1.vertex(-f*3, f, f, 1, 1);
shape1.vertex(-f*3, f, -f*4, 1, 0);

  

  /**************Plafond de l'extérieur****************/

    shape1.fill(color(#FCFCFA));
    shape1.vertex(-f*3, -f-1, -f*4, 0, 0);
    shape1.vertex(f, -f-1, -f*4, 0, 1);
    shape1.vertex(f, -f-1, f, 1, 1);
    shape1.vertex(-f*3, -f-1, f, 1, 0);
    shape1.endShape();

    /**************Plafond****************/
    shape2.beginShape(QUADS); 
    shape2.textureMode(NORMAL);
    shape2.texture(Image_Plafond);
    shape2.shininess(200.0);
    shape2.emissive(0, 0, 0);
    shape2.vertex(-f*3, -f, -f*4, 0, 0);
    shape2.vertex(f, -f, -f*4, 0, 1);
    shape2.vertex(f, -f, f, 1, 1);
    shape2.vertex(-f*3, -f, f, 1, 0);
    shape2.endShape();

 /**************Mure de droite ext****************/
shape3.beginShape(QUADS); 
shape3.textureMode(NORMAL);
shape3.texture(Image_cote_droit_exterieur);
shape3.shininess(200.0);
shape3.fill(color( #FCFCFA));
shape3.vertex(f, f, f, 1, 0);
shape3.vertex(f, f, -f*4, 1, 1);
shape3.vertex(f, -f, -f*4, 0, 1);
shape3.vertex(f, -f, f, 0, 0);
shape3.endShape();

   
  groupe.addChild(shape1);
  groupe.addChild(shape2);
  groupe.addChild(shape3);

    return groupe;
  }
}
