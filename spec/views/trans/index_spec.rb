require 'rails_helper'

RSpec.describe 'trans/index.html.erb', type: :feature do
  describe 'Index' do
    before(:each) do
      User.destroy_all
      Category.destroy_all
      Tran.destroy_all
      CategoryTran.destroy_all
      @user = User.new(name: 'Daniel', password: '123456', email: 'dan@domain.com', confirmed_at: Time.now)
      @user.save

      @category = Category.new(id: 2,
                               name: 'Food',
                               icon: Rack::Test::UploadedFile.new('spec/support/btc.jpg', 'image/jpg'),
                               total: 100, author_id: @user.id)
      @category.save

      @tran = Tran.new(id: 3, name: 'Food', amount: 100, author_id: @user.id)
      @tran.save

      @category_tran = CategoryTran.new(id: 4, category_id: @category.id, tran_id: @tran.id)
      @category_tran.save

      visit new_user_session_path
      fill_in 'Email', with: 'dan@domain.com'
      fill_in 'Password', with: '123456'
      click_button 'Log In'
      click_on 'Food'
    end

    it 'shoud show the transactions page' do
      expect(page).to have_content('Transactions')
    end

    it 'should show Rent transaction name' do
      expect(page).to have_content('Food')
    end

    it 'should show the total amount of each transaction' do
      expect(page).to have_content('100.0$')
    end

    it 'should have a button to add a new transaction' do
      expect(page).to have_button('Add a new Transaction')
    end

    it 'should redirect us to the trans#new page when we press Add a new Transaction' do
      click_link 'Add a new Transaction'
      expect(page.current_path).to eq('/categories/2/trans/new')
    end

    it 'shoud have the total of all transactions for the category' do
      expect(page).to have_content('Total: 200.0$')
    end
  end
end
