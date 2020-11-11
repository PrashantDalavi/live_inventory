class WareHousesController < ApplicationController

  def index
    @ware_houses = WareHouse.all
  end

  def new
    @ware_house = WareHouse.new
  end
  
  def edit
    @ware_house = WareHouse.find(params[:id])
  end
  
  def create
    @ware_house = WareHouse.new(params_ware_house)
    if @ware_house.save
      redirect_to ware_houses_path
    else
      render 'new'
    end
  end
  
  def update
    @ware_house = WareHouse.find(params[:id])
    if @ware_house.update_attributes(params_ware_house)
      redirect_to ware_houses_path
    else
      render 'edit'
    end
  end

  private
  
  def params_ware_house
    params.require(:ware_house).permit!
  end
  
end
