class Like < ApplicationRecord
    belongs_to :user
    belongs_to :dog
    validates :dog_id, uniqueness: {scope: :user_id}
end
