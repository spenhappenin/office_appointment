class PatientsController < ApplicationController
	before_action :set_patient, except: [:index, :new, :create]


  def index
   	@patients = Patient.all
  end

  def show
  end

  def new
  	@patient = Patient.new
  end

  def create 
  	@patient = Patient.new(patient_params)
  	if @patient.save  		
  		redirect_to @patient, notice: 'Patient successfully created!'
  	else
  		render :new
  	end
  end

  def edit
  end

  def update 
  	if @patient.update(patient_params)
  		redirect_to @patient, notice: 'Patient successfully updated!'
  	else
  		render :edit
  	end
  end 

  def destroy
  	@patient.destroy
  	redirect_to patients_path, notice: 'Patient successfully deleted!'
  end


  private 

  def patient_params
  	params.require(:patient).permit(:first_name, :last_name, :dob, :age, :insurance)
  end

  def set_patient
  	@patient = Patient.find(params[:id])
  end

end
