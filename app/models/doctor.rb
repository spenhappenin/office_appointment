class Doctor < ApplicationRecord
	validates_presence_of :name, :specialty

	has_many :patients, through: :appointments
	has_many :appointments, dependent: :destroy


	def full_name
		"#{first_name} #{last_name}"
	end
end
