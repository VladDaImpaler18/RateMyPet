class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable, :trackable

  has_many :pictures
  has_many :categories, through: :pictures
  has_many :comments #Double check to make sure this logic works
  
  def name
    username
  end

  def self.from_omniauth(auth_hash)
    #Find to see if user has previously logged in via github, if not create them.
    where(provider: auth_hash.provider, uid: auth_hash.uid).first_or_create do |user|
      user.provider = auth_hash.provider
      user.username = auth_hash.info.nickname
      user.uid = auth_hash.uid
      user.email = auth_hash.info.email
      user.password = Devise.friendly_token(20)
    end
  end
end
