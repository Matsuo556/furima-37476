class PurchaseRecordsController < ApplicationController
  
  def index
    @purchase_record_address = PurchaseRecordAddress.new
    @item = Item.find(params[:item_id])
    end

  def create
    @purchase_record_address = PurchaseRecordAddress.new(purchase_record_params)
    binding.pry
    if @purchase_record_address.valid?
      @purchase_record_address.save
      redirect_to root_path
    else
      @item = Item.find(params[:item_id])
      render :index
    end
  end

  private

  def purchase_record_params
    params.require(:purchase_record_address).permit(:postal_code, :prefecture_id, :city, :address, :building, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id])
  end

end
