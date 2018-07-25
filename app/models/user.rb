class User < ApplicationRecord
  has_many :rooms
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, 
         :confirmable
         #:omniauthable

  validates :first_name, presence: true
  validates :second_name, presence: true

  # def name
  #   return "#{first_name} #{last_name}".strip
  # end

  # # from Devise OmniAyth at GitHub
  # def self.from_omniauth(auth)
  #   user = User.where(email: auth.info.email).first
  #   #if we can find in db
  #   if user
  #     return user
  #   #else we create a new user
  #   else
  #     where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
  #       user.email = auth.info.email
  #       user.password = Devise.friendly_token[0,20]
  #       user.name = auth.info.name   
  #       user.image = auth.info.image
  #       user.uid = auth.uid
  #       user.provider = auth.providers
  
  #       # If you are using confirmable and the provider(s) you use validate emails, 
  #       # uncomment the line below to skip the confirmation emails.
  #       user.skip_confirmation!
  #     end
  #   end
  # end
end
