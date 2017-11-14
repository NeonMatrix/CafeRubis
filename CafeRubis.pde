// Povilas Kubilius C16370803


void setup()
{
 size(800,600); 
 loadData();
 printProducts();
 border = width/15;
 billFull = false;
 billSize = 14;
}

ArrayList<Product> cafes = new ArrayList<Product>();
ArrayList<Product> bill = new ArrayList<Product>();

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
 //printBills();
}

void mousePressed()
{
   float buttonBorder = height/8;
   
   if((mouseX < border +  width/3) && mouseX > border)
   {
     for(int i = 0; i < cafes.size(); i++)
    {
      Product c = cafes.get(i);
      if((mouseY > border + (buttonBorder * i) ) && mouseY < (border + (buttonBorder * i) +height/10))
      {
        //ellipse(mouseX, mouseY, 10, 10);
        if(billFull)
        {
          break;
        }
        else
        {
          bill.add(c);
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



void printProducts()
{
  // Test to see if data was loaded correctly
  for(int i = 0; i < cafes.size() ; i++)
  {
    Product c = cafes.get(i);
    println(c.name + "  " + c.price);
  }
}

/*void printBills()
{
  // Test to see if data was loaded correctly
  for(int i = 0; i < bills.size() ; i++)
  {
    Product b = bills.get(i);
    println(b.name + "  " + b.price);
  }
}
*/

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

void displayBill()
{ 

  float billBorder = height/20;
  String nfPrice;
  int i;
  float total = 0;
  textSize(15);
  
  for(i = 0; i < bill.size(); i++)
  {
    Product b = bill.get(i);
    total += b.price;
    
    textAlign(LEFT);
    text(b.name, width/2 + border + (border/4), (border + height/20 ) + (billBorder * i) +  (border/2));
    textAlign(RIGHT);
    nfPrice = nf(b.price, 1, 2);
    text(nfPrice, width/2 + border + (border * 5), (border + height/20 ) + (billBorder * i) + (border/2));
  }
  
  textAlign(LEFT);
  text("Total" , width/2 + border + (border/4), (border + height/20 ) + (billBorder * i) + (border/2));
  textAlign(RIGHT);
  nfPrice = nf(total, 1, 2);
  text(nfPrice, width/2 + border + (border * 5), (border + height/20 ) + (billBorder * i) + (border/2));
  
}