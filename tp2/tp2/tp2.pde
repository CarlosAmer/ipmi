PImage dibujo1, dibujo2, dibujo3, dibujo4, dibujo5;
String texto1, texto2, texto3, texto4, texto5;
PFont fuente1;
int cuenta; //suma la cantidad de pantallas
int tiempo; //tiempo de cada pantalla
int sumatoria; //suma los tiempos
int textoX; //Posición texto en X

void setup() {
  size(640, 480);
  fuente1 = loadFont("Argen.vlw");
  textFont(fuente1);
  cuenta = 0;
  tiempo = 300;
  sumatoria = 0;
  textoX = -400;
  dibujo1 = loadImage("super1.jpg");
  dibujo2 = loadImage("super2.jpg");
  dibujo3 = loadImage("super3.jpg");
  dibujo4 = loadImage("super4.jpg");
  dibujo5 = loadImage("super5.jpg");
  texto1 = "Los Supercampeones \n es un anime también \n conocido como Capitán Tsubasa";
  texto2 = "Se creó como manga en 1981 y \n se adaptó a TV en 1983";
  texto3 = "Como anime se emitieron \n 128 episodios hasta 1986";
  texto4 = "Oliver Atom y Benji \n fueron sus personajes más populares";
  texto5 = "La serie fue un gran suceso";
}

void draw() {
  background(200);

  if (cuenta < 4 || sumatoria < 1500) {
    if (textoX < 300) {
      textoX += 5;
    }
  }

  if (cuenta == 0) {
    image(dibujo1, 0, 0);
    muestraTexto(texto1);
  } else if (cuenta == 1) {
    image(dibujo2, 0, 0);
    muestraTexto(texto2);
  } else if (cuenta == 2) {
    image(dibujo3, 0, 0);
    muestraTexto(texto3);
  } else if (cuenta == 3) {
    image(dibujo4, 0, 0);
    muestraTexto(texto4);
  } else if (cuenta == 4 && sumatoria < 1500) {
    image(dibujo5, 0, 0);
    muestraTexto(texto5);
  } else {
    image(dibujo5, 0, 0);
    botonReinicio();
  }

  if (sumatoria < 1500) {
    sumatoria++;
    if (sumatoria >= tiempo * (cuenta + 1)) {
      cuenta++;
      if (cuenta > 4) cuenta = 4;
      textoX = -400;
    }
  }
}

void muestraTexto(String texto) {
  fill(0);
  textSize(28);
  textAlign(CENTER, CENTER);
  text(texto, textoX, height / 2);
}

void botonReinicio() {
  fill(0);
  rect(550, 420, 80, 40);
  fill(255);
  textSize(15);
  textAlign(CENTER, CENTER);
  text("Reinicio", 590, 440);
}

void mousePressed() {
  if (cuenta == 4 && sumatoria >= 1500) {
    if (mouseX > 550 && mouseX < 630 && mouseY > 420 && mouseY < 460) {
      reinicio();
    }
  }
}

void reinicio() {
  cuenta = 0;
  sumatoria = 0;
  
}
