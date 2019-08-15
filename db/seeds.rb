# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

gita = User.create(username: "git69", first_name: "Gitanjali", last_name: "Mule", password: "password")

book1 = gita.books.create(title: "Sita : Warrior of Mithila", author: "Amish")
book2 = gita.books.create(title: "Sapiens: A Brief History of Humankind" , author: "Yuval Noad Harari")

note1 = book1.notes.create(content: "You will need to be mature and pragmatic. You must use your heart to decide the destination, but use your head to plot the journey." , user_id: 1)
note2 = book1.notes.create(content: "A society must always aim for balance. It needs intellectuals, it needs warriors, it needs traders, it needs artists, and it needs skilled workers. If it empowers one group too much or another too little, it is headed for chaos.", user_id: 1)
note3 = book1.notes.create(content: "You will need to be mature and pragmatic. You must use your heart to decide the destination, but use your head to plot the journey. People who only listen to their hearts usually fail. On the other hand, people who only use their heads tend to be selfish.",  user_id: 1)
note4 = book2.notes.create(content: "Culture tends to argue that it forbids only that which is unnatural. But from a biological perspective, nothing is unnatural. Whatever is possible is by definition also natural. A truly unnatural behaviour, one that goes against the laws of nature, simply cannot exist, so it would need no prohibition.", user_id: 1)
note5 = book2.notes.create(content: "One of history’s few iron laws is that luxuries tend to become necessities and to spawn new obligations." ,user_id: 1)

