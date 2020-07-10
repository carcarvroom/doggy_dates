class Dog < ApplicationRecord
    belongs_to :user
    has_many :likes, dependent: :destroy
    validates :name, :age, :breed, :size, :bio, :image_url, presence: true

    def self.search(search)
        if search
            where(["name LIKE ? OR age LIKE ? OR breed LIKE ? OR size LIKE ? OR bio LIKE ?", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%"])
        else
            all
        end
    end
    
end
