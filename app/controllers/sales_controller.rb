class SalesController < ApplicationController
  def index
  	@sales = Sale.all
  end	

  def new
  	@sale = Sale.new
  end

  def show
  	@sale = Sale.find(params[:id])
  end

  def create
  	@sale = Sale.new(sale_params)
  	@sale.total = @sale.value * (1 - (@sale.discount.to_f/100))
  	@sale.cod = SecureRandom.hex
  	if @sale.tax == 0
  		@sale.total *= 1.19
  		@sale.tax = 19
  	else
  		@sale.tax = 0
  	end
  	if @sale.save
  		redirect_to sales_done_path(@sale)
  	else
  		redirect_to sales_new_path
  	end
  end

  def done
  	@sale = Sale.find(params[:id])
  end

  private

  def sale_params
  	params.require(:sale).permit(:detail, :category, :value, :discount, :tax, :total)
  end
end

