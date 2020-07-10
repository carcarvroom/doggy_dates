Match.destroy_all
User.destroy_all
Dog.destroy_all
Chat.destroy_all
Like.destroy_all

require 'faker'
require 'httparty'

class GetDog
    def self.get_breed
        breeds_url = "https://dog.ceo/api/breeds/list/all"
        response = HTTParty.get(breeds_url)
        breeds = response.parsed_response["message"].keys
        breeds.sample
    end

    def self.get_image(breed)
        image_url = "https://dog.ceo/api/breed/#{breed}/images/random"
        response = HTTParty.get(image_url)
        breed_image_url = response.parsed_response["message"]
    end
end

mia = User.create(name: "Mia", age: 29, location: "New York", occupation: "Artist", username: "mia", password: "mia")
sally = User.create(name: "Sally", age: 20, location: "Seattle", occupation: "Student", username: "sally", password: "sally")
joe = User.create(name: "Joe", age: 22, location: "San Francisco", occupation: "Student", username: "joe", password: "joe")
bob = User.create(name: "Bob", age: 30, location: "San Francisco", occupation: "Software Engineer", username: "bob", password: "bob")

10.times do
    User.create({
        name: Faker::FunnyName.two_word_name,
        age: rand(20..40),
        location: Faker::Address.city,
        occupation: Faker::Job.title,
        username: Faker::Color.unique.color_name,
        password: Faker::Internet.password
    })
end

20.times do
    Dog.create({
        user_id: User.all.ids.sample,
        name: Faker::Creature::Dog.name,
        age: rand(0..15),
        breed: breed = GetDog.get_breed,
        size: Faker::Creature::Dog.size,
        bio: Faker::Creature::Dog.meme_phrase,
        image_url: GetDog.get_image(breed)
    })
end

puts "Seeds done!"
