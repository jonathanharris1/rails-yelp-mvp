class RestaurantsController < ApplicationController
  def new
    # We need @restaurant in our `simple_form_for`
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new
  end

 def index
    # recebe sinal de routes.rb dizendo que é pra invocar essa ação

    # define todas as variaveis necessarias
    @restaurants = Restaurant.all

    # renderizar index.html.erb
  end

  def show
    # @task = Task.find(1)
    @restaurant = Restaurant.find(params[:id])
  end

  def new
    # GET request para ver o formulario
    # criando um Task novo SEM ATRIBUTOS para poder criar o formulario
    @restaurant = Restaurant.new
  end

  def create
    # POST para criar Task
    # criar um Task novo usando a info que veio do formulario
    @restaurant = Restaurant.new(new_restaurant_params)
    # guardar no banco de dados
    if @restaurant.save
      redirect_to restaurant_path(@restaurant.id)
    else
      render :new, status: :unprocessable_entity
    end

    # raise

    # redireccionar ao show page do Task que acabamos de criar
    # redirect_to task_path(@task.id)
    # redirect_to task_path(2)
  end

  def edit
    # @task = Task.find(2)
    @restaurant = Restaurant.find(params[:id])
  end

  def update
    # achar o Task usando o ID nos parametros
    @restaurant = Restaurant.find(params[:id])
    # atualizar o Task usando a info que veio do formulario
    @restaurant.update(update_restaurant_params)

    # redireccionar ao show page do Task que acabamos de atualizar
    # redirect_to task_path(@task.id)
    # redirect_to task_path(2)
    redirect_to restaurant_path(@restaurant.id)
  end

  def destroy
    # achar o Task usando o ID nos parametros
    @restaurant = Restaurant.find(params[:id])
    # usar o metodo .destroy do ActiveRecord para deletar o Task do banco de dados
    @restaurant.destroy

    # redireccionar ao index page
    redirect_to restaurants_path, status: :see_other
  end

  private

  # params para criar um Task (apenas title + details)
  # não queremos deixar o usuario criar um Task com 'completed: true'
  def new_restaurant_params
    params.require(:restaurant).permit(:name, :address, :phone_number, :category)
  end

  # params para atualizar um Task (title, details + completed)
  def update_restaurant_params
    params.require(:restaurant).permit(:name, :address, :phone_number, :category)
  end



end
