# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'faker'

require 'csv'


User.destroy_all
Post.destroy_all
Comment.destroy_all
Tag.destroy_all
Category.destroy_all
Like.destroy_all
Accused.destroy_all
Accuser.destroy_all

categoryArray = ["World_Leader", "Government", "Politician", "Law", "Celebrity"]
catArr = []
categoryArray.each do |cat|
	catArr << Category.create(title: cat)
end


nick = User.create(name: 'nick', email: 'n@n.com', password: 'n', password_confirmation: 'n', pic: "me_prof.jpg"); 
rob = User.create(name: 'rob', email: 'r@r.com', password: 'r', password_confirmation: 'r', pic: "rob.jpeg", twitter: "http://twitter.com/robscharf");
bane = User.create(name: 'bane', email: 'b@b.com', password: 'b', password_confirmation: 'b', pic: "b.jpg");



CSV.foreach('db/nazi_references-g.csv', :headers => true) do |row|
	
	# category = Category.find_or_create_by(title: categoryArray.sample)
	
	accused = Accused.find_or_create_by(title: row['Accused'], category: catArr.sample)
	
	accuser = Accuser.find_or_create_by(title: row['Accuser'], category: catArr.sample)

	post = Post.create(url: row['Source'], accused: accused, accuser: accuser, excerpt: row['Notes'], quote: row['Quote'], title: Faker::Name.name, date: row['Date'], user: rob)

	post.tags << Tag.find_or_create_by(title: post.accuser.title);
	post.tags << Tag.find_or_create_by(title: post.accused.title);
	# post.tags << Tag.find_or_create_by(title: post.date);
	rand(1..8).times do
		post.likes << Like.create(user: bane)
	end
	
	5.times do
		Comment.create(content: Faker::Lorem.sentence(14), user: nick, post: post)
	end
	
end

# 15.times do 
# 	post = Post.create(url: Faker::Internet.url, excerpt: Faker::Lorem.paragraph(6), title: Faker::Name.name, date: rand(10.years).ago.to_formatted_s(:long), accused: Faker::Name.name, accuser: Faker::Name.name, user: bane);

	
# 	post.tags << Tag.find_or_create_by(title: post.accuser);
# 	post.tags << Tag.find_or_create_by(title: post.accused);
# 	post.likes << Like.create(user: nick)
# 	5.times do
# 		Comment.create(content: Faker::Lorem.sentence(14), user: rob, post: post)
# 	end
# end

# 15.times do 
# 	post = Post.create(url: Faker::Internet.url, excerpt: Faker::Lorem.paragraph(6), title: Faker::Name.name, date: rand(10.years).ago.to_formatted_s(:long), accused: Faker::Name.name, accuser: Faker::Name.name, user: nick);


	
# 	post.tags << Tag.find_or_create_by(title: post.accuser);
# 	post.tags << Tag.find_or_create_by(title: post.accused);
# 	post.likes << Like.create(user: rob)
# 	5.times do
# 		Comment.create(content: Faker::Lorem.sentence(1), user: bane, post: post)
# 	end
	
# end  