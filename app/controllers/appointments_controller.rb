class AppointmentsController < ApplicationController
  def show
    @ap=Appointment.all
    render json: @ap
  end
end
