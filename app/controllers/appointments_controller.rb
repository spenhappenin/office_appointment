class AppointmentsController < ApplicationController

  def new
  	@patients = Patient.all.map{ |p| [p.full_name, p.id] }
    @doctors = Doctor.all.map{ |d| [d.full_name, d.id] }
    @appointment = Appointment.new
  end

  def create 
  	@appointment = Appointment.new(appointment_params)
  	if @appointment.save
      flash[:success] = 'Appointment Added.'
  		redirect_to :back
  	else
  		render :new
  	end
  end

  def destroy	
    @appointment = Appointment.find(params[:id])
  	@appointment.destroy
  	flash[:success] = 'Appointment Removed!'
    redirect_to doctor_path(appointment.doctor_id)
  end


  private 

  def appointment_params
  	params.require(:appointment).permit(
  			:patient_id, :doctor_id, 
  			:date, :time, :location, :reason)
  end

end
