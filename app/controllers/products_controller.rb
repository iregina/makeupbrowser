class ProductsController < ApplicationController
	before_action :set_image, only: [:create, :edit, :update, :destroy]
	def new
		@product = Product.new
	end

	def create
		@product = Product.new(product_params)
		
	  if @product.save
	  	p "*" * 40
	    p params
	    redirect_to image_path
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