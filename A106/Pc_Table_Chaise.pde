
class Pc_Table_Chaise {
 
  PShape Pieds(int x, int y, int z, int xTrans, int yTrans, int zTtrans) {
    PShape groupePieds= createShape(GROUP);

    PShape pied1 = Form_diff(x, y, z);
    pied1.translate(xTrans, yTrans, zTtrans);
    groupePieds.addChild(pied1);


    PShape pied2 = Form_diff(x, y, z);
    pied2.translate(-xTrans, yTrans, zTtrans);
    groupePieds.addChild(pied2);

    return groupePieds;
  }

  PShape Le_Bureau(boolean bool, int x) {
    PShape accessoire[] =
    {
      Accessoires_Ensemble(3),
      Accessoires_Ensemble(3)
    };
    PShape groupe = createShape(GROUP);
    PShape pied []= 
    {
      Pieds(
        9/x, 200/x, 
        9/x, 60/x,
        100/x, 160/x),
        Pieds(
        9/x, 200/x, 
        9/x, 60/x, 
        100/x, 160/x
        )
    };
    PShape chaise[] = 
    {
      La_chaise(x),
       La_chaise(x)
    };

    groupe.addChild(
      Surface( 150/x, 10/x, 350/x)
      );

    for (int i  = 0; i <accessoire.length; i++) 
    {
      groupe.addChild(accessoire[i]); groupe.addChild( chaise[i]);

      if (bool==true)
       {
        if (i%2==0)
         {
          accessoire[i].translate(
            0, 0, 180/x
            );
          chaise[i].translate(
            0, 0, 180/x
            );
        }
      } 
      else 
      {
        accessoire[i].translate(
          0, 0, 90/x
          );
        chaise[i].translate(
          0, 0, 90/x
          );
      }
    }
    for (int i  = 0; i <pied.length; i++) {
      groupe.addChild(pied[i]);
      if (i%2==0) 
        pied[i].translate(
          0, 0, -320/x
          );
    }
    groupe.rotateY(PI/2); 
    groupe.translate(
      -380, 82, -110
      ); 

    return groupe;
  }


  PShape Form_diff(int longFace, int hauteur, int Larg) {
    PShape Form_Box = createShape(BOX, longFace, hauteur, Larg);
    Form_Box.setFill(color(0));
    return Form_Box;
  }
  PShape Surface(int x, int y, int z) {
    PShape surface = createShape(BOX, x, y, z);
    surface.setFill(color(#A8C1C1));
    return surface;
  }

  PShape Ecran_de_pc(String face) {

    PImage Image = loadImage(face);
    PShape groupe = createShape(GROUP);
    PShape shape1 = createShape();

    float f = 200/2f;

    shape1.beginShape(QUADS);
    shape1.textureMode(NORMAL);
    shape1.texture(Image);
    shape1.shininess(200.0);
    shape1.emissive(0, 0, 0);
    shape1.vertex(f/5, -f/8.7, -f/5.7, 0, 0);
    shape1.vertex(f/5, -f/8.7, f/5.7, 1, 0);
    shape1.vertex(f/5, f/8.7, f/5.7, 1, 1);
    shape1.vertex(f/5, f/8.7, -f/5.7, 0, 1);
    shape1.endShape();

    groupe.addChild(shape1);
    groupe.translate(-20.1, -21, 20);
    groupe.rotateY(PI);

    return groupe;
  }

  PShape La_chaise(int x) 
  {

    PShape La_chaise= createShape(GROUP);
    PShape surface =  Surface(90/x, 5/x, 120/x);
    surface.translate(100/x, -25/x, 0);
    surface.setFill(color(#BCAC5B));
    La_chaise.addChild(surface);

    PShape dos =  Surface(5/x, 130/x, 120/x);
    dos.setFill(color(#BCAC5B));
    dos.translate(145/x, -90/x, 0);
    La_chaise.addChild(dos);

    PShape pied []= 
    {
      Pieds(
        8/x, 125/x, 8/x, 40/x, 40/x, -45/x
        ), 
      Pieds(
        8/x, 125/x, 8/x, 40/x, 40/x, -45/x
        )
    };

    for (int i  = 0; i <pied.length; i++) {
      pied[i].translate(100/x, 0, 0);
      pied[i].setFill(color(#FFF300));

      La_chaise.addChild(pied[i]);
      if (i%2==0) 
        pied[i].translate(0, 0, 90/x);
    }
    La_chaise.translate(10/x, 100/x, -90/x);

    return La_chaise;
  }



  PShape Accessoires_Ensemble(int x) {

    PShape accessoires_Ensemble = createShape(GROUP);
  

    PShape Ecran = Form_diff(6/x, 70/x, 110/x);
    Ecran.translate(-5/x, -63/x, -60/x);
    accessoires_Ensemble.addChild(Ecran);
    accessoires_Ensemble.addChild(Ecran_de_pc("Images/ecran.jpg"));

    PShape Ecran_cal = Form_diff(6/x, 70/x, 15/x);
    Ecran_cal.translate(-20/x, -34/x, -60/x);
    Ecran_cal.setFill(color(100, 100, 98));
    accessoires_Ensemble.addChild(Ecran_cal);

    PShape Clavier = Form_diff(30/x, 5/x, 90/x);
    Clavier.translate(40/x, -6/x, -60/x);
    accessoires_Ensemble.addChild(Clavier);

    PShape Repose_Cal = Form_diff(35/x, 5/x, 35/x);
    Repose_Cal.translate(-20/x, -6/x, -60/x);
    Repose_Cal.setFill(color(100, 100, 98));
    accessoires_Ensemble.addChild(Repose_Cal);

    PShape Ecran_CaleLier = Form_diff(15/x, 10/x, 15/x);
    Ecran_CaleLier.translate(-15/x, -60/x, -60/x);
    Ecran_CaleLier.setFill(color(100, 100, 98));
    accessoires_Ensemble.addChild(Ecran_CaleLier);

    PShape Souris = Form_diff(17/x, 15/x, 12/x);
    Souris.translate(40/x, -5/x, -130/x);
    accessoires_Ensemble.addChild(Souris);

    PShape uc1 = Form_diff(60/x, 60/x, 20/x);
    uc1.translate(-5/x, -33/x, -150/x);
    accessoires_Ensemble.addChild(uc1);
 
    return accessoires_Ensemble;
  }
}
