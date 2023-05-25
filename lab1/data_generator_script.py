from faker import Faker
import psycopg2 

def get_database_connection():
    db_connection = psycopg2.connect(
        dbname='nist',
        user='postgres',
        password='postgres',
        host='localhost',
        port=5432
    )
    return db_connection
   
def insert_to_user_table(cursor, fake):
    import random
    gender = ['male', 'female', 'others']
    first_name = fake.first_name()
    last_name = fake.last_name()
    company = fake.company().split()[0].strip(',')
    dns_org = 'com'
    email = f"{first_name}.{last_name}@{company}.{dns_org}".lower()
    random_dob = fake.date_between(start_date='today', end_date='+30y')

    insert_sql = f"""insert into users (email, name, gender, dob, mobile_number, password, created_at, update_at) values ('{email}', '{first_name+last_name}', '{random.choice(gender)}', TO_DATE('YYYY-MM-DD', '{str(fake.date_between(start_date='today', end_date='+30y'))}'), '9841{random.randint(100000,999999)}', 'test@123', now(), now())"""
    print(insert_sql)
    cursor.execute(insert_sql)
    print('SQL executed')

def insert_to_user_device_token_table(cursor, fake):
    import random
    import uuid
    user_id = random.randint(1, 100)
    device_token = uuid.uuid4()
    insert_sql = f"""insert into user_device_tokens (user_id, device_token, created_at, updated_at) values ('{user_id}', '{device_token}', now(), now())"""
    print(insert_sql)
    cursor.execute(insert_sql)
    print('SQL executed')



# Starting our inserting data script
conn = get_database_connection()
fake = Faker()

# inserting 100 random data for users table
def insert_data_into_users():
    for i in range(0, 100):
        insert_to_user_table(conn.cursor(), fake)
        conn.commit()

def insert_data_into_user_device_token():
    for i in range(0, 100):
        insert_to_user_device_token_table(conn.cursor(), fake)
        conn.commit()

# def insert_data_into_grades():

# def insert_data_into_students():


# def insert_data_into_parents():


# def insert_data_into_teachers():


# def insert_data_into_subjects():





conn.close()


