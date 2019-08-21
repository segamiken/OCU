class Lesson < ApplicationRecord

	validates :lesson_name, presence: true, length: {minimum: 2}


	belongs_to :department
	has_many :comments, dependent: :destroy
	accepts_nested_attributes_for :comments, allow_destroy: true
end
