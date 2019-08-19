class Comment < ApplicationRecord
	belongs_to :customer
	belongs_to :lesson
	attachment :exam_image
	has_many :favorites, dependent: :destroy


	def favorited_by?(aa)
		favorites.where(customer_id: aa.id).exists?
	end
end
