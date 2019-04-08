class CleanersController < ApplicationController
  before_action :set_cleaner, only: [:show, :edit, :update, :destroy]

  def index
    @cleaners = Cleaner.all
  end

  def show
  end

  def new
    @cleaner = Cleaner.new
  end

  def edit
  end

  def create
    @cleaner = Cleaner.new(cleaner_params)
    if @cleaner.save
      redirect_to @cleaner
    else
      render 'new'
    end
  end
  
  def update
    if @cleaner.update(cleaner_params)
      redirect_to @cleaner
    else
      render 'edit'
    end
  end

  def destroy
    @cleaner.destroy
    redirect_to cleaners_url
  end

  private

    def set_cleaner
      @cleaner = Cleaner.find(params[:id])
    end

    def cleaner_params
      params.require(:cleaner).permit(:first_name, :last_name, :email, :phone_number, :city, :quality_score)
    end
end
