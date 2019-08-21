class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  def active_for_authentication?
  	super && deleted.blank?
  end

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  validates :customer_name, presence: true, length: {minimum: 2, maximum: 20}
  validates :customer_introduction, length: {maximum: 200}


  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
end
