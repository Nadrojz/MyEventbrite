class Event < ApplicationRecord

	belongs_to :admin, class_name: "User"
	has_many :attendances
	has_many :users, through: :attendances
	validates :start_date, presence: true
	validates :duration, presence: true, numericality: { greater_than: 0 }
	validates :title, presence: true, length: { in: 5..140 }
	validates :description, presence: true, length: { in: 20..1000 }
	validates :price, presence: true, numericality: { in: 1..1000 }
	validates :location, presence: true
	validate :multiple_of_5?
	validates :start_date_good, presence: true

	def multiple_of_5?
		if duration % 5 != 0
			errors.add(:duration, "La durée n'est pas un multiple de 5")
		end
	end

	def start_date_good
	start_date > Time.now ? true : errors.add(:start_date, "must be in the future")
	end


end
