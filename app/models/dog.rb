class Dog < ApplicationRecord
    belongs_to :user
    validates :name, :age, :breed, :size, :bio, :image_url, presence: true

end
