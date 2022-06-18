require 'rails_helper'

RSpec.describe 'categories/index.html.erb', type: :feature do
  describe 'Index' do
    before(:each) do
      User.destroy_all
      Category.destroy_all
      @user = User.new(name: 'daniel', password: '123456', email: 'dan@domain.com', confirmed_at: Time.now)
      @user.save

      @category = Category.new(id: 2,
                               name: 'Food',
                               icon: Rack::Test::UploadedFile.new('spec/support/btc.jpg', 'image/jpg'),
                               total: 100, author_id: @user.id)
      @category.save

      visit new_user_session_path
      fill_in 'Email', with: 'dan@domain.com'
      fill_in 'Password', with: '123456'
      click_button 'Log In'
    end

    it 'shoud show the categories page' do
      expect(page).to have_content('Categories')
    end

    it 'should show all the category name Food' do
      expect(page).to have_content('Food')
    end

    it 'should show the total of 100.0$' do
      expect(page).to have_content('100.0$')
    end

    it 'should have a button to add categories' do
      expect(page).to have_button('Add a new Category')
    end

    it 'shoud redirect us to transactions page when we press the Food category' do
      click_on 'Food'
      expect(page.current_path).to eq('/categories/2/trans')
    end
  end
end
