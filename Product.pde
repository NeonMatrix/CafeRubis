class Product
{
 String name;
 float price;
 String sprice;
 
 Product(TableRow row)
 {
   name = row.getString("Name");
   price = row.getFloat("Price");
 }
  
  
}