class Public::CustomersController < ApplicationController
  
  def show
    @customer = Customer.find(params[:id])
  end
  
  
  private

  def customer_params
    params.require(:customer).permit(:email, :last_name, :first_name, :last_name_kana, :first_name_kana, :postcode, :address, :phone_number)
  end
  
end
