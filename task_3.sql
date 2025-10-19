# Make sure you are using the database
mycursor.execute("USE alx_book_store;")

# List all tables
mycursor.execute("SHOW TABLES")

print("The tables for alx_book_store are as below:")
for table in mycursor.fetchall():
    print(table)
