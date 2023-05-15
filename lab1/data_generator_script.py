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

    insert_sql = f"""insert into users (email, name, gender, dob, mobile_number, password, created_at, update_at) values ('{email}', '{first_name+last_name}', 'male', TO_DATE('YYYY-MM-DD', '1995-12-28'), '9841006259', 'test@123', now(), now())"""
    print(insert_sql)
    cursor.execute(insert_sql)
    print('SQL executed')


# Starting our inserting data script
conn = get_database_connection()
fake = Faker()

# inserting 100 random data for users table
for i in range(0, 100):
    insert_to_user_table(conn.cursor(), fake)
    conn.commit()
conn.close()


