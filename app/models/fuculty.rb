class Fuculty < ApplicationRecord
	has_many :departments, dependent: :destroy
	accepts_nested_attributes_for :departments, allow_destroy: true

	validates :fuculty_name, presence: true, length: {minimum: 2}
end
