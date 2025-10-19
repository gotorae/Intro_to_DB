import mysql.connector

# Connect to the database
mydb = mysql.connector.connect(
    host="localhost",
    user="root",
    password="Watermelon123"
)

# Create a cursor
mycursor = mydb.cursor()

#Create New database
mycursor.execute("CREATE DATABASE IF NOT EXISTS alx_book_store")

mycursor.execute("USE alx_book_store")

mycursor.execute("""
                 CREATE TABLE IF NOT EXISTS Authors ( 
                 author_id INT AUTO_INCREMENT PRIMARY KEY, 
                 author_name VARCHAR(215)
                 )
                 """);

print ("Authors table successfull created")

mycursor.execute("""
                 CREATE TABLE IF NOT EXISTS Books ( 
                 book_id INT AUTO_INCREMENT PRIMARY KEY, 
                 title VARCHAR(130), 
                 author_id INT, 
                 price DOUBLE,
                 publication_date DATE,
                 FOREIGN KEY (author_id) REFERENCES Authors(author_id)
                 )
                 """);

print ("Books table successfull created")

mycursor.execute("""
                 CREATE TABLE IF NOT EXISTS Customers ( 
                 customer_id INT AUTO_INCREMENT PRIMARY KEY, 
                 customer_name VARCHAR(215),
                 email VARCHAR(215),
                 address TEXT
                 )
                 """);

print ("Customers table successfull created")

mycursor.execute("""
                 CREATE TABLE IF NOT EXISTS Orders ( 
                 order_id INT AUTO_INCREMENT PRIMARY KEY, 
                 customer_id ,
                 order_date DATE,
                 FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
                 )
                 """);

print ("orders table successfull created")

mycursor.execute("""
                 CREATE TABLE IF NOT EXISTS Order_Details ( 
                 orderdetailid PRIMARY KEY, 
                 order_id FOREIGN KEY REFERENCES Orders(order_id),
                 Book_id FOREIGN KEY REFERENCES Books(book_id),
                 quantity DOUBLE,
                 FOREIGN KEY (order_id) REFERENCES Orders(order_id),
                 FOREIGN KEY (book_id) REFERENCES Books(book_id)
                 )
                 """);

print ("order_details table successfull created")

mycursor.close()
mydb.close()

print("Database connection closed.")