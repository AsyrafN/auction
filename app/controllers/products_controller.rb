class ProductsController < ApplicationController

	def index
		@product = Product.where(user_id: current_user.id)
	end

	def search
		@product = Product.all
		@product = Product.search_by_name(params[:search])
		
	end

	def ajax_search
	   @product = Product.all
	   @product = Product.search_by_name(params[:search])
	   autofill = []
	   @product.each do |p|

	   	autofill << p.name

	   end
	   render :json => { autofill: autofill }
	  
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
		@client_token = Braintree::ClientToken.generate
		@product = Product.find(params[:id])
		
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

	def checkout
	  nonce_from_the_client = params[:checkout_form][:payment_method_nonce]
	  product = Product.find(params[:id])
	  result = Braintree::Transaction.sale(
	   :amount => "#{product.original_price}", #this is currently hardcoded
	   :payment_method_nonce => nonce_from_the_client,
	   :options => {
	      :submit_for_settlement => true
	    }
	   )
	  if result.success?
	  	flash[:success] = "Your transaction has successful"
	    redirect_to :root
	  else
	    redirect_to :root, :flash => { :error => "Transaction failed. Please try again." }
	  end
	end

	private
		def product_params
			params.require(:product).permit(:name, :original_price, :description)
		end
end
