class User < ApplicationRecord
    has_many :dogs
    has_many :likes
    has_many :matches
    has_many :chats, through: :matches
    # as a matchee
    has_many :matcher_swipes, class_name: "Match", foreign_key: :matchee_id, dependent: :destroy
    has_many :matchers, through: :matcher_swipes, source: :matcher
    # as a matcher
    has_many :matchee_swipes, class_name: "Match", foreign_key: :matcher_id, dependent: :destroy
    has_many :matchees, through: :matchee_swipes, source: :matchee
    
# Many to many self join example:
    # class Relation < ActiveRecord::Base
    #     belongs_to :student, foreign_key: "student_id", class_name: "User"
    #     belongs_to :teacher, foreign_key: "teacher_id", class_name: "User"
    #   end
      
    #   class User < ActiveRecord::Base
    #     # as teacher
    #       has_many :student_relations, foreign_key: :teacher_id, class_name: "Relation"
    #       has_many :students, through: :student_relations, source: :student
    #     # as student
    #       has_many :teacher_relations, foreign_key: :student_id, class_name: "Relation"
    #       has_many :teachers, through: :teacher_relations, source: :teacher
    #   end
end
