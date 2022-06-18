require 'rails_helper'

RSpec.describe 'categories/new.html.erb', type: :feature do
  describe 'new' do
    before(:each) do
      User.destroy_all
      Category.destroy_all
      Tran.destroy_all
      CategoryTran.destroy_all
      @user = User.new(name: 'Dan', password: '123456', email: 'dan@domain.com', confirmed_at: Time.now)
      @user.save

      @category = Category.new(id: 2, name: 'Food',
                               icon: Rack::Test::UploadedFile.new('spec/support/btc.jpg', 'image/jpg'),
                               total: 100, author_id: @user.id)
      @category.save

      visit new_user_session_path
      fill_in 'Email', with: 'dan@domain.com'
      fill_in 'Password', with: '123456'
      click_button 'Log In'
      click_link 'Add a new Category'
    end

    it 'shoud show the add a new category page' do
      expect(page).to have_content('New Category')
    end
  end
end
