class CountriesController < ApplicationController
  
  def index
    @countries = Country.all
  end

  def show
    @country = Country.find(params[:id])
  end

  def new
    @country = Country.new
  end

  def create
    @country = Country.new(params.require(:country).permit(:name, :code))

    if @country.save
      redirect_to :action => 'index'
    else
      @country = Country.all
      render :action => 'new'
    end
  end

  def edit
    @country = Country.find(params[:id])
  end

  def update
    
    @country = Country.find(params[:id])
    # @user = User.find(params[:id])
    if @country.update(country_params)
        redirect_to action: 'index', controller: "countries"
    else
      render 'edit'
    end
  end

  def destroy
    Country.find(params[:id]).destroy
    redirect_to :action => 'index'
  end

  private
  def country_params
    params.require(:country).permit(:name, :code)
  end
end
