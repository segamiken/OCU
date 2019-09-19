class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  def active_for_authentication?
  	super && deleted.blank?
  end

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable


  validates :customer_name, presence: true, length: {minimum: 2, maximum: 20}
  validates :customer_introduction, length: {maximum: 200}


  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy

  def self.find_for_oauth(auth)
    customer = Customer.where(uid: auth.uid, provider: auth.provider).first

    unless customer
      customer = Customer.create(
        uid:      auth.uid,
        provider: auth.provider,
        email:    Customer.dummy_email(auth),
        customer_name: auth.info.name,
        password: Devise.friendly_token[0, 20]
      )
      end

    customer
  end

  private
  def self.dummy_email(auth)
    "#{auth.uid}-#{auth.provider}@example.com"
  end


end
