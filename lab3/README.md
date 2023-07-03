### Lab 3: MongoDB 

### Prerequisites
1. Install mongo compass tool
2. Create an account in mongo atlas
3. Create a new database in mongo atlas
4. Set a username and password (or use the one provided by mongo atlas).
5. Update the network access to 0.0.0.0/0 to provide access from everywhere. (never do this in production)
6. Connect to mongodb using mongo compass.

### Part 1: DDL's
- Using mongo compass mongosh terminal, perform following activities:
1. Create a collection named users
2. Insert any json value to the created collection
3. Update the recently insert value and add a new data, join_data as current date. 
4. Drop the join_date key/value from the collection.
5. List out the users whose age is not equal to 22.
6. Sort the data via age.
7. Find the total count of users.
8. Find the distict age values of users.
9. Delete the user with age 27.

### Part 2: Load the data from this github link: https://github.com/ozlerhakan/mongodb-json-files/tree/master for following collections
1. Books
2. Companies
3. Gradeds
4. Products
5. Resturants
6. Students

### Part 2, Questions:
1. Find the total count of books having more than one authors.
2. Find the list of books that contains keyword Rails in book's title.
3. Get the distinct list of emails of all the companies.
4. Find the list of resturnats that serves Thai food.
5. Find the list of resturnats that servers Chinese food and the rating of resturant is not less than 4.5.
6. Find the list fo resturnats that has 5/5 rating.

