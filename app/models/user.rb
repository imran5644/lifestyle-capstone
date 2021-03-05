class User < ApplicationRecord
    validates :name, presence: true
    validates :username, uniqueness: { case_sensitive: false }, presence: true
    before_save { self.username = username.downcase }

    has_many :articles, foreign_key: :author_id, inverse_of: :author
    has_many :votes
end
