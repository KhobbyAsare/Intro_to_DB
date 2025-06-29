import mysql.connector
from mysql.connector import Error


def create_database():
    connection = None
    try:
        # Connect to MySQL server without specifying a database
        connection = mysql.connector.connect(
            host="localhost",
            user="root",
            password="Samuel@123"
        )

        if connection.is_connected():
            cursor = connection.cursor()

            # Create database if it doesn't exist
            cursor.execute("CREATE DATABASE IF NOT EXISTS alx_book_store")
            print("Database 'alx_book_store' created successfully!")

    except Error as e:
        print(f"Error while connecting to MySQL: {e}")
    finally:
        # Close the connection properly
        if connection and connection.is_connected():
            cursor.close()
            connection.close()
            print("MySQL connection is closed")


if __name__ == "__main__":
    create_database()