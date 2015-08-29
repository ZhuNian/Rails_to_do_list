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
    # @toDo = ToDo.new(user_params)
    # @toDo.statue = false;
    # if @toDo.save
    #   redirect_to to_dos_url
    # else
    #   render 'index'
    # end
  end

  def add
    to_do = ToDo.new(user_params)
    to_do.save
    # render json: {id: to_do.id, title: to_do.title}
    # render json: {status:"true"}
    render partial: '/to_dos/show_list' , locals: {toDo: to_do}
  end

  def delete
    to_do = ToDo.find(params[:id])
    to_do.delete
  end

  def change_status
    to_do = ToDo.find(user_id_params['id'])
    to_do.update(add_params)
    to_do.save
  end

  def edit_to_do
    title = edit_params[:title]
    text = edit_params[:text]
    to_do = ToDo.find(edit_params[:id])
    to_do.update(title:title,text:text)
  end

  def user_params
    params.require(:to_do).permit(:title, :text,:statue)
  end

  def add_params
    params.require(:to_do).permit(:id,:statue)
  end

  def user_id_params
    params.require(:to_do).permit(:id,:statue)
  end

  def user_id
    params.require(:to_do).permit(:id)
  end

  def edit_params
    params.require(:data).permit(:id,:title,:text)
  end
end
