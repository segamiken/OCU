class Lesson < ApplicationRecord
	belongs_to :department
	has_many :comments, dependent: :destroy
	accepts_nested_attributes_for :comments, allow_destroy: true
end
