class DogsController < ApplicationController
before_action :find_id, only: [:show, :edit, :update]

  def index
    @dogs = Dog.all
  end

  # def show 
  #   # byebug
  #   @dog = Dog.find(params[:id])
  # end

  def new 
    @dog = Dog.new
  end

  def create 
    @dog = Dog.create(dog_params)
    if @dog.save
    redirect_to @dog.user #user show path
    else
      # byebug
      flash[:errors] = @dog.errors.full_messages
      render :new
     end
  end


  def update 
    if @dog.update(params.require(:dog).permit(:name, :age, :breed, :size, :bio, :image_url))
      redirect_to dog_path
    else
      flash[:errors] = @dog.errors.full_messages
      render :edit
     end
  end

  def destroy 
    @dog.delete
    redirect_to user_path
  end

  def dog_like
    
  end

  private

  def dog_params 
    params.require(:dog).permit(:name, :age, :breed, :size, :bio, :image_url, :user_id)
  end

  def find_id
    @dog = Dog.find(params[:id])
  end

end
