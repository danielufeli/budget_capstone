class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable, :lockable, :trackable
  
  has_many :categories, foreign_key: 'author_id', class_name: 'Category'
  validates :name, presence: true
  validates :email, presence: true
  validates :password, presence: true
end
