class DoctorsController < ApplicationController
	before_action :set_doctor, except: [:index, :new, :create]

  def index
  	@doctors = Doctor.all
  end

  def show
  end

  def new
  	@doctor = Doctor.new
  end

  def create 
  	@doctor = Doctor.new(doctor_params)
  	if @doctor.save
  		redirect_to @doctor, notice: 'Doctor successfully added!'
	else
		render :new
  	end
  end

  def edit
  end

  def update 
  	if @doctor.update(doctor_params)
  		redirect_to @doctor, notice: 'Doctor successfully updates!'
  	else
  		render :edit
  	end
  end 

  def destroy
  	@doctor.destroy
  	redirect_to doctors_path, notice: 'Doctor was successfully deleted!'
  end

  private 

  	def doctor_params
  		params.require(:doctor).permit(:name, :specialty)
  	end

	def set_doctor
		@doctor = Doctor.find(params[:id])
	end


end
