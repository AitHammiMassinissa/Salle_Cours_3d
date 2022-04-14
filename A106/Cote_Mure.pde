
class Cote_Mure {

  Pc_Table_Chaise pc_table_chaise = new Pc_Table_Chaise();


  PShape Forme_Texture(int cote, int x, int y, String face, String oppose) {
    PImage pImage = loadImage(face);
    PImage pImage2 = loadImage(oppose);
    PShape groupe = createShape(GROUP);
    PShape shape1 = createShape();
    PShape shape2 = createShape();
    float f = cote/2f;



    shape1.beginShape(QUADS);
    shape1.textureMode(NORMAL);
    shape1.texture(pImage);
    shape1.shininess(200.0);
    shape1.emissive(0, 0, 0);

    //face
    shape1.fill(color(0));
    shape1.vertex(
      -f/x, -f, -f+y, 0, 0
      );
    shape1.vertex( 
      f, -f, -f+y, 1, 0
      );
    shape1.vertex(
       f, f, -f+y, 1, 1
       );
    shape1.vertex(
      -f/x, f, -f+y, 0, 1
      );
    shape1.endShape();

    shape2.beginShape(QUADS);
    shape2.textureMode(NORMAL);
    shape2.texture(pImage2);
    shape2.shininess(200.0);
    shape2.emissive(0, 0, 0);

    //opposit face 
    shape2.vertex(
      f, -f, -f, 0, 0
      );
    shape2.vertex(
      -f/x, -f, -f, 1, 0
      );
    shape2.vertex(
      -f/x, f, -f, 1, 1
      );
    shape2.vertex(
      f, f, -f, 0, 1
      );
    shape2.endShape();

    groupe.addChild(shape1);
    groupe.addChild(shape2);

    groupe.translate(20, 50, 248);

    return groupe;
  }

  PShape Tableau_salle() {

    PShape tableau_salle = pc_table_chaise.Form_diff(400, 150, 3);
    tableau_salle.translate(-215, 0, 148);
    tableau_salle.setFill(color(66, 85, 58));

    return tableau_salle;
  }

  PShape Porte_Salle() {

    PShape portes_textures = Forme_Texture(
    200, -75, 4,
    "Images/Porte_de_dos.jpg", 
    "Images/Porte_de_face.jpg"
    );
    portes_textures.translate(-145.5, 0, -600);
    portes_textures.rotateY(PI/2);    
    return portes_textures;
  }


  PShape Porte_Interieur_Salle() {
    PShape groupe = createShape(GROUP);
    PShape porteInterieurTexture []= {
      Forme_Texture(
        200, -75, 4,
        "Images/Entre.jpg",
        "Images/Porte_de_dos.jpg"), 
        Forme_Texture(
        200, -75, 4, 
        "Images/Entre.jpg", 
        "Images/Porte_de_dos.jpg")};

    for (int i  = 0; i <porteInterieurTexture.length; i++) {
      groupe.addChild(porteInterieurTexture[i]);

      if (i%2!=0) {
        porteInterieurTexture [i].translate(0, 0, -750);
      }
    }
    return groupe;
  }

  PShape Fenetre_Division_intérieur() {
    PShape groupe = createShape(GROUP);
    PShape fenetre_Division = createShape();
    fenetre_Division.beginShape(QUADS);
    fenetre_Division.fill(color(255));
    
    fenetre_Division.vertex(-10, -10,  10, 0, 0);
     fenetre_Division.vertex( 47, -10,  10, 1, 0);
     fenetre_Division.vertex( 47, 290,  10, 1, 1);
     fenetre_Division.vertex(-10,  290,  10, 0, 1);
    // -Z "back" face
    
     fenetre_Division.vertex( 47, -10, -10, 0, 0);
     fenetre_Division.vertex(-10, -10, -10, 1, 0);
     fenetre_Division.vertex(-10,  290, -10, 1, 1);
     fenetre_Division.vertex( 47,  290, -10, 0, 1);
    // +Y "bottom" face
    
     fenetre_Division.vertex(-10,  290,  10, 32, 0);
    fenetre_Division.vertex( 47,290,  10, 48, 0);
     fenetre_Division.vertex( 47,  290, -10, 48, 1);
     fenetre_Division.vertex(-10,  290, -10, 32, 1);
  
     fenetre_Division.vertex(-10, -10, -10, 1, 0);
     fenetre_Division.vertex( 47, -10, -10, 32, 0);
     fenetre_Division.vertex( 47, -10,  10, 32, 1);
     fenetre_Division.vertex(-10, -10,  10, 1, 1);
    // +X "right" face
    
     fenetre_Division.vertex( 47, -10,  10, 0, 0);
     fenetre_Division.vertex( 47, -10, -10, 1, 0);
     fenetre_Division.vertex( 47,  290, -10, 1, 1);
     fenetre_Division.vertex( 47,  290,  10, 0, 1);
    // -X "left" face

     fenetre_Division.vertex(-10, -10, -10, 0, 0);
     fenetre_Division.vertex(-10, -10,  10, 1, 0);
     fenetre_Division.vertex(-10,290,  10, 1, 1);
     fenetre_Division.vertex(-10,290, -10, 0, 1);
     fenetre_Division.translate(350, -142, 140);  
       
    fenetre_Division.endShape();
    fenetre_Division.rotateY(PI/2); 
    groupe.addChild(fenetre_Division);
   
    return groupe;
  }
  PShape Fenetre_Division_extérieur() {
    PShape groupe = createShape(GROUP);
    PShape fenetre_Division = createShape();
    PImage Image= loadImage("Images/Brique2.png");
    fenetre_Division.beginShape(QUADS);
    fenetre_Division.textureMode(NORMAL);
    fenetre_Division.texture(Image);
    
    fenetre_Division.vertex(-10, -10,  10, 0, 0);
     fenetre_Division.vertex( 47, -10,  10, 1, 0);
     fenetre_Division.vertex( 47, 290,  10, 1, 1);
     fenetre_Division.vertex(-10,  290,  10, 0, 1);
    // -Z "back" face
    
     fenetre_Division.vertex( 47, -10, -10, 0, 0);
     fenetre_Division.vertex(-10, -10, -10, 1, 0);
     fenetre_Division.vertex(-10,  290, -10, 1, 1);
     fenetre_Division.vertex( 47,  290, -10, 0, 1);
    // +Y "bottom" face
    
     fenetre_Division.vertex(-10,  290,  10, 32, 0);
    fenetre_Division.vertex( 47,290,  10, 48, 0);
     fenetre_Division.vertex( 47,  290, -10, 48, 1);
     fenetre_Division.vertex(-10,  290, -10, 32, 1);
  
     fenetre_Division.vertex(-10, -10, -10, 1, 0);
     fenetre_Division.vertex( 47, -10, -10, 32, 0);
     fenetre_Division.vertex( 47, -10,  10, 32, 1);
     fenetre_Division.vertex(-10, -10,  10, 1, 1);
    // +X "right" face
    
     fenetre_Division.vertex( 47, -10,  10, 0, 0);
     fenetre_Division.vertex( 47, -10, -10, 1, 0);
     fenetre_Division.vertex( 47,  290, -10, 1, 1);
     fenetre_Division.vertex( 47,  290,  10, 0, 1);
    // -X "left" face

     fenetre_Division.vertex(-10, -10, -10, 0, 0);
     fenetre_Division.vertex(-10, -10,  10, 1, 0);
     fenetre_Division.vertex(-10,290,  10, 1, 1);
     fenetre_Division.vertex(-10,290, -10, 0, 1);
     fenetre_Division.translate(350, -142, 160);  
       
    fenetre_Division.endShape();
    fenetre_Division.rotateY(PI/2); 
    groupe.addChild(fenetre_Division);
   
    return groupe;
  }
  
  PShape Fenetre_de_la_salle(String oppose, String face_image,float val) {

    PImage pImage2 = loadImage(oppose);
    PImage pImage3 = loadImage(face_image);
    
    PShape groupe = createShape(GROUP);
    PShape shape1= createShape();
    PShape shape2 = createShape();
    float f = 200/2f;


    shape1.beginShape(QUADS);
    shape1.textureMode(NORMAL);
    shape1.texture(pImage3);
    shape1.shininess(200.0);
    shape1.emissive(0, 0, 0);
    //Face oposé
    shape2.beginShape(QUADS);
    shape2.textureMode(NORMAL);
    shape2.texture(pImage2);
    shape2.shininess(200.0);
    shape2.emissive(0, 0, 0);
    
    shape2.vertex(
      f-2, f*3/4, f, 1, 1
      );
    shape2.vertex(
      f-2, f*3/4, -f*val, 0, 1
      );
    shape2.vertex(
      f-2, -f*3/4, -f*val, 0, 0
      );

    shape2.vertex(
      f-2, -f*3/4, f, 1, 0
      );
    shape2.endShape();

    //Fenetre_de_la_salle
    shape1.fill(color(#8B8B8B));
    shape1.vertex(
      f, f*3/4, f, 0, 0
      );
    shape1.vertex(
      f, f*3/4, -f*val, 1, 0
      );
    shape1.vertex(
      f, -f*3/4, -f*val, 1, 1
      );
    shape1.vertex(
      f, -f*3/4, f, 0, 1
      );
    shape1.endShape();

    groupe.addChild(shape1);
    groupe.addChild(shape2);
    groupe.translate(
      50.5, -40, 30
      );

    return groupe;
  }

 

  PShape Chauffage1() {
    PShape groupe = createShape(GROUP);
    PImage Image= loadImage("Images/Chauffage.jpeg");
    PShape premier_chauffage = createShape();
    premier_chauffage.beginShape(QUADS);
    premier_chauffage.textureMode(NORMAL);
    premier_chauffage.texture(Image);
    premier_chauffage.shininess(200.0);
    
    premier_chauffage.vertex(-10, -10,  5, 0, 0);
     premier_chauffage.vertex( 160, -10,  5, 1, 0);
     premier_chauffage.vertex( 160, 80,  5, 1, 1);
     premier_chauffage.vertex(-10,  80,  5, 0, 1);
    // -Z "back" face
     premier_chauffage.vertex( 160, -10, -5, 0, 0);
     premier_chauffage.vertex(-10, -10, -5, 1, 0);
     premier_chauffage.vertex(-10,  80, -5, 1, 1);
     premier_chauffage.vertex( 160,  80, -5, 0, 1);
    // +Y "bottom" face
     premier_chauffage.vertex(-10,  80,  5, 32, 0);
    premier_chauffage.vertex( 160,  80,  5, 48, 0);
     premier_chauffage.vertex( 160,  80, -5, 48, 1);
     premier_chauffage.vertex(-10,  80, -5, 32, 1);
    // -Y "top" face
     premier_chauffage.vertex(-10, -10, -5, 1, 0);
     premier_chauffage.vertex( 160, -10, -5, 32, 0);
     premier_chauffage.vertex( 160, -10,  5, 32, 1);
     premier_chauffage.vertex(-10, -10,  5, 1, 1);
    // +X "right" face
     premier_chauffage.vertex( 160, -10,  5, 0, 0);
     premier_chauffage.vertex( 160, -10, -5, 1, 0);
     premier_chauffage.vertex( 160,  80, -5, 1, 1);
     premier_chauffage.vertex( 160,  80,  5, 0, 1);
    // -X "left" face
     premier_chauffage.vertex(-10, -10, -5, 0, 0);
     premier_chauffage.vertex(-10, -10,  5, 1, 0);
     premier_chauffage.vertex(-10,80,  5, 1, 1);
     premier_chauffage.vertex(-10,80, -5, 0, 1);
     premier_chauffage.translate(144, 60, 140);  
       
    premier_chauffage.endShape();   
    premier_chauffage.rotateY(PI/2); 
    groupe.addChild(premier_chauffage);
   
    return groupe;
  }

  PShape Chauffage2() {
    PShape groupe = createShape(GROUP);
    PImage Image= loadImage("Images/Chauffage.jpeg");
    PShape deuxieme_chauffage = createShape();
    deuxieme_chauffage.beginShape(QUADS);
    deuxieme_chauffage.textureMode(NORMAL);
    deuxieme_chauffage.texture(Image);
    deuxieme_chauffage.shininess(200.0);
    
    deuxieme_chauffage.vertex(-10, -10,  5, 0, 0);
     deuxieme_chauffage.vertex( 160, -10,  5, 1, 0);
     deuxieme_chauffage.vertex( 160, 80,  5, 1, 1);
     deuxieme_chauffage.vertex(-10,  80,  5, 0, 1);
    // -Z "back" face
     deuxieme_chauffage.vertex( 160, -10, -5, 0, 0);
     deuxieme_chauffage.vertex(-10, -10, -5, 1, 0);
     deuxieme_chauffage.vertex(-10,  80, -5, 1, 1);
     deuxieme_chauffage.vertex( 160,  80, -5, 0, 1);
    // +Y "bottom" face
     deuxieme_chauffage.vertex(-10,  80,  5, 32, 0);
    deuxieme_chauffage.vertex( 160,  80,  5, 48, 0);
     deuxieme_chauffage.vertex( 160,  80, -5, 48, 1);
     deuxieme_chauffage.vertex(-10,  80, -5, 32, 1);
    // -Y "top" face
     deuxieme_chauffage.vertex(-10, -10, -5, 1, 0);
     deuxieme_chauffage.vertex( 160, -10, -5, 32, 0);
     deuxieme_chauffage.vertex( 160, -10,  5, 32, 1);
     deuxieme_chauffage.vertex(-10, -10,  5, 1, 1);
    // +X "right" face
     deuxieme_chauffage.vertex( 160, -10,  5, 0, 0);
     deuxieme_chauffage.vertex( 160, -10, -5, 1, 0);
     deuxieme_chauffage.vertex( 160,  80, -5, 1, 1);
     deuxieme_chauffage.vertex( 160,  80,  5, 0, 1);
    // -X "left" face
     deuxieme_chauffage.vertex(-10, -10, -5, 0, 0);
     deuxieme_chauffage.vertex(-10, -10,  5, 1, 0);
     deuxieme_chauffage.vertex(-10,80,  5, 1, 1);
     deuxieme_chauffage.vertex(-10,80, -5, 0, 1);
     deuxieme_chauffage.translate(430, 60, 140);  
       
    deuxieme_chauffage.endShape();
    deuxieme_chauffage.rotateY(PI/2); 
    groupe.addChild(deuxieme_chauffage);
   
    return groupe;
  }

  PShape Rideau_Pour_Projecteur() {


    PShape rideau_Pour_Projecteur = pc_table_chaise.Form_diff(150, 10, 8);
    rideau_Pour_Projecteur.translate(-100, -87, 144);
    rideau_Pour_Projecteur.setFill(color(199, 207, 214));

    return rideau_Pour_Projecteur;
  }

  PShape Baisser_Rideau_Projecteur(boolean enrouleDeroule) {
    PShape baisser_Rideau_Projecteur = null;

    baisser_Rideau_Projecteur = pc_table_chaise.Form_diff(130, 8, 2);
    baisser_Rideau_Projecteur.translate(-100, -78, 144);

    if (enrouleDeroule==true) {
      baisser_Rideau_Projecteur = pc_table_chaise.Form_diff(130, 120, 2);
      baisser_Rideau_Projecteur.translate(-100, -22, 144);
    }
    baisser_Rideau_Projecteur.setFill(color(255));

    return baisser_Rideau_Projecteur;
  }

}
