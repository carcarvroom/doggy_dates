class Chat < ApplicationRecord
    belongs_to :match
    # belongs_to :user
    validates_presence_of :body, :match_id
end
