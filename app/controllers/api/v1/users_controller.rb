class Api::V1::UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy]

  def index
    return @users = User.all if params.blank?
    @users = User.name_like(params[:name])
                 .by_addr1(params[:addr1])
                 .addr2_like(params[:addr2])
    respond_to do |format|
      # format.html # index.html.erb
      format.json # index.json.jbuilder
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)

    if @user.save
      render :show, status: :created, location: [:api, :v1, @user]
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  def update
    if @user.update(user_params)
      render :show, status: :ok, location: [:api, :v1, @user]
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @user.destroy
    respond_to do |format|
      format.json { head :no_content }
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.permit(:name, :addr1, :addr2)
  end
end
