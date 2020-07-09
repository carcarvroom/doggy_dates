class Dog < ApplicationRecord
    belongs_to :user
    has_many :likes
    validates :name, :age, :breed, :size, :bio, :image_url, presence: true

    def self.search(search)
        where("name LIKE ? OR age LIKE ? OR breed LIKE ? OR size LIKE ? OR bio LIKE ?", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%")
    end
end
