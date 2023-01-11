class ConsultsController < ApplicationController
  def show
    @user=User.first # 这里改成当前用户
    #consults
    consult_list = []
    @consults = Consult.all
    @consults.each { |consult|
      consult_info = {}
      consult_info['id']=consult.id
      consult_info['time']=consult.time
      consult_info['place']=consult.place
      consult_info['place']=consult.place
      consult_info['reserved']= Appointment.where('user_id = ? AND consult_id = ?',@user.id,consult.id).exists?
      consult_list << consult_info
    }
    
    # doctors
    doctor_list = []
    @doctors = Doctor.all
    @doctors.each { |doctor|
      doctor_info = {}
      doctor_info['id']=doctor.id
      doctor_info['name']=User.find(doctor.user_id).name
      doctor_list << doctor_info
    }
    puts consult_list
    puts doctor_list
    render json: {
      user: @user,
      consults: consult_list,
      doctors: doctor_list
    }
  end
end
