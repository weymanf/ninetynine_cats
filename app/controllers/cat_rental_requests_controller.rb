class CatRentalRequestsController < ApplicationController
  def new
    @cats = Cat.all
    @cat_request = CatRentalRequest.new
  end

  def create
    @cats = Cat.all

    @cat_request = CatRentalRequest.new(rental_params)
    if @cat_request.save
      redirect_to cats_url
    else
      render :new
    end
  end

  def approve
    @cat_request = CatRentalRequest.find(params[:cat_rental_request_id])
    @cat_request.approve!
    redirect_to :back
  end

  def deny
    @cat_request = CatRentalRequest.find(params[:cat_rental_request_id])
    @cat_request.deny!
    redirect_to :back
  end

  private

  def rental_params
    params.require(:cat_rental_request).permit(:cat_id, :start_date, :end_date)
  end
end
