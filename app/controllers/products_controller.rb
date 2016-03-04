class ProductsController < ApplicationController
	before_action :set_image, only: [:create, :edit, :update, :destroy]
	def new
		
	end

	def create
		@product = Product.find_or_create_by(product_params)
	  if @product.save
	    @product.image = @image
	    redirect_to product_path(@product)
	  else
	    render action: :new
	  end
	end

	private
    # Use callbacks to share common setup or constraints between actions.
    def set_image
      @image = Image.find_by(id: params[:id])
    end

end