require 'faker'
require 'httparty'
require 'json'
# User: name, age:integer, location, occupation, username
# Dog: user_id, name, age:integer, breed, size, bio, image_url
# Match: matchee, matcher, status, chat_id=nil
# Chat: timestamp:datetime
# Like: user_id:integer

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

# 10.times do
#     User.create({
#         name: Faker::FunnyName.two_word_name,
#         age: rand(20..40),
#         location: Faker::Address.city,
#         occupation: Faker::Job.title,
#         username: Faker::Color.unique.color_name,
#     })
# end

10.times do
    Dog.create({
        user_id: User.all.ids.sample,
        name: Faker::Creature::Dog.name,
        age: rand(0..15),
        breed: Faker::Creature::Dog.breed,
        size: Faker::Creature::Dog.size,
        bio: Faker::Creature::Dog.meme_phrase,
        image_url: GetDog.get_image(GetDog.get_breed)
    })
end

puts "Seeds done!"