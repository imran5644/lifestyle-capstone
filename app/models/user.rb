class User < ApplicationRecord
    validates :name, presence: true
    validates :username, uniqueness: { case_sensitive: false }, presence: true
    before_save { self.username = username.downcase }
end
