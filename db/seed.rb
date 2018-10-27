require './application'

User.dataset.delete
Festival.dataset.delete

user = User.create(email: 'oskar@example.com', handle: 'oskario')

f1 = Festival.create(name: 'Sonar', place: 'Barcelona')
f2 = Festival.create(name: 'Hospitality on the Beach', place: 'Tisno')

user.add_festival(f1)
user.add_festival(f2)

a = Artist.create(name: 'Mala')
Bio.create(artist_id: a.id, content: "As the boss of Deep Medi Musik and co-founder of DMZ, Mark Lawrence is one of the most respected men in the dubstep scene. In advance of his appearance at the Off Centre festival in Amsterdam, RA calls him up to chat 808s, dubplates and soundclashes.")

f2.add_artist(a)
