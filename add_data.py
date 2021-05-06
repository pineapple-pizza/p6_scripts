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
    
    user_data = (faker.name(), faker.word(), faker.email())
    address_data = (7, faker.word(), faker.word(), faker.random_int(0, 10), faker.word())
    pizzeria_data = (faker.name(), faker.address(), faker.phone_number())
    ing_data = ['poivron']
    cat_data = (faker.name(), "description", "pizza.png", faker.random_int(), faker.word(), "super cool recette")
    pi_emp_data = (faker.name(), faker.word(), faker.email(), 3)
    orders_data = (5, 3, faker.random_int(0, 10), 1, "status")
    del_emp_data = (faker.name(), faker.word(), faker.email(), 1, 5, "availability")
    ord_det_data = (1, 1, faker.random_number(digits=1), faker.random_int(0, 10))
    req_ing_data = (1, 1, faker.random_number(digits=1), 100)
    has_ing_data = (3, 1, 50)
    
    query_user_tb = """INSERT INTO "user"(name,password,email) VALUES (%s,%s,%s)"""
    query_address_tb = """INSERT INTO "address"(user_id,street,city, zip_code, country) VALUES (%s,%s,%s,%s,%s)"""
    query_pizzeria_tb = """INSERT INTO "pizzeria"(name,address,phone_number) VALUES (%s,%s,%s)"""
    query_ing_tb = """INSERT INTO "ingredients_list"(name) VALUES (%s)"""
    query_cat_tb = """INSERT INTO "pizzeria_catalog"(name,description,image, price, availability, recipe) VALUES (%s,%s,%s,%s,%s,%s)"""
    query_pi_emp_tb = """INSERT INTO "pizzeria_emp"(name, password, email, pizzeria_id) VALUES (%s,%s,%s,%s)"""
    query_orders_tb = """INSERT INTO "order"(user_id,pizzeria_id, total_price, pi_emp_id, order_status) VALUES (%s,%s,%s,%s,%s)"""
    query_del_emp_tb = """INSERT INTO "delivery_emp"(name, password, email, order_id, address_id, availability) VALUES (%s,%s,%s,%s,%s,%s)"""
    query_ord_det_tb = """INSERT INTO "order_details"(order_id, product_id, quantity, price) VALUES (%s,%s,%s,%s)"""
    query_req_ing_tb = """INSERT INTO "requires_ingredients"(product_id, ing_id, ing_unity, quantity) VALUES (%s,%s,%s,%s) """
    query_has_ing_tb = """INSERT INTO "has_ingredients"(pizzeria_id, ing_id, quantity) VALUES (%s,%s,%s)"""

    cur.execute(query_user_tb, user_data)
    cur.execute(query_address_tb, address_data)
    cur.execute(query_pizzeria_tb, pizzeria_data)
    cur.execute(query_ing_tb, ing_data)
    cur.execute(query_cat_tb, cat_data)
    cur.execute(query_pi_emp_tb, pi_emp_data)
    cur.execute(query_orders_tb, orders_data)
    cur.execute(query_del_emp_tb, del_emp_data)
    cur.execute(query_ord_det_tb, ord_det_data)
    # cur.execute(query_req_ing_tb, req_ing_data)
    cur.execute(query_has_ing_tb, has_ing_data)
    
    cur.close()

    conn.commit()
except (Exception, psycopg2.DatabaseError) as error:
    print(error)
finally:
    if conn is not None:
        conn.close()
