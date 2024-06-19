class TodoListsController < ApplicationController
  before_action :authenticate_user!

  def index
    p current_user.id
    @todo_lists = current_user.todo_lists.includes(:todos)
    p @todo_lists
    render json: @todo_lists.to_json(include: :todos)
  end

  def show
    @todo_list = current_user.todo_lists.find(params[:id])
    render json: @todo_list
  end

  def create
    @todo_list = current_user.todo_lists.build(todo_list_params)
    if @todo_list.save
      create_todos(@todo_list, todos_params)
      render json: @todo_list, status: :created
    else
      render json: @todo_list.errors, status: :unprocessable_entity
    end
  end

  def update
    @todo_list = current_user.todo_lists.find(params[:id])
    if @todo_list.update(todo_list_params)
      render json: @todo_list
    else
      render json: @todo_list.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @todo_list = current_user.todo_lists.find(params[:id])
    @todo_list.destroy
    head :no_content
  end

  private

  def todo_list_params
    params.require(:todo_list).permit(:title, :status, :priority, :due_date, :shared, assigned: [])
  end

  def todos_params
    params.require(:todos).map { |todo| todo.permit(:title, :description) }
  end

  def create_todos(todo_list, todos_params)
    todos_params.each do |todo_params|
      todo_list.todos.create(todo_params)
    end
  end
end