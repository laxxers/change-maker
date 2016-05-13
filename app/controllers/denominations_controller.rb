class DenominationsController < ApplicationController
  def index
    @denominations = Denomination.order(value: :desc)
  end

  def new
    @denomination = Denomination.new
  end
  
  def show
  end
  
  def create
    @denomination = Denomination.new(deno_params)
    if @denomination.save
      flash[:success] = "Added new record!"
      redirect_to denominations_url
    else
      render 'new'
    end
  end
  
  def update
    @denomination = Denomination.find(params[:id])
    if @denomination.update_attributes(deno_params)
      flash[:success] = "Denomination updated!"
      redirect_to denominations_url
    else
      render 'edit'
    end
  end
  
  def edit
    @denomination = Denomination.find(params[:id])
  end

  def destroy
    Denomination.find(params[:id]).destroy
    flash[:success] = "Denomination deleted!"
    redirect_to denominations_url
  end
  
  private

    def deno_params
      params.require(:denomination).permit(:name, :value)
    end
end
