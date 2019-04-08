class CustomersController < ApplicationController
  before_action :set_customer, only: [:show, :edit, :update, :destroy]

  def main
    render 'main'
  end

  def index
    @customers = Customer.all
  end

  def show
  end

  def new
    @customer = Customer.new
  end

  def edit
  end

  def create
    @customer = Customer.new(customer_params)
    if @customer.save
      redirect_to @customer
    else
      render 'new'
    end
  end

  def update
      if @customer.update(customer_params)
        redirect_to @customer
      else
        render 'edit'
      end
    
  end

  def destroy
    @customer.destroy
    redirect_to customers_url
  end

  private

    def set_customer
      @customer = Customer.find(params[:id])
    end

    def customer_params
      params.require(:customer).permit(:first_name, :last_name, :email, :phone_number, :city)
    end
end
