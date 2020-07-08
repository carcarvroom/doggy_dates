class Dog < ApplicationRecord
    belongs_to :user
    has_many :likes
    validates :name, :age, :breed, :size, :bio, :image_url, presence: true
end
