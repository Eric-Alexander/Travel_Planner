class User < ActiveRecord::Base
  has_secure_password
  has_many :trips
  validates :username, presence: true,
            uniqueness: {case_sesnsitive: false},
            length: { minimum: 3, maximum: 30}
  validates :name,  presence: true, length: {minimum: 2, maximum: 50 }
  validates :password, presence: true, length: { minimum: 8 }
end
