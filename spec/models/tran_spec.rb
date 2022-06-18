require 'rails_helper'

RSpec.describe Tran, type: :model do
  before :each do
    @user = User.new(name: 'Daniel', email: 'dan@domain.com', password: '123456', confirmed_at: Time.now)
    @user.save
  end

  subject do
    Tran.new(author_id: @user.id, name: 'Food', amount: 100)
  end
  before { subject.save }

  describe 'validate data' do
    it 'it should have a name' do
      subject.name = nil
      expect(subject).to_not be_valid
    end

    it 'should have an amount' do
      subject.amount = nil
      expect(subject).to_not be_valid
    end

    it 'the amount should be numerical' do
      subject.amount = 'a'
      expect(subject).to_not be_valid
    end
  end
end
