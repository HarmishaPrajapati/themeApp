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
    if @booking.save
      cleaner.each do |c|
        if (@booking.cleaner_name == c.first_name)
          UserMailer.welcome_email(c).deliver_now
          redirect_to @booking
        end
      end
    else
      render 'new'
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
