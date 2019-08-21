class Comment < ApplicationRecord

	validates :star, presence: true, numericality: {only_integer: true, greater_than: 0, less_than_or_equal_to: 10}
    validates :professor, presence: true
    validates :attendance, presence: true
    validates :textbook, presence: true
    validates :exam, presence: true
    validates :comment, length: {maximum: 300}


	belongs_to :customer
	belongs_to :lesson
	attachment :exam_image
	has_many :favorites, dependent: :destroy


	def favorited_by?(aa)
		favorites.where(customer_id: aa.id).exists?
	end
end
