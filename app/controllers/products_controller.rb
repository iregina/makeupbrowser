class ProductsController < ApplicationController
	before_action :set_image, only: [:new, :create, :edit, :update, :destroy]
	
	def new
		@product = Product.new
	end

	def create
		@product = Product.new(product_params)
		@image = Image.find_or_create_by(params[:image])
	
	  if @product.save
	  	@product.images << @image
	    redirect_to @image
	  else
	    render action: :new
	  end
	end

	private


    # Use callbacks to share common setup or constraints between actions.
    def set_image
      @image = Image.find_by(id: params[:id])
    end


    def product_params
      params.require(:product).permit(:name)
    end


end