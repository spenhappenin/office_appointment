namespace :populate do
  desc "Populate 20 Random Doctors"
  task doctors: :environment do
  	Doctor.populate(50) do |doctor|
  	  doctor.first_name = Faker::Name.first_name
  	  doctor.last_name = Faker::Name.last_name
  	  doctor.about = Faker::Lorem.paragraph(rand(1..3))
  	  doctor.specialty = ['Cardiologist', 'Dermatologist', 'Gastroenterologist',
  	  						'Nephrologist', 'Neurologist', 'Neurosurgeon', 'Gynecologist', 
  	  						 	'Orthopaedic Surgeon', 'Pediatrician', 'Plastic Surgeon', 
  	  						 		'Psychiatrist', 'Rheumatologist', 'Urologist'].sample
  	end
  	puts '20 Doctors Populated'
  end

  desc "Populate 50 Radnom Patients"
  task patients: :environment do
  	Patient.populate(50) do |patient|
  	  patient.first_name = Faker::Name.first_name
  	  patient.last_name = Faker::Name.last_name
  	  patient.age = Faker::Number.between(1, 100)
  	  patient.dob = Faker::Date.backward(29200)
  	  patient.insurance = Faker::Boolean.boolean
  	end
  	puts '50 Patients Populated'
  end

end
