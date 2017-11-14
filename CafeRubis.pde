// Povilas Kubilius C16370803


void setup()
{
 size(800,600); 
 loadData();
 
}

ArrayList<Product> cafes = new ArrayList<Product>();
ArrayList<Product> bill = new ArrayList<Product>();

void loadData()
{
  Table table = loadTable("cafe.csv", "header");
  
  for(TableRow r : table.rows())
  {
     Product cafe = new Product(r);
     cafes.add(cafe);
  }
  
}

void draw()
{
 background(0); 
 
 
}

void printProducts()
{
  
}