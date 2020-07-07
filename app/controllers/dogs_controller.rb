class DogsController < ApplicationController
before_action :find_id, only: [:show, :edit, :update]

  # def show 
  #   # byebug
  #   @dog = Dog.find(params[:id])
  # end

  def new 
    @dog = Dog.new
  end

  def create 
    @dog = Dog.new(dog_params)
    @dog.save
    redirect_to user_path #user show path
  end

  def update 
    @dog.update(dog_params)
    redirect_to 
  end

  # def destroy 

  # end

  private

  def dog_params 
    params.require(:dog).permit(:name, :age, :breed, :size, :bio, :user_id)
  end

  def find_id
    @dog = Dog.find(params[:id])
  end

end
