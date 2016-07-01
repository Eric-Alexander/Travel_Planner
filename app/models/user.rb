class User < ActiveRecord::Base
  has_secure_password
  has_many :trips
  has_many :joins
  has_many :trips_joined, through: :joins, source: :trips

  validates :username, presence: true,
            uniqueness: {case_sesnsitive: false},
            length: { minimum: 3, maximum: 30}
  validates :name,  presence: true, length: {minimum: 2, maximum: 50 }
  validates :password, presence: true, length: { minimum: 8 }

    def user_already_added?(trip_id, current_user)
      joins.where(trip_id: trip_id, user_id: current_user).count < 1
    end
    def user_added(trip_id)
      joins.where(trip_id: trip_id).count == 0
    end
end
