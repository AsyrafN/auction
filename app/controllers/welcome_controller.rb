class WelcomeController < ApplicationController

	def index
		@product = Product.all
	end
end
