class ReviewsController < ApplicationController
  def new
    # GET request para ver o formulario
    # criando um Task novo SEM ATRIBUTOS para poder criar o formulario
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new
  end

  def create
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new(new_review_params)
    @review.restaurant = @restaurant
    if @review.save
      redirect_to restaurant_path(@restaurant.id)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  # params para criar um Task (apenas title + details)
  # não queremos deixar o usuario criar um Task com 'completed: true'
  def new_review_params
    params.require(:review).permit(:rating, :content)
  end

end
