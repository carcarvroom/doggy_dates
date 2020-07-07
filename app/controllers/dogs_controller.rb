class DogsController < ApplicationController

  def show 
    # byebug
    @dog = Dog.find(params[:id])
  end

  def new 
    @dog = Dog.new
  end

  def create 
    @dog = Dog.new(dog_params)
    @dog.save
    redirect_to user_path #user show path
  end

  # <%# redirect to user show path %>

  private

  def dog_params 
    params.require(:dog).permit(:name, :age, :breed, :size, :bio, :user_id)
  end

end
