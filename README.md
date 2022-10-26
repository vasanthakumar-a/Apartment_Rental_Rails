#Prerequisites
The setups steps expect following tools installed on the system.

    *Github
    *Ruby 3.0.4
    *Rails 6.1.7

1. Check out the repository
```
  $ git clone github.com/vasanthakumar-a/Apartment_Rental_Rails.git
```
2. Create and setup the database

Run the following commands to create and setup the database.
```
  $ rails db:create:all
  $ rails db:migrate
```
3. Start the Rails server
You can start the rails server using the command given below.
```
   $ rails server
```
And now you can visit the site with the URL http://localhost:3000
4. Signup as Owner with three accounts
5. Run the following command in console to generate 100 fake data in database
```
  $ rails db:seed
```
Now you can see a 100 fake data to test the code
