# Models


1. User
2. Book
3. Notes


## User
- has_many :books
- has_many :notes

#### Database
- username
- first_name
- last_name
- password_digest

## Book
 - has_many :notes
 - belongs_to :user 

 #### Database 
 - title
 - author

 ## Note
 - belongs_to :user
 - belongs_to :book
 
 #### Database
 - body

-------------------------------------------------------

Goals:
 - Users 
   - User should able to add new  book
   - user should be able to add notes to that book
   - login
   - logout
   - sign up
   - user can see their profile 
   - total book count
   - total notes count
   - total notes count for each book