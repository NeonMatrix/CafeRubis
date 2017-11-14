// Povilas Kubilius C16370803


void setup()
{
 size(800,600); 
 loadData();
 printProducts();
}

ArrayList<Product> cafes = new ArrayList<Product>();
ArrayList<Product> bill = new ArrayList<Product>();

float border = width/10;

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
 displayProducts();
 
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

void displayProducts()
{  
  rect(border, border, width/5, height/10);
    
}