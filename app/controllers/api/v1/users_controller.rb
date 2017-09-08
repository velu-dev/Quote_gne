module Api
  module V1
class UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy]

  # GET /users
  def index
    @users = User.where(status: true)

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
    user = User.create!(name: params[:name],email_id: params[:email_id],address: params[:address],mobile_no: params[:mobile_no],username: params[:username],password: params[:password],company_name:params[:company_name],business_details:params[:business_details],user_type_id: params[:user_type_id],user_role_id: params[:user_role_id],status: true)
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
     data = params[:type].present? ? User.where(status: true).order(:id).where(user_type: params[:type]) : User.where(status: true).order(:id)
     render json: data
  end
  # GET /users/1
  def show
    render json: @user
  end
  

  # POST /users
  def create
    @user = User.new(user_params)
    if @user.save
      render json: @user, status: :created, location: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /users/1
  def update
    #@user = User.find(params[:id])
    if @user.update(user_params)#name: params[:name], email_id: params[:email_id], address: params[:address],mobile_no: params[:mobile_no],company_name: params[:company_name],business_details: params[:business_details])
      render json: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /users/1
  def destroy
    @user = User.find(params[:id])
    if @user.update(status: false)
      return true
    else
      return false
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def user_params
      params.require(:user).permit(:name, :email_id, :address, :mobile_no, :username, :password, :user_type_id, :user_role_id,:company_name, :business_details)
    end
end
end
end