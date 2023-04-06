class Public::CustomersController < ApplicationController
  def show
    @customer = Customer.find(params[:id])
    @likes = @customer.likes
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])
    if @customer.valid?
      @customer.update(update_params)
      redirect_to customer_path(@customer.id)
    else
      render :edit
    end
  end

  private
  def update_params
    params.require(:customer).permit(:image, :name, :profile)
  end
end
