class ProductsController < ApplicationController

  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end
  
  def edit
    @product = Product.find(params[:id])
  end
  
  def create
    @product = Product.new(params_product)
    if @product.save
      redirect_to products_path
    else
      render 'new'
    end
  end
  
  def update
    @product = Product.find(params[:id])
    if @product.update_attributes(params_product)
      redirect_to products_path
    else
      render 'edit'
    end
  end
  
  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    redirect_to products_path
  end

  def import
    if params[:file].present?
      if File.extname(params[:file].original_filename) == '.xls'
        @errors = Product.import(params[:file])
        if @errors.blank?
          session[:pnotification] = "Products imported."
          redirect_to products_path
        else
          @products = Product.order('created_at DESC') 
          render :action => 'bulk_upload'
        end
      else
        session[:pnotification] = "Invalid File extension.Please upload '.xls' file."
        redirect_to bulk_upload_path
      end
    else
      session[:pnotification] = "Please upload file."
      redirect_to bulk_upload_path
    end
  end

  private
  
  def params_product
    params.require(:product).permit!
  end
  
end
