// Povilas Kubilius C16370803
// OOP Lab Test 1

void setup()
{
 size(800,600); 
 loadData();
 printProducts();
 border = width/15;
 billFull = false;
 billSize = 14;
}

// delcaring the array lists
ArrayList<Product> cafes = new ArrayList<Product>();
ArrayList<Product> bill = new ArrayList<Product>();

// some public variables
float border;
boolean billFull;
int billSize;

// the method that loads data from the csv file to the array lists
void loadData()
{
  // loading in the table
  Table table = loadTable("cafe.csv", "header");
  
  // assigning each row from the table into an ArrayList of type product
  for(TableRow r : table.rows())
  {
     Product cafe = new Product(r);
     cafes.add(cafe);
  } 
}

void draw()
{
 background(200, 200, 200);
 drawUI();
 displayProducts();
 displayBill();
}


// mouse pressed to add items to the bill array
void mousePressed()
{
   float buttonBorder = height/8;
   
   // This will first check if the mouse coordinates are within any boxes
   if((mouseX < border +  width/3) && mouseX > border)
   {
     // then it will through the cafe array, because the boxes corspond to the order of cafe in the array
     for(int i = 0; i < cafes.size(); i++)
    {
      Product c = cafes.get(i);
      // check if mouse is in the first, or second or third... etc box
      if((mouseY > border + (buttonBorder * i) ) && mouseY < (border + (buttonBorder * i) +height/10))
      {
        
        // if it is it will first check if the bill is already full
        if(billFull)
        {
          // if bill is full, it will do nothing
          break;
        }
        else
        {
          // else it will add the item clicked on to the bill array
          bill.add(c);
          // then it will if the bill is full, 14 items is full
          if(bill.size() == 14)
          {
           billFull = true; 
          }
          break;
        }
      }
    }
   }
}


// the method to test if the data from the tables was loaded correctly
void printProducts()
{
  // a for loop to print each item
  for(int i = 0; i < cafes.size() ; i++)
  {
    Product c = cafes.get(i);
    println(c.name + "  " + c.price);
  }
}


// This will draw the shop's header on the top, the line down the middle and the the bill box on the left
void drawUI()
{
  // the shop name on top
  textSize(32);
  textAlign(CENTER);
  text("Cafe Rubis Till System", width/2, border/2);
  // the line down the middle
  line(width/2, border, width/2, height - border);
  
  // the bill box on the left
  fill(255);
  rect(width/2 + border, border, width/2.5, height - (border*2));
  
  // "Your Bill" on the top of the bill
  textSize(15);
  fill(0);
  text("Your Bill", width/2 + border + ((width/2.5) /2), border + (border/2)); 
}

// this will draw the boxes on the left, and print the names on the boxes
void displayProducts()
{ 

  float buttonBorder = height/8;
  String nfPrice;
  textSize(15);
  
  // for loop to make the boxes and the print the item names on them
  for(int i = 0; i < cafes.size(); i++)
  {
    Product c = cafes.get(i);
    
    // drawing the boxes
    fill(255);
    rect(border, border + (buttonBorder * i), width/3, height/10);
    
    // the name of the coffee on the left of the box
    textAlign(LEFT);
    fill(0);
    text(c.name, border + (border/4), (border + height/20 ) + (buttonBorder * i) );
    
    // the price of the coffee on the right
    textAlign(RIGHT);
    nfPrice = nf(c.price, 1, 2);
    text(nfPrice, border + (border * 4), (border + height/20 ) + (buttonBorder * i) );
  }
}

// This will draw all the items added to the bill array to the bill display on the right
void displayBill()
{ 

  float billBorder = height/20;
  String nfPrice;
  int i;
  float total = 0;
  textSize(15);
  
  // printing items from the bill array to the bill display
  for(i = 0; i < bill.size(); i++)
  {
    Product b = bill.get(i);
    
    // incrementing the total price
    total += b.price;
    
    textAlign(LEFT);
    text(b.name, width/2 + border + (border/4), (border + height/20 ) + (billBorder * i) +  (border/2));
    textAlign(RIGHT);
    // coverting float to a string with 2 decimal places
    nfPrice = nf(b.price, 1, 2);
    text(nfPrice, width/2 + border + (border * 5), (border + height/20 ) + (billBorder * i) + (border/2));
  }
  
  // printing the total sum of all items added to the bill
  textAlign(LEFT);
  text("Total" , width/2 + border + (border/4), (border + height/20 ) + (billBorder * i) + (border/2));
  textAlign(RIGHT);
  // coverting float to a string with 2 decimal places
  nfPrice = nf(total, 1, 2);
  text(nfPrice, width/2 + border + (border * 5), (border + height/20 ) + (billBorder * i) + (border/2));
  
}