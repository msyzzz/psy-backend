class AppointmentsController < ApplicationController
  skip_before_action :verify_authenticity_token
  def show
    @doctors = Doctor.all
    @user = User.first # 这里应当是当前的用户
    @appointments=Appointment.where("user_id = ?", @user.id)
    @appointments.each { |x|
      @doctors.map{ |y|
        if x.doctor_id == y.id
          y.has_reserved=true
        end
      }
    }
    render json: {
      "doctors": @doctors,
      "user": @user,
      # "appointments": @appointments
    }
  end
  def create
    puts appointment_params
    @appointment = Appointment.new(appointment_params)
    if @appointment.save
      # render status: 200
      render json:@appointment
    else
      render json:@appointment,status: :unprocessable_entity
    end
  end

  def destroy
    @appointment = Appointment.where("user_id = ? AND doctor_id = ?", params[:user_id],params[:doctor_id]).first
    # puts "-----"
    # puts @appointment.id
    # puts "-----"

    @appointment.destroy
  end

  private

    def appointment_params
      params.require(:appointment).permit(:user_id, :doctor_id, :appointment_date)
    end
end
