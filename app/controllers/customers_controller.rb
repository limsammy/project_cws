class CustomersController < ApplicationController

  def new
    @customer = Customer.new
    # @customer.contacts.build
    # @customer.build_shipping_address
    # @customer.build_billing_address
    # @customer.build_additional_address


  end

  def create
    @customer = Customer.new(customer_params)
     respond_to do |format|
      if @customer.save
        format.html { redirect_to @customer, notice: 'Customer was successfully created.' }
        format.json { render :show, status: :created, location: @customer }
      else
        format.html { render :new }
        format.json { render json: @customer.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
    @customer = Customer.find(params[:id])
  end
  def update
    @customer = Customer.find(params[:id])
    respond_to do |format|
      if @customer.update(customer_params)
        format.html { redirect_to @customer, notice: 'Customer was successfully updated.' }
        format.json { render :show, status: :ok, location: @customer }
      else
        format.html { render :edit }
        format.json { render json: @customer.errors, status: :unprocessable_entity }
      end
    end

  end

  def show
    @customer = Customer.find(params[:id])
  end

  def index
    @customers = Customer.all
  end

  def destroy
    @customer = Customer.find(params[:id])
    @customer.destroy
    respond_to do |format|
      format.html { redirect_to customers_url, notice: 'Customer was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def customer_params
      params.require(:customer).permit(:id, :contact_id,:name, :phone_number, :department, :fax, :_destroy,
                                        contacts_attributes: [
                                          :id,
                                          :name,
                                          :email,
                                          :mob_number,
                                          :_destroy],
                                        shipping_address_attributes: [
                                          :id ,
                                          :line_1 ,
                                          :line_2 ,
                                          :country ,
                                          :state ,
                                          :zip,
                                          :city],
                                        billing_address_attributes: [
                                          :id ,
                                          :line_1 ,
                                          :line_2 ,
                                          :country ,
                                          :state ,
                                          :zip,
                                          :city],
                                        additional_address_attributes: [
                                          :id ,
                                          :line_1 ,
                                          :line_2 ,
                                          :country ,
                                          :state ,
                                          :zip,
                                          :city]
                                          )
    end
end
