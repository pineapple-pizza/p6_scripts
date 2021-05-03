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
                user_id INTEGER,
                street VARCHAR(255),
                city VARCHAR(255),
                zip_code VARCHAR(255),
                country VARCHAR(255),
                CONSTRAINT user_id FOREIGN KEY (address_id)
					REFERENCES "user" (user_id)
					ON UPDATE NO ACTION ON DELETE NO ACTION)
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
                name VARCHAR(255),
                ing_stock VARCHAR(255),
                pizzeria_id INTEGER,
                CONSTRAINT pizzeria_id FOREIGN KEY (ing_id)
                    REFERENCES "pizzeria" (pizzeria_id)
                    ON UPDATE NO ACTION ON DELETE NO ACTION)
		""",
        """
            CREATE TABLE "pizzeria_catalog" (
                product_id SERIAL PRIMARY KEY,
                name VARCHAR(255),
                description VARCHAR(255),
                image VARCHAR(255),
                price VARCHAR(255),
                availability VARCHAR(255),
                ingredients INTEGER,
                CONSTRAINT ingredients FOREIGN KEY (product_id)
                    REFERENCES "ingredients_list" (ing_id)
                    ON UPDATE NO ACTION ON DELETE NO ACTION)
		""",
        """
            CREATE TABLE "orders" (
                order_id SERIAL PRIMARY KEY,
                product_id INTEGER,
                user_id INTEGER,
                pizzeria_id INTEGER,
                total_price VARCHAR(255),
                order_status VARCHAR(255),
                CONSTRAINT pizzeria_id FOREIGN KEY (order_id)
                    REFERENCES "pizzeria" (pizzeria_id)
                    ON UPDATE NO ACTION ON DELETE NO ACTION,
                CONSTRAINT user_id FOREIGN KEY (order_id)
                    REFERENCES "user" (user_id)
                    ON UPDATE NO ACTION ON DELETE NO ACTION,
                CONSTRAINT product_id FOREIGN KEY (order_id)
                    REFERENCES "pizzeria_catalog" (product_id)
                    ON UPDATE NO ACTION ON DELETE NO ACTION)
		""",
            """ CREATE TABLE "admin" (
                adm_id SERIAL PRIMARY KEY,
                name VARCHAR(255),
                password VARCHAR(255),
                email VARCHAR(255),
                pizzeria_id INTEGER,
                ing_id INTEGER,
                order_id INTEGER,
                CONSTRAINT ing_id FOREIGN KEY (adm_id)
					REFERENCES "ingredients_list" (ing_id)
					ON UPDATE NO ACTION ON DELETE NO ACTION,
                CONSTRAINT order_id FOREIGN KEY (adm_id)
					REFERENCES "orders" (order_id)
					ON UPDATE NO ACTION ON DELETE NO ACTION,
                CONSTRAINT pizzeria_id FOREIGN KEY (adm_id)
					REFERENCES "pizzeria" (pizzeria_id)
					ON UPDATE NO ACTION ON DELETE NO ACTION)
		""",
        """
            CREATE TABLE "pizzeria_emp" (
                pi_emp_id SERIAL PRIMARY KEY,
                name VARCHAR(255),
                password VARCHAR(255),
                email VARCHAR(255),
                pizzeria_id INTEGER,
                ing_id INTEGER,
                order_id INTEGER,
                CONSTRAINT ing_id FOREIGN KEY (pi_emp_id)
                    REFERENCES "ingredients_list" (ing_id)
                    ON UPDATE NO ACTION ON DELETE NO ACTION,
                CONSTRAINT order_id FOREIGN KEY (pi_emp_id)
                    REFERENCES "orders" (order_id)
                    ON UPDATE NO ACTION ON DELETE NO ACTION,
                CONSTRAINT pizzeria_id FOREIGN KEY (pi_emp_id)
                    REFERENCES "pizzeria" (pizzeria_id)
                    ON UPDATE NO ACTION ON DELETE NO ACTION)
		""",
        """
            CREATE TABLE "delivery" (
                order_del_id SERIAL PRIMARY KEY,
                order_id INTEGER,
                address_id INTEGER,
                delivery_status VARCHAR(255),
                CONSTRAINT address_id FOREIGN KEY (order_del_id)
                    REFERENCES "address" (address_id)
                    ON UPDATE NO ACTION ON DELETE NO ACTION,
                CONSTRAINT order_id FOREIGN KEY (order_del_id)
                    REFERENCES "orders" (order_id)
                    ON UPDATE NO ACTION ON DELETE NO ACTION)
		""",
        """
            CREATE TABLE "delivery_emp" (
                del_emp_id SERIAL PRIMARY KEY,
                name VARCHAR(255),
                password VARCHAR(255),
                email VARCHAR(255),
                order_del_id INTEGER,
                delivery_status VARCHAR(255),
                CONSTRAINT order_del_id FOREIGN KEY (order_del_id)
                    REFERENCES "delivery" (order_del_id)
                    ON UPDATE NO ACTION ON DELETE NO ACTION)
		""",
        """
            CREATE TABLE "recipe" (
                rec_id SERIAL PRIMARY KEY,
                name VARCHAR(255),
                description VARCHAR(255),
                pizzeria_id INTEGER,
                CONSTRAINT pizzeria_id FOREIGN KEY (rec_id)
                    REFERENCES "pizzeria" (pizzeria_id)
                    ON UPDATE NO ACTION ON DELETE NO ACTION)
		""")
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
