class ToDosController < ApplicationController
  def new
    # @toDo = ToDo.new
  end

  def edit
  end

  def show
    @toDo = ToDo.find(params[:id])
  end

  def index
    @toDo = ToDo.new
    @toDoAll = ToDo.all
    @toDoTrue = ToDo.where(statue:true)
    @toDoFalse = ToDo.where(statue:false)
  end

  def create
    @toDo = ToDo.new(user_params)
    binding.pry
    if @toDo.save
      render 'index'
    else
      redirect_to to_dos_new_path
    end
  end

  def user_params
    params.require(:to_do).permit(:title, :text, :statue)
  end
end
