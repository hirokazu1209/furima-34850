class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items

  with_options presence: true do
    validates :nickname
    validates :password, presence: true, format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i }
    validates :birthday
  end

  with_options presence: true, format: { with: /\A[ぁ-んァ-ン一-龥々]/ }  do
    validates :first_name
    validates :last_name
  end

  with_options presence: true, format: { with: /\A[ァ-ヶー－]+\z/ } do
    validates :first_name_reading
    validates :last_name_reading
  end


end
