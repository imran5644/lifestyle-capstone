# rubocop:disable Layout/LineLength
require 'rails_helper'

RSpec.describe Category, type: :model do
  context 'Create category' do
    it 'Creates a valid category' do
      category = Category.new(name: 'Business', priority: 1)

      expect(category).to be_valid
    end

    it 'Validates category without name' do
      category = Category.new(priority: 1)

      expect(category).to_not be_valid
    end

    it 'Validates category without priority' do
      category = Category.new(name: 'Business')

      expect(category).to_not be_valid
    end

    it "Validates category's name length" do
      category = Category.new(name: 'A business is defined as an organization or enterprising entity engaged in commercial, industrial, or professional activities.',
                              priority: 1)

      expect(category).to_not be_valid
    end
  end
end
# rubocop:enable Layout/LineLength
