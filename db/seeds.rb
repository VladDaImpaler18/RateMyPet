# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.new([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.new(name: 'Luke', movie: movies.first)

#Rando Users
if User.count.zero?
    5.times do
      User.create(
        :email => FFaker::Internet.safe_email,
        :username => FFaker::Internet.user_name,
        :password => FFaker::Internet.password,
        :last_sign_in_at => FFaker::Time.datetime
      ).encrypted_password
    end
  end
#User to test  
User.create(
  :email => "student@flatiron.com",
  :username => "GenericKid",
  :password => "test1234"
).encrypted_password

# Category(id: integer, animal_type: string, created_at: datetime, updated_at: datetime) 
Category.create(
  :animal_type => "Dog"
)
Category.create(
  :animal_type => "Cat"
)
Category.create(
  :animal_type => "Bird"
)
Category.create(
  :animal_type => "Exotic"
)
# Dogs => { Brian the Family Guy Dog.jpg, Courage The Cowardly Dog.jpg,
#          Pluto the Dog.jpg, Ren Hoek.jpg, Santa's Little Helper.jpeg, Scooby Doo.jpg }

p = Picture.new(
  :title => "Brian",
  :created_at => FFaker::Time.datetime,
  :user_id => 1,
  :category_id => 1,
  :description => "Brian the dog from Family Guy!"
)
p.image.attach(
  io: File.open(Rails.root.join('db', 'seed_pictures','Brian the Family Guy Dog.jpg')),
  filename: 'Brian the Family Guy Dog.jpg',
  content_type: "image/jpg"
)
p.save

p = Picture.new(
  :title => "Courage The Cowardly Dog",
  :created_at => FFaker::Time.datetime,
  :user_id => 1,
  :category_id => 1,
  :description => "A cowardice dog ironically named Courage, that will so anything to save his family to no credit. What a good boy!"
)
p.image.attach(
  :io => File.open(Rails.root.join('db', 'seed_pictures','Courage The Cowardly Dog.jpg')),
  :filename => 'Courage The Cowardly Dog.jpg',
  :content_type => "image/jpg"
)
p.save

p = Picture.new(
  :title => "Pluto",
  :created_at => FFaker::Time.datetime,
  :user_id => 1,
  :category_id => 1,
  :description => "A picture of Pluto, Disney don't sue plzkthxbye"
)
p.image.attach(
  io: File.open(Rails.root.join('db', 'seed_pictures','Pluto the Dog.jpg')),
  filename: 'Pluto the Dog.jpg',
  content_type: "image/jpg"
)
p.save

p = Picture.new(
  :title => "Ren Hoek",
  :created_at => FFaker::Time.datetime,
  :user_id => 2,
  :category_id => 1,
  :description => "Ren from Ren & Stimpy. Ren has a last name, who knew?"
)
p.image.attach(
  io: File.open(Rails.root.join('db', 'seed_pictures','Ren Hoek.jpg')),
  filename: 'Ren Hoek.jpg',
  content_type: "image/jpg"
)
p.save

p = Picture.new(
  :title => "Santa's Little Helper",
  :created_at => FFaker::Time.datetime,
  :user_id => 2,
  :category_id => 1,
  :description => "Santa's Little Helper from The Simpsons"
)
p.image.attach(
  io: File.open(Rails.root.join('db', 'seed_pictures',"Santa's Little Helper.jpeg")),
  filename: "Santa's Little Helper.jpeg",
  content_type: "image/jpeg"
)
p.save

p = Picture.new(
  :title => "Scooby Doo",
  :created_at => FFaker::Time.datetime,
  :user_id => 1,
  :category_id => 1,
  :description => "Scooby 'Doobie' Doo... Probably one of the most famous cartoon dogs ever"
)
p.image.attach(
  io: File.open(Rails.root.join('db', 'seed_pictures','Scooby Doo.jpg')),
  filename: 'Scooby Doo.jpg',
  content_type: "image/jpg"
)
p.save
# Cat => { Felix the Cat.jpg, Stimpy the Cat.jpg, Garfield.jpeg, Hobbes the Tiger.jpeg }

p = Picture.new(
  :title => "Felix the Cat",
  :created_at => FFaker::Time.datetime,
  :user_id => 3,
  :category_id => 2,
  :description => "Felix the Cat, did it ever talk? I had a clock that was this."
)
p.image.attach(
  io: File.open(Rails.root.join('db', 'seed_pictures','Felix the Cat.jpg')),
  filename: 'Felix the Cat.jpg',
  content_type: "image/jpg"
)
p.save

p = Picture.new(
  :title => "Stimpy",
  :created_at => FFaker::Time.datetime,
  :user_id => 3,
  :category_id => 2,
  :description => "Stimpy is a stupid 'eediot' from the wierd and crazy show Ren & Stimpy. Stimpy has no last name"
)
p.image.attach(
  io: File.open(Rails.root.join('db', 'seed_pictures','Stimpy the Cat.jpg')),
  filename: 'Stimpy the Cat.jpg',
  content_type: "image/jpg"
)
p.save

p = Picture.new(
  :title => "Garfield",
  :created_at => FFaker::Time.datetime,
  :user_id => 3,
  :category_id => 2,
  :description => "Hates Mondays, Loves lasagna"
)
p.image.attach(
  io: File.open(Rails.root.join('db', 'seed_pictures','Garfield.jpeg')),
  filename: 'Garfield.jpeg',
  content_type: "image/jpeg"
)
p.save

p = Picture.new(
  :title => "Hobbes",
  :created_at => FFaker::Time.datetime,
  :user_id => 4,
  :category_id => 2,
  :description => "Best friend to Calvin, Hobbes is the pet friend everyone wants. Considered to be one of the founders of modern political philosophy"
)
p.image.attach(
  io: File.open(Rails.root.join('db', 'seed_pictures','Hobbes the Tiger.jpeg')),
  filename: 'Hobbes the Tiger.jpeg',
  content_type: "image/jpeg"
)
p.save

# Bird => { African Gray.jpg, Foghorn Leghorn.jpg, Macaw.jpg }

p = Picture.new(
  :title => "Penguin",
  :created_at => FFaker::Time.datetime,
  :user_id => 3,
  :category_id => 3,
  :description => "Penguin is the name of our African Gray, they live for like 90 years."
)
p.image.attach(
  io: File.open(Rails.root.join('db', 'seed_pictures','African Gray.jpg')),
  filename: 'African Gray.jpg',
  content_type: "image/jpg"
)
p.save

p = Picture.new(
  :title => "Foghorn Leghorn",
  :created_at => FFaker::Time.datetime,
  :user_id => 4,
  :category_id => 3,
  :description => "I SAY I SAY I SAY!"
)
p.image.attach(
  io: File.open(Rails.root.join('db', 'seed_pictures','Foghorn Leghorn.jpg')),
  filename: 'Foghorn Leghorn.jpg',
  content_type: "image/jpg"
)
p.save

p = Picture.new(
  :title => "Wacmaw the Mawcaw",
  :created_at => FFaker::Time.datetime,
  :user_id => 5,
  :category_id => 3,
  :description => "Mawcaws are endangered, very pretty, and loud af"
)
p.image.attach(
  io: File.open(Rails.root.join('db', 'seed_pictures','Macaw.jpg')),
  filename: 'Macaw.jpg',
  content_type: "image/jpg"
)
p.save

# exotic => { Alpaca.jpg }

p = Picture.new(
  :title => "Teddy",
  :created_at => FFaker::Time.datetime,
  :user_id => 5,
  :category_id => 4,
  :description => "Teddums doesn't like the hair on his head touched. He's emo."
)
p.image.attach(
  io: File.open(Rails.root.join('db', 'seed_pictures','Alpaca.jpg')),
  filename: 'Alpaca.jpg',
  content_type: "image/jpg"
)
p.save

# USER_ID 6 --> (student@flatiron.com, test1234) => { Mako Being Insane.jpg, Mako Puppy.jpg }
p = Picture.new(
  :title => "Crazy Boi Mako",
  :created_at => FFaker::Time.datetime,
  :user_id => 6,
  :category_id => 1,
  :description => "An attempt to take a family photo, and Mako making faces sort of like Calvin from Calvin & Hobbes"
)
p.image.attach(
  io: File.open(Rails.root.join('db', 'seed_pictures','Mako Being Insane.jpg')),
  filename: 'Mako Being Insane.jpg',
  content_type: "image/jpg"
)
p.save

p = Picture.new(
  :title => "Mako is wayyyy to cute",
  :created_at => FFaker::Time.datetime,
  :user_id => 6,
  :category_id => 1,
  :description => "This picture is insanely adorable. Look at him!!!!"
)
p.image.attach(
  io: File.open(Rails.root.join('db', 'seed_pictures','Mako Puppy.jpg')),
  filename: 'Mako Puppy.jpg',
  content_type: "image/jpg"
)
p.save


#Scenario 1 - user_id 3 is a cat loving jerk, will comment, then delete their own comment after others have replied.
p = Picture.find_by(:title => "Crazy Boi Mako")
bad_comment = p.comments.create(
  :content => "Ugh dogs are dumb, cats rule. I'm that kind of person",
  :created_at => FFaker::Time.datetime,
  :user_id => 3
)
reply1 = bad_comment.build_reply(:content => "Wow this guy is an unneeded troll", :user_id => 1, :created_at => FFaker::Time.datetime)
reply1.save
reply2 = bad_comment.build_reply(:content => "Cats are okay but dogs are better FACT!", :user_id => 2, :created_at => FFaker::Time.datetime)
reply2.save
reply2_reply = reply2.build_reply(:content => "You are right, I see the errors of my ways.", :user_id => 3, :created_at => FFaker::Time.datetime)
reply2_reply.save
bad_comment.set_delete_flag
bad_comment.save

#Secnario 2 - Cute mako picture gets lots of comments
p = Picture.find_by(:title => "Mako is wayyyy to cute")
p.comments.create(
  :content => "WOW This is adorable",
  :user_id => 1
)
p.comments.create(
  :content => "Such a cutie!",
  :user_id => 2
)
p.comments.create(
  :content => "Awwwww",
  :user_id => 3
)
p.comments.create(
  :content => "Such a cutie puppy",
  :user_id => 4
)