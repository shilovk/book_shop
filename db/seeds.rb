pp User.create(name: 'admin', email: 'admin@admin.com', password: '123456')
pp user = User.create(name: 'user', email: 'user@user.com', password: '123456')
pp other_user = User.create(name: 'other_user', email: 'other_user@user.com', password: '123456')

pp publisher = Publisher.create!(name: 'publisher')
pp other_publisher = Publisher.create!(name: 'other_publisher')

pp book1 = Book.create!(title: 'book1', publisher: publisher)
pp book2 = Book.create!(title: 'book2', publisher: publisher)
pp book3 = Book.create!(title: 'book3', publisher: publisher)
pp book4 = Book.create!(title: 'book4', publisher: publisher)
pp book5 = Book.create!(title: 'book5', publisher: other_publisher)
pp book6 = Book.create!(title: 'book6', publisher: other_publisher)
pp book7 = Book.create!(title: 'book7', publisher: other_publisher)
pp book8 = Book.create!(title: 'book8', publisher: other_publisher)

pp shop1 = Shop.create!(name: 'shop1')
pp shop2 = Shop.create!(name: 'shop2')
