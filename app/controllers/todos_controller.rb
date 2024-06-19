class TodosController < ApplicationController
  before_action :authenticate_user!
  before_action :set_todo_list

  def index
    @todos = @todo_list.todos
    render json: @todos
  end

  def show
    @todo = @todo_list.todos.find(params[:id])
    render json: @todo
  end

  def create
    @todo = @todo_list.todos.build(todo_params)
    if @todo.save
      render json: @todo, status: :created
    else
      render json: @todo.errors, status: :unprocessable_entity
    end
  end

  def update
    @todo = @todo_list.todos.find(params[:id])
    if @todo.update(todo_params)
      render json: @todo
    else
      render json: @todo.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @todo = @todo_list.todos.find(params[:id])
    @todo.destroy
    head :no_content
  end

  private

  def set_todo_list
    @todo_list = current_user.todo_lists.find(params[:todo_list_id])
  end

  def todo_params
    params.require(:todo).permit(:title, :description, :completed, :completed_at)
  end
end