class Match < ApplicationRecord
    belongs_to :matcher, class_name: "User", foreign_key: :matcher_id
    belongs_to :matchee, class_name: "User", foreign_key: :matchee_id
    has_many :chats, dependent: :destroy
    validates :matchee_id, uniqueness: {scope: :matcher_id}
    validate :self_cannot_match

    def self_cannot_match
        if self.matcher_id == self.matchee_id
            errors.add(:matchee_id, "You cannot match with your own dogs")
        end
    end

    def self.my_matches
        approved_matches = Match.find_by(status: "approved")
        if approved_matches.find_by(matcher_id: current_user.id).exists?
            matcher_matches = approved_matches.find_by(matcher_id: current_user.id)
        elsif approved_matches.find_by(matchee_id: current_user.id).exists?
            matchee_matches = approved_matches.find_by(matchee_id: current_user.id)
        elsif
            puts "None"
        end
        all = matcher_matches + matchee_matches
    end
end