class ProductsController < ApplicationController

	def index
		@product = Product.all
		if params[:search].present?
	      @product = Product.perform_search(params[:search])
	    else
	      @product = Product.all
	    end
	end

	def new
	end

	def show
		
	end

	def create

		user = User.find(current_user.id)
		product = Product.new(product_params)
		product.user_id = user.id

		if product.save
			redirect_to products_path
		else
			redirect_to root_path
		end
	end

	private
		def product_params
			params.require(:product).permit(:name, :original_price, :description)
		end
end
