require './application'

User.dataset.delete
Festival.dataset.delete

user = User.create(email: 'oskar@example.com', handle: 'oskario')

f1 = Festival.create(name: 'Sonar', place: 'Barcelona')
f2 = Festival.create(name: 'Hospitality on the Beach', place: 'Tisno')

user.add_festival(f1)
user.add_festival(f2)
