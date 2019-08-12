class Event < ApplicationRecord
	belongs_to :admin, class_name: "User"
	has_many :attendances
	has_many :users, through: :attendances
	validates :start_date, presence: true, numericality: { greater_than_or_equal_to: DateTime.now.to_i }
	validates :duration, presence: true, numericality: { greater_than: 0 }
	validates :title, presence: true, length: { in: 5..140 }
	validates :description, presence: true, length: { in: 20..1000 }
	validates :price, presence: true, numericality: { in: 1..1000 }
	validates :location, presence: true
	validate :multiple_of_5?

	def multiple_of_5?
		if duration%5 != 0
			errors.add(:duration, "La durée n'est pas un multiple de 5")
		end
	end

end
