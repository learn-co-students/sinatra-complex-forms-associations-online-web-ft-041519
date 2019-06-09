# Add seed data here. Seed your database with `rake db:seed`
#the code in the seed file will be executed, inserting some sample data into your database.
sophie = Owner.create(name: "Sophie")
Pet.create(name: "Maddy", owner: sophie)
Pet.create(name: "Nona", owner: sophie)
