require 'test_helper'

class AppointmentsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get appointments_show_url
    assert_response :success
  end

  test "should get create" do
    get appointments_create_url
    assert_response :success
  end
  # user1 = User.create(index: 1,name: 'kreamyu', password_digest: "123")
  # user2 = User.create(index: 2,name: 'zhangsan', password_digest: "123")
  # user2 = User.create(index: 3,name: 'lisi', password_digest: "123")
  # doctor1 = Doctor.create(user_id: 2)
  # doctor2 = Doctor.create(user_id: 3)
  # consult1 = Consult.create(time: "11月29日（周二） 10:00-11:00", place: "心理咨询中心")
  # consult2 = Consult.create(time: "11月29日（周二） 14:00-15:00", place: "心理咨询中心")
  # appointment1 = Appointment.create(user_id: 1, doctor_id: 1,consult_id: 1)
end
