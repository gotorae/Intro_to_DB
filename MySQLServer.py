import mysql.connector

try:
    # Try to connect to the MySQL server
    mydb = mysql.connector.connect(
        host="localhost",
        user="root",
        password="Watermelon123"
    )

    if mydb.is_connected():
        mycursor = mydb.cursor()

        # Create the database (won’t fail if it already exists)
        mycursor.execute("CREATE DATABASE IF NOT EXISTS alx_book_store")
        print("Database 'alx_book_store' created successfully!")

except mysql.connector.Error as err:
    # Handle connection or execution errors
    print(f"Error while connecting to MySQL: {err}")

finally:
    # Ensure proper closure of cursor and connection
    try:
        if mycursor:
            mycursor.close()
        if mydb.is_connected():
            mydb.close()
    except NameError:
        pass
