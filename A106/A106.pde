
float rotation_x, rotation_y,x, y, z,t_x, t_y, t_z,Cmp_x, Cmp_z;

boolean mouvement_haut, mouvement_bas, mouvement_gauche, mouvement_droit;
boolean isLight = false;
boolean Bais_Mon_rideau_proj =false;


int mouvement_acceleration = 20;  
int mouvement_x,mouvement_z;

BTM btm = new BTM();
Cote_Mure cote_mure = new Cote_Mure();
Pc_Table_Chaise  pc_table_chaise = new Pc_Table_Chaise();

PShader Shader_couleur;
PVector[] color_light = {
  new PVector(255, 255, 255), 
  new PVector(255, 255, 255)
};

PVector[] pos_light = 
{ 
  new PVector(300, -300, 300), //Lumiere du plafond
  new PVector(0, 0, -300), //Lumiere de la fenetre

};


PShape salle_tp_a106() {
  PShape groupe = createShape(GROUP);
  groupe.addChild(btm.creerBTM(300, "Images/Image_Plafond.jpg","Images/Brique.png"));

  groupe.addChild(cote_mure.Porte_Salle());
  groupe.addChild(cote_mure.Porte_Interieur_Salle());
  groupe.addChild(cote_mure.Fenetre_de_la_salle("Images/Image_fenetre.jpg","Images/Fenetre.png",6.3));
  groupe.addChild(cote_mure.Fenetre_Division_intérieur());
  groupe.addChild(cote_mure.Fenetre_Division_extérieur());
  

  groupe.addChild(cote_mure.Rideau_Pour_Projecteur());
  groupe.addChild(cote_mure.Chauffage1());
  groupe.addChild(cote_mure.Chauffage2());
  groupe.addChild(cote_mure.Tableau_salle());
  groupe.addChild(cote_mure.Baisser_Rideau_Projecteur(Bais_Mon_rideau_proj));
  groupe.addChild(Remplissage(3));
  groupe.rotateY(PI/2);

  return groupe;
}

PShape Remplissage(int echelle) {
  PShape groupe = createShape(GROUP);
  PShape bureau []= 
  {
    pc_table_chaise.Le_Bureau
    (
    true, echelle
    ),
    pc_table_chaise.Le_Bureau
    (
    true, echelle
    ),
    pc_table_chaise.Le_Bureau
    (
    true, echelle
    ), 
    pc_table_chaise.Le_Bureau
    (
    true, echelle
    ), 
    pc_table_chaise.Le_Bureau
    (
      true, echelle
    )
  };
  PShape bureau2 []= {
    pc_table_chaise.Le_Bureau
    (
    true, echelle
    ), 
    pc_table_chaise.Le_Bureau
    (
    true, echelle
    ), 
    pc_table_chaise.Le_Bureau
    (
    true, echelle
    ),
    pc_table_chaise.Le_Bureau
    (
    true, echelle
    ), 
    pc_table_chaise.Le_Bureau
    (
      true, echelle
    )
  };
  PShape bureau3 []= {
    pc_table_chaise.Le_Bureau
    (
    false, echelle
    ), 
    pc_table_chaise.Le_Bureau(
      false, echelle
    ), 
    pc_table_chaise.Le_Bureau(
    false, echelle
    ), 
    pc_table_chaise.Le_Bureau
    (
    false, echelle
    ), 
    pc_table_chaise.Le_Bureau
    (
    false, echelle
    )};

  for (int i  = 0; i <bureau.length; i++) 
  {
    groupe.addChild(bureau[i]);
    if (i%2==0&&i!=4){
    bureau[i].translate(0, 0, -140*(i+1));
    } else if (i%2!=0 && i>0) {
      bureau[i].translate(0, 0, -140*(i-1));
    } 
  }

  for (int i  = 0; i <bureau2.length; i++) {
    bureau2[i].translate(118, -0, -0);
    groupe.addChild(bureau2[i]);
    if (i%2==0&&i!=4){
    bureau2[i].translate(0, 0, -140*(i+1));
    }else if (i%2!=0 && i>0){
      bureau2[i].translate(0, 0, -140*(i-1));
    }  
  }
  for (int i  = 0; i <bureau3.length; i++) {
    bureau3[i].translate(118*2, -0, -0);
    groupe.addChild(bureau3[i]);
    if (i%2==0&&i!=4){
      bureau3[i].translate(0, 0, -140*(i+1));
    }else if (i%2!=0 && i>0) {
      bureau3[i].translate(0, 0, -140*(i-1));
    } 
  }

  return groupe;
}


void Variable_Pour_Camera() {
  x = width/2;y = height/2;z = (height/2.0) / tan(PI*60.0 /360.0);
  t_x = width/2;t_y = height/2;t_z = 0;
  Cmp_x = t_x - x;Cmp_z = t_z - z;
  mouvement_x = 0; mouvement_z = 0;
  mouvement_haut = false;mouvement_bas = false; mouvement_gauche = false;mouvement_droit = false;
}


public void Mise_A_Jours_Location() {

  if (mouvement_bas) {
    z -= Cmp_z/mouvement_acceleration;
    t_z-= Cmp_z/mouvement_acceleration;
    x -= Cmp_x/mouvement_acceleration;
    t_x-= Cmp_x/mouvement_acceleration;
  } else if (mouvement_haut) {
    z += Cmp_z/mouvement_acceleration;
    t_z+= Cmp_z/mouvement_acceleration;
    x += Cmp_x/mouvement_acceleration;
    t_x+= Cmp_x/mouvement_acceleration;
  }
  if (mouvement_droit) {
    z += Cmp_x/mouvement_acceleration; 
    t_z+= Cmp_x/mouvement_acceleration;
    x -= Cmp_z/mouvement_acceleration;
    t_x-= Cmp_z/mouvement_acceleration;
  }else if (mouvement_gauche) {
    z -= Cmp_x/mouvement_acceleration; 
    t_z-= Cmp_x/mouvement_acceleration;
    x += Cmp_z/mouvement_acceleration;
    t_x+= Cmp_z/mouvement_acceleration;
  }
  camera(x, y, z, t_x, t_y, t_z, 0, 1, 0);
}





void Lumiere_salle() {
  for (int i=0; i<pos_light.length; i++) {
    lightSpecular(color_light[i].x, color_light[i].y, color_light[i].z);
    pointLight(color_light[i].x, color_light[i].y, color_light[i].z, pos_light[i].x, pos_light[i].y, pos_light[i].z);
  }
 for (int i=0; i<pos_light.length; i++) {
    pushMatrix();
    noStroke();
    emissive(color_light[i].x, color_light[i].y, color_light[i].z);
    translate(pos_light[i].x, pos_light[i].y, pos_light[i].z);
    popMatrix();
  }
   shader(Shader_couleur);
  emissive(0);
  lightSpecular(255, 255, 255);
  shininess(5.0); 
  ambientLight(120, 124, 124);
}

void dessineTitre() {
  fill(180, 133, 13);
  textSize(20);
  textAlign(LEFT);
  text("Touche :\n"
  +"1) ESPACE --> allumé ou eteindre la Lumière  "
  +"2) ALT --> Alarme incendie "
  +"3) clic --> Rideau tableau "
  +"4) z ou fleche haut --> Avancez "
  +"5) s ou fleche bas --> Reculer "
  +"6) d ou fleche droite --> Allez vers la droite \n"
  +"7) q ou fleche gauche --> Allez vers la gauche",width/20, height/20);
}

void setup() {
  fullScreen(P3D);
  Variable_Pour_Camera();
  Shader_couleur = loadShader("Shader/ShaderTFrag.glsl", "Shader/ShaderTVert.glsl");
}
void mousePressed() {
  this.Bais_Mon_rideau_proj = !this.Bais_Mon_rideau_proj;
}

void mouseDragged() {
  rotation_y -= (mouseX - pmouseX) * 0.01;
  rotation_x -= (mouseY - pmouseY) * 0.01;
}
public void keyPressed() {
  if (keyCode == UP || key == 'z') {
    mouvement_z = -5;
    mouvement_haut = true;
  } else if (keyCode == DOWN || key == 's') {
    mouvement_z = 5;
    mouvement_bas = true;
  } else if (keyCode == LEFT || key == 'q') {
    mouvement_x = -5;
    mouvement_gauche = true;
  } else if (keyCode == RIGHT || key == 'd') {
    mouvement_x = 5;
    mouvement_droit = true;
  }

  if (keyCode ==' ') {
    isLight = !isLight;
    println("");
  }
}

public void keyReleased() {
  if (keyCode == UP || key == 'z') {
    mouvement_haut = false;
    mouvement_z = 0;
  } else if (keyCode == DOWN || key == 's') {
    mouvement_bas = false;
    mouvement_z = 0;
  } else if (keyCode == LEFT || key == 'q') {
    mouvement_gauche = false;
    mouvement_x = 0;
  } else if (keyCode == RIGHT || key == 'd') {
    mouvement_droit = false;
    mouvement_x = 0;
  }
}

void draw() {  
  background(32);
  noStroke();
  if (keyCode == ALT) {
    isLight = !isLight;
  }if (isLight){
    Lumiere_salle();
  }  
  translate(width/1.7, height/2);
  rotateX(rotation_x);rotateY(-rotation_y); 
  shape(salle_tp_a106());Mise_A_Jours_Location();dessineTitre();
}
