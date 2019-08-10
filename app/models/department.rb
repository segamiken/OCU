class Department < ApplicationRecord
	belongs_to :fuculty
	has_many :lessons, dependent: :destroy
end
