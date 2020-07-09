class User < ApplicationRecord
    has_many :dogs
    has_many :likes
    # as a matchee
    has_many :matcher_swipes, class_name: "Match", foreign_key: :matchee_id, dependent: :destroy
    has_many :matchers, through: :matcher_swipes, source: :matcher
    # as a matcher
    has_many :matchee_swipes, class_name: "Match", foreign_key: :matcher_id, dependent: :destroy
    has_many :matchees, through: :matchee_swipes, source: :matchee
    has_many :matches
    has_many :chats, through: :matches

    validates :username, uniqueness: true
    validates :name, :age, :location, presence: true
    has_secure_password

    # def self.current
    #     Thread.current[:user]
    # end

    # def self.current=(user)
    #     Thread.current[:user] = user
    # end
    
end
