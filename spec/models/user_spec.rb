require 'rails_helper'

RSpec.describe User, type: :model do
  context 'Create an user' do
    it 'Create a valid user' do
      user = User.new(name: 'imran', username: 'imran56444')

      expect(user).to be_valid
    end

    it 'Validates user without a name' do
      user = User.new(username: 'imran56444')

      expect(user).to_not be_valid
    end

    it 'Validates user without username' do
      user = User.new(name: 'imran')

      expect(user).to_not be_valid
    end
  end
end
