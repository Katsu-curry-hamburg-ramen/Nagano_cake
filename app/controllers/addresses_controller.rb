class AddressesController < ApplicationController

 before_action :baria_customer


  def index
     @customer = current_customer
     @addresses = @costomer.addresses
     @address = Address.new

  end

  def create
     @address = Address.new(address_params)
     @address.customer_id = current_customer.id
     if @address.save
     redirect_to customer_¥addresses_path(current_customer.id)
     else
     @addresses = @customer.addresses
     render'index'
     end

  end

  def edit
     @customer = current_customer
     @address = current_customer.addresses.find_by(id: params[:id])
  end

  def update
      @address =current_customer.addresses.find_by(id: parms[:id])
      if @address.update(address_params)
      redirect_to customer_addresses_path
      else
       @customer = Customer.find(params[:customer_id])
       render 'edit'
      end
  end

  def destroy
      @address = current_customer.addresses.find_by(id: params[:id])
      @address = destroy
      redirect_to customer_addresses_path
  end

  private
  def address_params
      params.require(:address).permit(:postcode, :address, :name)
  end

  def baria_customer
      @customer = Customer.find(params[customer_id])
      if @customer != current_customer
       flash[:alert]="不正なアクセスです"
       redirect_to root_path
      end
  end

end
