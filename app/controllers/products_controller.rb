class ProductsController < ApplicationController

	def index
		@product = Product.where(user_id: current_user.id)
	end

	def search
		if params[:search].present?
	      @product = Product.perform_search(params[:search])
	    else
	      @product = Product.all
	    end
	end

	def new
	end

	def edit
		@product = Product.find(params[:id])
	end

	def update
		@product = Product.find(params[:id])
	    if @product.update(product_params)
	      redirect_to products_path
	    else
	      render '/products/product.id/edit'
	    end
	end

	def destroy
		@product = Product.find(params[:id])
        @product.destroy
        respond_to do |format|
        	format.html { redirect_to products_path, notice: 'The product was successfully deleted.' }
        	format.json { head :no_content }
	    end
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
