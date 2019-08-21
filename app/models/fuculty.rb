class Fuculty < ApplicationRecord
	has_many :departments, dependent: :destroy
	accepts_nested_attributes_for :departments, allow_destroy: true
end
