class BookingsController < ApplicationController
  before_action :set_booking, only: [:show, :edit, :update, :destroy]

  def index
    @bookings = Booking.all
  end

  def show
  end

  def new
    @booking = Booking.new
  end

  def edit
  end

  def create
    @booking = Booking.new(booking_params)
    cleaner = Cleaner.select(:first_name, :email)
    render 'new' unless @booking.save
    cleaner.each do |cleaner|
      if (@booking.cleaner_name == cleaner.first_name)
        UserMailer.welcome_email(cleaner).deliver_now
        redirect_to @booking
        end
      end  
  end

  def update
    if @booking.update(booking_params)
      redirect_to @booking
    else
      render 'edit'
    end
  end

  def destroy
    @booking.destroy
    redirect_to bookings_url
  end

  private
    def set_booking
      @booking = Booking.find(params[:id])
    end

    def booking_params
      params.require(:booking).permit(:customer_name, :cleaner_name, :date)
    end
end
