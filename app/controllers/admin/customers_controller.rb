class Admin::CustomersController < ApplicationController

  def index
    @customers = Customer.all.page(params[:page]).per(15)
  end

  def show
    @customer = Customer.find(params[:id])
    @likes = @customer.likes
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
     customer = Customer.find(params[:id])
     customer.update(customer_params)
     redirect_to admin_customer_path(customer)
  end

  private
  def customer_params
    params.require(:customer).permit(:is_deleted)
  end

end
