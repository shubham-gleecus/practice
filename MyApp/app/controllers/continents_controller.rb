class ContinentsController < ApplicationController
  def index
    @continents = Continent.all
  end

  def show
    @continent = Continent.find(params[:id])
  end

  def new
    @continent = Continent.new
  end

  def create
    @continent = Continent.new(params.require(:continent).permit(:name, :short_name))

    if @continent.save
      redirect_to :action => 'index'
    else
      @continent = Continent.all
      render :action => 'new'
    end
  end

  def edit
    @continent = Continent.find(params[:id])
  end

  def update
    
    @continent = Continent.find(params[:id])
    # @user = User.find(params[:id])
    if @continent.update(continent_params)
        redirect_to action: 'index', controller: "continents"
    else
      render 'edit'
    end
  end

  def destroy
    Continent.find(params[:id]).destroy
    redirect_to :action => 'index'
  end

  private
  def continent_params
    params.require(:continent).permit(:name, :short_name)
  end
end
