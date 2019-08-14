class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :validatable

  has_many :mistakes, class_name: "Mistake", foreign_key: "user_id", dependent: :destroy
  has_many :tags, class_name: "Tag", foreign_key: "user_id", dependent: :destroy
end
