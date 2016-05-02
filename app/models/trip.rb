class Trip < ActiveRecord::Base
  belongs_to :user
  validates :destination, :presence => {message: "You must enter a destination"}
  validates :user_id, :start_date, :end_date, presence: true
  validates_date :start_date, on_or_after: Date.current

  validates_date :end_date, :after => :start_date

end
