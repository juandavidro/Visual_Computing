PImage img;  // Declare a variable of type PImage

size(567,650);
  // Make a new instance of a PImage by loading an image file
  img = loadImage("persistenacia.jpg");

background(2,2,0);
  // Draw the image to the screen at coordinate (0,0)
image(img,0,0);
//filter(GRAY);
//filter(THRESHOLD);
//filter(INVERT);



int[] hist = new int[256];

// Calculate the histogram
for (int i = 0; i < img.width; i++) {
  for (int j = 0; j < img.height; j++) {
    int bright = int(brightness(get(i, j)));
    hist[bright]++; 
  }
}

// Find the largest value in the histogram
int histMax = max(hist);

stroke(12,45,123);
// Draw half of the histogram (skip every second value)
for (int i = 0; i < img.width; i += 1) {
  // Map i (from 0..img.width) to a location in the histogram (0..255)
  int which = int(map(i, 0, img.width, 0, 255));
  // Convert the histogram value to a location between 
  // the bottom and the top of the picture
  println(which);
  int y = int(map(hist[which], 0, histMax, img.height*1.5, img.height));
  line(i, img.height*1.5, i, y);
}
