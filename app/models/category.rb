class Category < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :category_trans, foreign_key: 'category_id', class_name: 'CategoryTran', dependent: :delete_all
  has_one_attached :icon
  validates :name, presence: true
  validates :icon, presence: true
end
