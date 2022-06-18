require 'rails_helper'

RSpec.describe User, type: :model do
  subject do
    User.new(name: 'Daniel', email: 'dan@domain.com', password: '123456', confirmed_at: Time.now)
  end
  before { subject.save }

  describe 'validate data' do
    it 'should has a valid Full Nme' do
      subject.name = nil
      expect(subject).to_not be_valid
    end

    it 'should has a valid email' do
      subject.email = nil
      expect(subject).to_not be_valid
    end

    it 'should has a valid password' do
      subject.password = nil
      expect(subject).to_not be_valid
    end
  end
end
