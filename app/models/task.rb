class Task < ApplicationRecord
  #validates :name,  presence: true, length: { maximum: 50 }
  #validates :description, presence: true, length: { maximum: 100 }
  
	validates :user_id, presence: true

end
