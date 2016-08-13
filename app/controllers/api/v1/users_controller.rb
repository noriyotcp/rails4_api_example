class Api::V1::UsersController < ApplicationController
  def index
    return @users = User.all if params.blank?
    @users = User.name_like(params[:name])
                 .by_addr1(params[:addr1])
                 .addr2_like(params[:addr2])
    # not use jbuilder
    # @users = @users.map do |user|
    #   {
    #     id: user.id,
    #     name: user.name,
    #     address: {
    #       addr1: user.addr1,
    #       addr2: user.addr2
    #     }
    #   }
    # end
    # render json: @users
    respond_to do |format|
      format.html # index.html.erb
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

  private

  def user_params
    params.permit(:name, :addr1, :addr2)
  end
end
