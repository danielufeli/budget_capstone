class CategoryTran < ApplicationRecord
  belongs_to :category, class_name: 'Category'
  belongs_to :tran, class_name: 'Tran'

  after_create :increment_category_total

  private

  def increment_category_total
    category.increment!(:total, tran.amount)
  end
end
