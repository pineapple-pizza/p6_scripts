import psycopg2
from decouple import config
from faker import Faker

try:
    faker = Faker()
    
    DB_HOST = config('DB_HOST')
    DB_USER = config('DB_USER')
    DB_PASSWORD = config('DB_PASSWORD')
    DB_NAME = config('DB_NAME')


    conn = psycopg2.connect(
        dbname=DB_NAME, user=DB_USER, host=DB_HOST, password=DB_PASSWORD)
    cur = conn.cursor()

    test = faker.random_number(digits=1)
    print(test)
    
    user_data = (faker.name(), faker.word(), faker.word())
    address_data = (3, faker.word(), faker.word(), faker.random_int(0, 10), faker.word())
    pizzeria_data = (faker.name(), faker.address(), faker.phone_number())
    ing_data = (faker.name(), faker.random_int(), faker.random_number(digits=1))
    cat_data = (faker.name(), faker.word(), faker.word(), faker.random_int(), faker.word(), faker.random_number(digits=1))
    orders_data = (faker.random_number(digits=1), faker.random_number(digits=1), faker.random_number(digits=1), faker.word(), faker.word())
    admin_data = (faker.name(), faker.word(), faker.word(), faker.random_number(digits=1), faker.random_number(digits=1), faker.random_number(digits=1))
    pi_emp_data = (faker.name(), faker.word(), faker.word(), faker.random_number(digits=1), faker.random_number(digits=1), faker.random_number(digits=1))
    del_data = (faker.random_number(digits=1), faker.random_number(digits=1), faker.word())
    del_emp_data = (faker.name(), faker.word(), faker.word(), faker.random_number(digits=1), faker.word())
    recipe_data = (faker.name(), faker.word(), faker.random_number(digits=1))
    
    query_user_tb = """INSERT INTO "user"(name,password,email) VALUES (%s,%s,%s)"""
    query_address_tb = """INSERT INTO "address"(user_id,street,city, zip_code, country) VALUES (%s,%s,%s,%s,%s)"""
    query_pizzeria_tb = """INSERT INTO "pizzeria"(name,address,phone_number) VALUES (%s,%s,%s)"""
    query_ing_tb = """INSERT INTO "ingredients_list"(name,ing_stock,pizzeria_id) VALUES (%s,%s,%s)"""
    query_cat_tb = """INSERT INTO "pizzeria_catalog"(name,description,image, price, availability, ingredients) VALUES (%s,%s,%s,%s,%s,%s)"""
    query_orders_tb = """INSERT INTO "orders"(product_id,user_id,pizzeria_id, total_price, order_status) VALUES (%s,%s,%s,%s,%s)"""
    query_admin_tb = """INSERT INTO "admin"(name, password, email, pizzeria_id, ing_id, order_id) VALUES (%s,%s,%s,%s,%s,%s)"""
    query_pi_emp_tb = """INSERT INTO "pizzeria_emp"(name, password, email, pizzeria_id, ing_id, order_id) VALUES (%s,%s,%s,%s,%s,%s)"""
    query_del_tb = """INSERT INTO "delivery"(order_id, address_id, delivery_status) VALUES (%s,%s,%s)"""
    query_del_emp_tb = """INSERT INTO "delivery_emp"(name, password, email, order_del_id, delivery_status) VALUES (%s,%s,%s,%s,%s)"""
    query_rec_tb = """INSERT INTO "recipe"(name, description, pizzeria_id) VALUES (%s,%s,%s)"""

    cur.execute(query_user_tb, user_data)
    cur.execute(query_address_tb, address_data)
    cur.execute(query_pizzeria_tb, pizzeria_data)
    cur.execute(query_ing_tb, ing_data)
    cur.execute(query_cat_tb, cat_data)
    cur.execute(query_orders_tb, orders_data)
    cur.execute(query_admin_tb, admin_data)
    cur.execute(query_pi_emp_tb, pi_emp_data)
    cur.execute(query_del_tb, del_data)
    cur.execute(query_del_emp_tb, del_emp_data)
    cur.execute(query_rec_tb, recipe_data)
    
    cur.close()

    conn.commit()
except (Exception, psycopg2.DatabaseError) as error:
    print(error)
finally:
    if conn is not None:
        conn.close()
