class Doctor < ApplicationRecord
	validates_presence_of :name, :specialty

	has_many :patients, through: :appointments
	has_many :appointments, dependent: :destroy
end
