class Department < ApplicationRecord

	validates :department_name, presence: true, length: {minimum: 2}


	belongs_to :fuculty
	has_many :lessons, dependent: :destroy
end
