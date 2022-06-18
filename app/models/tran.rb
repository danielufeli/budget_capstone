class Tran < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :category_trans, foreign_key: 'tran_id', class_name: 'CategoryTran', dependent: :delete_all

  validates :name, :amount, presence: true
  validates :amount, numericality: { greater_than: 0 }
end
