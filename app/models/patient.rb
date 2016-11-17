class Patient < ApplicationRecord
	validates_presence_of :first_name, :last_name, :age, :insurance 

	has_many :doctors, through: :appointments
	has_many :appointments, dependent: :destroy

	def full_name
		"#{first_name} #{last_name}"
	end
end
