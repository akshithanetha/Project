class ManagersController < ApplicationController
  def index
    managers = Manager.all
    render json: managers, status: 200
  end

  def members
    manager = Manager.find(params[:id])
    members = manager.employees
    render json: members, status: 200
  end

  def show
    manager = Manager.find(params[:id])
    render json: manager, status: 200
  end

  def create
    manager = Manager.new(manager_params)
    if manager.save
      render json: manager, status: 200
    else
      render json: {message: "Manager Cannot be created", error: manager.errors.full_messages}
    end
  end

  def update
    manager = Manager.find(params[:id])
    if manager.update(manager_params)
      render json: manager, status: 200
    else
      render json: {message: "Manager cannot be updated", error: manager.errors.full_messages}
    end
  end

  def destroy
    manager = Manager.find(params[:id])
    manager.destroy
    render json: {message: "Record Destroyed Successfully"}
  end

  private

  def manager_params
    params.require(:manager).permit(:name)
  end
end
