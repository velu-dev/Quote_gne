module Api
  module V1
class UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy]

  # GET /users
  def index
    @users = User.all

    render json: @users
  end


  def login
    user = User.authenticate(params)
    render json: user
  end

  def update_password
    user = User.updatepass(params)
    render json: user
  end
  def signup
    user = User.create!(name: params[:name],email_id: params[:email_id],address: params[:address],mobile_no: params[:mobile_no],username: params[:username],password: params[:password],user_type_id: params[:user_type_id],user_role_id: params[:user_role_id])
  end
  def user_type
    user_type = UserType.all
    roles = UserRole.all
    data={
      :user_type => user_type,
      :roles=> roles
    }    
    render json: data
  end

  def client
     data = params[:type].present? ? User.all.order(:id).where(user_type: params[:type]) : User.all.order(:id)
     render json: data
  end
  # GET /users/1
  def show
    render json: @user
  end
  

  # POST /users
  def create
    byebug
    @user = User.new(user_params)
    if @user.save
      render json: @user, status: :created, location: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /users/1
  def update
    if @user.update(user_params)
      render json: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /users/1
  def destroy
    @user.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def user_params
      params.require(:user).permit(:name, :email_id, :address, :mobile_no, :username, :password, :belongs_to, :belongs_to)
    end
end
end
end