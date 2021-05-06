import psycopg2
from decouple import config


def create_tables():
    """ create tables in the PostgreSQL database"""

    commands = (
            """
		CREATE TABLE "user" (
			user_id SERIAL PRIMARY KEY,
			name VARCHAR(255),
            password VARCHAR(255),
            email VARCHAR(255))
		""",
            """ CREATE TABLE "address" (
				address_id SERIAL PRIMARY KEY,
                street VARCHAR(255),
                city VARCHAR(255),
                zip_code VARCHAR(255),
                country VARCHAR(255),
                user_id INTEGER REFERENCES "user" (user_id) ON DELETE CASCADE)
		""",
        """
            CREATE TABLE "pizzeria" (
                pizzeria_id SERIAL PRIMARY KEY,
                name VARCHAR(255),
                address VARCHAR(255),
                phone_number VARCHAR(255))
		""",
        """
            CREATE TABLE "ingredients_list" (
                ing_id SERIAL PRIMARY KEY,
                name VARCHAR(255))
		""",
        """
            CREATE TABLE "pizzeria_catalog" (
                product_id SERIAL PRIMARY KEY,
                name VARCHAR(255),
                description VARCHAR(255),
                image VARCHAR(255),
                price VARCHAR(255),
                availability VARCHAR(255),
                recipe VARCHAR(255))
		""",
          """
            CREATE TABLE "pizzeria_emp" (
                pi_emp_id SERIAL PRIMARY KEY,
                name VARCHAR(255),
                password VARCHAR(255),
                email VARCHAR(255),
                pizzeria_id INTEGER REFERENCES "pizzeria" (pizzeria_id) ON DELETE CASCADE)
		""",
        """
            CREATE TABLE "order" (
                order_id SERIAL PRIMARY KEY,
                created_at DATE NOT NULL DEFAULT CURRENT_DATE,
                user_id INTEGER REFERENCES "user" (user_id) ON DELETE CASCADE,
                pi_emp_id INTEGER REFERENCES "pizzeria_emp" (pi_emp_id) ON DELETE CASCADE,
                pizzeria_id INTEGER REFERENCES "pizzeria" (pizzeria_id) ON DELETE CASCADE,
                total_price VARCHAR(255),
                order_status VARCHAR(255))
		""",
        """
            CREATE TABLE "delivery_emp" (
                del_emp_id SERIAL PRIMARY KEY,
                name VARCHAR(255),
                password VARCHAR(255),
                email VARCHAR(255),
                order_id INTEGER REFERENCES "order" (order_id) ON DELETE CASCADE,
                address_id INTEGER REFERENCES "address" (address_id) ON DELETE CASCADE,
                availability VARCHAR(255))
		""",
        """
            CREATE TABLE "order_details" (
                order_det_id SERIAL PRIMARY KEY,
                order_id INTEGER REFERENCES "order" (order_id) ON DELETE CASCADE,
                product_id INTEGER REFERENCES "pizzeria_catalog" (product_id) ON DELETE CASCADE,
                quantity VARCHAR(255),
                price VARCHAR(255))
        """,
        """
            CREATE TABLE "requires_ingredients" (
                product_id INTEGER REFERENCES "pizzeria_catalog" (product_id) ON DELETE CASCADE,
                ing_id INTEGER REFERENCES "ingredients_list" (ing_id) ON DELETE CASCADE,
                quantity VARCHAR(255),
                ing_unity VARCHAR(255),
                PRIMARY KEY (product_id, ing_id))
        """,
        """
            CREATE TABLE "has_ingredients" (
                pizzeria_id INTEGER REFERENCES "pizzeria" (pizzeria_id) ON DELETE CASCADE,
                ing_id INTEGER REFERENCES "ingredients_list" (ing_id) ON DELETE CASCADE,
                quantity VARCHAR(255),
                PRIMARY KEY (pizzeria_id, ing_id))
        """
        )
    conn = None
    try:
        DB_HOST = config('DB_HOST')
        DB_USER = config('DB_USER')
        DB_PASSWORD = config('DB_PASSWORD')
        DB_NAME = config('DB_NAME')

     # connect to the PostgreSQL server
        conn = psycopg2.connect(
            dbname=DB_NAME, user=DB_USER, host=DB_HOST, password=DB_PASSWORD)
        cur = conn.cursor()
        # create table one by one
        for command in commands:
            cur.execute(command)
        # close communication with the PostgreSQL database server
        cur.close()
        # commit the changes
        conn.commit()
    except (Exception, psycopg2.DatabaseError) as error:
        print(error)
    finally:
        if conn is not None:
            conn.close()

if __name__ == '__main__':
    create_tables()
