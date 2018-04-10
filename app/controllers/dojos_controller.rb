class DojosController < ApplicationController
  def index
    @dojos = Dojo.all
    @length = @dojos.length
  end
  def new
  end
  def create
    Dojo.create(brach: params['branch'], street: params['street'], city: params['city'], state: params['state'])
    redirect_to '/dojos'
  end
  def show
    @dojo = Dojo.find(params[:id])
  end
  def edit
    @dojo = Dojo.find(params[:id])
  end
  def update
    @dojo = Dojo.find(params[:id])
    @dojo.update(brach: params['branch'], street: params['street'], city: params['city'], state: params['state'])
    redirect_to '/dojos'
  end 
  def destroy
    Dojo.destroy(params[:id])
    redirect_to '/dojos'
  end
  private

    def dojo_params
      params.require(:dojo).permit(:brach, :street, :city,
                                   :state)
    end
end
