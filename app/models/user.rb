class User < ApplicationRecord
 
  before_save {self.email=email.downcase}
  has_many :comments
  has_many :posts, dependent: :destroy 
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :avatar 

  def avatar_thumbnail
    if avatar.attached?
      avatar.variant(resize: "150x150!").processed
    else
      "default_profile.jpg"
    end
  end

end


