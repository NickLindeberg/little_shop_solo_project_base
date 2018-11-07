class RatingsController < ApplicationController

  def new
    @rating = Rating.new()
    @order_item = OrderItem.find(params[:order_item_id])
  end

  def create
    params[:rating][:user_id] = current_user.id
    @order_item = OrderItem.find(params[:order_item_id])
    @order = @order_item.order
    @rating = @order_item.ratings.create(rating_params)
    if @rating.save
      redirect_to order_path(@order)
    else
      render :new
    end
  end

  def update
    @rating = Rating.find(params[:id])
    if params[:attribute] == 'active'
      @rating.update(active: false)
      redirect_to orders_path
    else
      @rating.update(active: true)
      redirect_to orders_path
    end
  end

  def edit

  end


  private

  def rating_params
    params.require(:rating).permit(:user_id, :title, :description, :rating)
  end

end
