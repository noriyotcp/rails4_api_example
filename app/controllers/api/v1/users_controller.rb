class Api::V1::UsersController < ApplicationController
  def index
    return @users = User.all if user_params.blank?
    @users = User.name_like(user_params[:name])
                 .by_addr1(user_params[:addr1])
                 .by_addr2(user_params[:addr2])

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

  private

  def user_params
    params.permit(:name, :addr1, :addr2)
  end
end
