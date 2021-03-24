class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :nickname,           presence: true
    validates :encrypted_password, presence: true
    validates :first_name,         presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]/ }
    validates :last_name,          presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]/ }
    validates :first_name_reading, presence: true, format: { with: /\A[ァ-ヶー－]+\z/ }
    validates :last_name_reading,  presence: true, format: { with: /\A[ァ-ヶー－]+\z/ }
    validates :birthday,           presence: true
  end
end
