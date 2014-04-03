# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'faker'

User.delete_all
Post.delete_all
Comment.delete_all
Tag.delete_all

legendArray = ["World_Leader", "Government", "Politician", "Law", "Celebrity"]
myColorArray = ['yellow', 'red',' blue',' green',' orange']
nick = User.create(name: 'nick', email: 'n@n.com', password: 'n',); 
rob = User.create(name: 'rob', email: 'r@r.com', password: 'r',);
bane = User.create(name: 'bane', email: 'b@b.com', password: 'b',);

15.times do 
	post = Post.create(url: Faker::Internet.url, excerpt: Faker::Lorem.paragraph(1), title: Faker::Name.name, date: rand(10.years).ago.to_formatted_s(:long), target: Faker::Name.name, accuser: Faker::Name.name, category: legendArray.sample);
	
	tag = Tag.create(title: post.target, color: myColorArray.sample);
	tag_1 = Tag.create(title: post.accuser, color: myColorArray.sample);
	tag_2 = Tag.create(title: post.category, color: myColorArray.sample);

	post.tags << tag
	post.tags << tag_1
	post.tags << tag_2
	
	5.times do
		post.comments << Comment.create(content: Faker::Lorem.sentence(1), author_id: nick.id)
	end
	
	rob.posts << post 
end

15.times do 
	post = Post.create(url: Faker::Internet.url, excerpt: Faker::Lorem.paragraph(1), title: Faker::Name.name, date: rand(10.years).ago.to_formatted_s(:long), target: Faker::Name.name, accuser: Faker::Name.name, category: legendArray.sample);

	tag = Tag.create(title: post.target, color: myColorArray.sample);
	tag_1 = Tag.create(title: post.accuser, color: myColorArray.sample);
	tag_2 = Tag.create(title: post.category, color: myColorArray.sample);

	post.tags << tag
	post.tags << tag_1
	post.tags << tag_2

	5.times do
		post.comments << Comment.create(content: Faker::Lorem.sentence(1), author_id: rob.id)
	end
	bane.posts << post 
end

15.times do 
	post = Post.create(url: Faker::Internet.url, excerpt: Faker::Lorem.paragraph(1), title: Faker::Name.name, date: rand(10.years).ago.to_formatted_s(:long), target: Faker::Name.name, accuser: Faker::Name.name, category: legendArray.sample);

	tag = Tag.create(title: post.target, color: myColorArray.sample);
	tag_1 = Tag.create(title: post.accuser, color: myColorArray.sample);
	tag_2 = Tag.create(title: post.category, color: myColorArray.sample);

	post.tags << tag
	post.tags << tag_1
	post.tags << tag_2

	5.times do
		post.comments << Comment.create(content: Faker::Lorem.sentence(1), author_id: bane.id)
	end
	nick.posts << post 
end  
