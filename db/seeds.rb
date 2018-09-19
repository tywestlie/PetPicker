# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Message.delete_all
Connection.delete_all
Pet.delete_all
User.delete_all

ActiveRecord::Base.connection.reset_pk_sequence!('users')
ActiveRecord::Base.connection.reset_pk_sequence!('pets')
ActiveRecord::Base.connection.reset_pk_sequence!('connections')
ActiveRecord::Base.connection.reset_pk_sequence!('messages')

user1 = User.create(name: 'admin', species_to_adopt: 1, search_radius: 5, lat: 33.3, lng: 44.4, role: 3, password: 'admin', pic: "https://pre00.deviantart.net/4353/th/pre/i/2016/019/a/c/the_shadowy_figure_by_baptismonfire-d9okwzz.jpg", description: "I love adminstration!")
user2 = User.create(name: 'Theresa', species_to_adopt: 0, search_radius: 5, lat: 33.3, lng: 44.4, role: "adopter", password: '123', pic: "https://avatars2.githubusercontent.com/u/25600007?s=400&v=4", description: "I absolutely love pups!")
user3 = User.create(name: 'Steven Tyler', species_to_adopt: 2, search_radius: 5, lat: 33.3, lng: 44.4, role: "adopter", password: '123', pic: "http://www.bostonherald.com/sites/default/files/styles/gallery/public/media/ap/2017/09/27/af1557473b8544a6b0727d1925f3932a.jpg?itok=ja2YPvam", description: "Gimme your puppies!")
user4 = User.create(name: 'Puppy-boi', species_to_adopt: 1, search_radius: 5, lat: 33.3, lng: 44.4, role: "owner", password: '123', pic: "https://media.giphy.com/media/l3q2QUbUAXIDvI0IE/giphy.gif", description: "I like snakes!")
user5 = User.create(name: 'a', species_to_adopt: 1, search_radius: 5, lat: 33.3, lng: 44.4, role: "adopter", password: 'a', pic: "https://media.giphy.com/media/l3q2QUbUAXIDvI0IE/giphy.gif", description: "I like apes!")
user6 = User.create(name: 'b', species_to_adopt: 1, search_radius: 5, lat: 33.3, lng: 44.4, role: "adopter", password: 'b', pic: "https://media.giphy.com/media/l3q2QUbUAXIDvI0IE/giphy.gif", description: "I like bats!")
user7 = User.create(name: 'c', species_to_adopt: 1, search_radius: 5, lat: 33.3, lng: 44.4, role: "adopter", password: 'c', pic: "https://media.giphy.com/media/l3q2QUbUAXIDvI0IE/giphy.gif", description: "I like cats!")



pet1 = Pet.create(name: "Wanda", pic: "https://www.cesarsway.com/sites/newcesarsway/files/styles/large_article_preview/public/All-about-puppies--Cesar%E2%80%99s-tips%2C-tricks-and-advice.jpg?itok=bi9xUvwe", species: "dog", user: user4, description: "Doggo ipsum heckin angery woofer wow such tempt fluffer corgo borking doggo such treat, heckin puggo very good spot woofer, such treat waggy wags he made many woofs noodle horse.")
pet2 = Pet.create(name: "Bongo", pic: "https://static.scientificamerican.com/sciam/cache/file/D059BC4A-CCF3-4495-849ABBAFAED10456.jpg?w=590&h=393&526ED1E1-34FF-4472-B348B8B4769AB2A1", species: "dog", user: user4, description: "Doggo ipsum heckin angery woofer wow such tempt fluffer corgo borking doggo such treat, heckin puggo very good spot woofer, such treat waggy wags he made many woofs noodle horse.")
pet3 = Pet.create(name: "Barron Von Wonderpants", pic: "https://i.ytimg.com/vi/lCCWQ6ziAyc/hqdefault.jpg", species: "dog", user: user4, description: "Doggo ipsum heckin angery woofer wow such tempt fluffer corgo borking doggo such treat, heckin puggo very good spot woofer, such treat waggy wags he made many woofs noodle horse.")
pet4 = Pet.create(name: "Jimmy", pic: "https://parade.com/wp-content/uploads/2018/03/golden-puppy-life-national-geographic-ftr.jpg", species: "dog", user: user4, description: "Doggo ipsum heckin angery woofer wow such tempt fluffer corgo borking doggo such treat, heckin puggo very good spot woofer, such treat waggy wags he made many woofs noodle horse.")
pet5 = Pet.create(name: "Edward Shortshanks", pic: "https://img.buzzfeed.com/buzzfeed-static/static/2015-12/17/19/campaign_images/webdr14/21-puppies-who-absolutely-cannot-be-trusted-2-11411-1450397896-0_dblbig.jpg", species: "dog", user: user4, description: "Doggo ipsum heckin angery woofer wow such tempt fluffer corgo borking doggo such treat, heckin puggo very good spot woofer, such treat waggy wags he made many woofs noodle horse.")
pet6 = Pet.create(name: "DoodleButt", pic: "https://www.popsci.com/sites/popsci.com/files/styles/1000_1x_/public/images/2017/10/terrier-puppy.jpg?itok=rIgh3ArV&fc=50,50", species: "dog", user: user4, description: "Doggo ipsum heckin angery woofer wow such tempt fluffer corgo borking doggo such treat, heckin puggo very good spot woofer, such treat waggy wags he made many woofs noodle horse.")
pet7 = Pet.create(name: "Gonzo", pic: "https://cosmos-magazine.imgix.net/file/spina/photo/10822/170621-Puppy-Full.jpg?fit=clip&w=835", species: "dog", user: user4, description: "Doggo ipsum heckin angery woofer wow such tempt fluffer corgo borking doggo such treat, heckin puggo very good spot woofer, such treat waggy wags he made many woofs noodle horse.")
pet8 = Pet.create(name: "Frog", pic: "https://cdn2-www.dogtime.com/assets/uploads/2015/05/file_21702_impossibly-cute-puppy-30-460x306.jpg", species: "dog", user: user4, description: "Doggo ipsum heckin angery woofer wow such tempt fluffer corgo borking doggo such treat, heckin puggo very good spot woofer, such treat waggy wags he made many woofs noodle horse.")
pet9 = Pet.create(name: "Snudle", pic: "https://kids.nationalgeographic.com/content/dam/kids/photos/animals/Bugs/Q-Z/tarantula-closeup-hand.adapt.945.1.jpg", species: "dog", user: user4, description: "I just love cuddlin'!")
pet10 = Pet.create(name: "Ralph", pic: "https://static1.squarespace.com/static/53a096cce4b00d7644776a0b/544d5f5ce4b0b7c1dfbfb70e/544d5fb8e4b048f0ef614dae/1414356922235/Shake+Puppies-1_Mixbreed.jpg?format=1500w", species: "dog", user: user4, description: "Doggo ipsum heckin angery woofer wow such tempt fluffer corgo borking doggo such treat, heckin puggo very good spot woofer, such treat waggy wags he made many woofs noodle horse.")
pet11 = Pet.create(name: "Detective Jones", pic: "https://alum.mit.edu/sites/default/files/styles/article_desktop/public/images/12.07.17_PuppyLab_Killian5.jpg?h=dec22bcf&itok=mfDFQDki", species: "dog", user: user4, description: "Doggo ipsum heckin angery woofer wow such tempt fluffer corgo borking doggo such treat, heckin puggo very good spot woofer, such treat waggy wags he made many woofs noodle horse.")
pet12 = Pet.create(name: "Snarf", pic: "https://animals.sandiegozoo.org/sites/default/files/2016-11/animals_hero_cobra.jpg", species: "dog", user: user4, description: "I'm not poisonous. I swear!")
pet13 = Pet.create(name: "Balto", pic: "https://static.boredpanda.com/blog/wp-content/uploads/2016/02/big-cute-eyes-cat-black-scottish-fold-gimo-1room1cat-fb.png", species: "dog", user: user4, description: "Doggo ipsum heckin angery woofer wow such tempt fluffer corgo borking doggo such treat, heckin puggo very good spot woofer, such treat waggy wags he made many woofs noodle horse.")
pet14 = Pet.create(name: "Stingy", pic: "https://c1.staticflickr.com/1/507/31188885364_a196984f46_b.jpg", species: "dog", user: user4, description: "I just love stingin'!")
pet15 = Pet.create(name: "Turbo", pic: "https://www.top13.net/wp-content/uploads/2015/10/perfectly-timed-cat-photos-funny-cover.jpg", species: "dog", user: user4, description: "You'll never catch me")
pet16 = Pet.create(name: "Tuty", pic: "https://www.cesarsway.com/sites/newcesarsway/files/styles/large_article_preview/public/Cesars-Today-Top-Ten-Puppy-Tips.jpg?itok=T2AuVJHq", species: "dog", user: user4, description: "Doggo ipsum heckin angery woofer wow such tempt fluffer corgo borking doggo such treat, heckin puggo very good spot woofer, such treat waggy wags he made many woofs noodle horse.")
pet17 = Pet.create(name: "Sharky", pic: "http://www.stylisheve.com/wp-content/uploads/2014/09/Adorable-Puppies-Swimming-Underwater-9.jpg", species: "dog", user: user4, description: "Doggo ipsum heckin angery woofer wow such tempt fluffer corgo borking doggo such treat, heckin puggo very good spot woofer, such treat waggy wags he made many woofs noodle horse.")
pet18 = Pet.create(name: "Bobo", pic: "https://ctbreeder.com/wp-content/uploads/2014/04/puppy-store.jpg", species: "dog", user: user4, description: "Doggo ipsum heckin angery woofer wow such tempt fluffer corgo borking doggo such treat, heckin puggo very good spot woofer, such treat waggy wags he made many woofs noodle horse. ")
pet19 = Pet.create(name: "Dr Clement Laquois", pic: "https://gfnc1kn6pi-flywheel.netdna-ssl.com/wp-content/uploads/2018/03/best-food-for-golden-retriever-puppies-header.jpg", species: "dog", user: user4, description: "Doggo ipsum heckin angery woofer wow such tempt fluffer corgo borking doggo such treat, heckin puggo very good spot woofer, such treat waggy wags he made many woofs noodle horse.")

Connection.create(status: 'match', adopter: user2, pet: pet2)
Connection.create(status: 'match', adopter: user3, pet: pet3)
Connection.create(status: 'match', adopter: user2, pet: pet4)
Connection.create(status: 'nope', adopter: user3, pet: pet5)
Connection.create(status: 'nope', adopter: user2, pet: pet6)
Connection.create(status: 'nope', adopter: user3, pet: pet7)
Connection.create(status: 'like', adopter: user2, pet: pet8)
Connection.create(status: 'like', adopter: user3, pet: pet9)
Connection.create(status: 'like', adopter: user2, pet: pet10)
