class AppointmentsController < ApplicationController
  skip_before_action :destroy, raise: false
  def show_user
    @user = User.first
    appointment_list = []
    @appointments = Appointment.where('user_id = ?',@user.id).all
    @appointments.each { |appointment|
      appointment_info = {}
      appointment_info['id']=appointment.id
      appointment_info['time']=Consult.find(appointment.consult_id).time
      appointment_info['place']=Consult.find(appointment.consult_id).place
      appointment_info['doctor_name']=User.find(Doctor.find(appointment.doctor_id).user_id).name
      appointment_list << appointment_info
    }
    render json: {
      user: @user,
      appointments: appointment_list
    }
  end

  def show_doctor
    @user = User.last # 这个是咨询师
    # doctor_id = Doctor.where('user_id = ?',@user.id).first.id
    doctor_id = 1
    appointment_list = []
    @appointments = Appointment.where('doctor_id = ?',doctor_id).all
    @appointments.each { |appointment|
      appointment_info = {}
      appointment_info['id']=appointment.id
      appointment_info['time']=Consult.find(appointment.consult_id).time
      appointment_info['place']=Consult.find(appointment.consult_id).place
      appointment_info['user_name']=User.find(appointment.user_id).name
      appointment_list << appointment_info
    }
    render json: {
      user: @user,
      appointments: appointment_list
    }
  end

  def create
    @appointment = Appointment.new(appointment_params)
    puts @appointment
    if @appointment.save
      render json: {error_code:0, data:@appointment, message:'ok'}, status: 201
    else
      render json: {error_code:500, message:@appointment.errors}, status: 201
    end
  end
  def destroy
    @appointment = Appointment.find(params[:appointment_id])
    @appointment.destroy
  end

  def emotion_analysis_get
    result = ""
    File.open("./result_text.txt","r").each_line do |line|
      result+=line
    end
    render json: { content: result}

  end
  def emotion_analysis_post
    text = params[:query_content]
    # text = test || "我很开心"
    File.open("./input_text.txt","w+") do |f|
      f.print text
    end
    run_python = `python ./emotion_classifier.py`
    result = ""
    File.open("./result_text.txt","r").each_line do |line|
      result+=line
    end
    render json: {error_code:0, data:@appointment, message:'ok'}, status: 201

  end
  private
    def appointment_params
      params.require(:appointment).permit(:user_id, :doctor_id, :consult_id)
    end
end
