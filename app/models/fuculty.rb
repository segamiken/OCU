class Fuculty < ApplicationRecord
	has_many :departments, dependent: :destroy
end
