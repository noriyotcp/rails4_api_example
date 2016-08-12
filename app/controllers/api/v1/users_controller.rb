class Api::V1::UsersController < ApplicationController
  def index
    @users = User.where("addr1 = ?", user_params[:addr1])
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

  private

  def user_params
    params.permit(:addr1)
  end
end
