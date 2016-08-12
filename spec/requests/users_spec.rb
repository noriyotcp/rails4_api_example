require 'rails_helper'

RSpec.describe "Users", type: :request do
  describe "GET api/v1/users" do
    before {
      @users = FactoryGirl.create_list(:user, 2)
      @saitamas = FactoryGirl.create_list(:user, 2, :saitama)
    }
    it "works! (now write some real specs)" do
      get api_v1_users_path(addr1: "Tokyo", format: :json)
      expect(response).to have_http_status(200)
    end

    it "should get json" do
      get api_v1_users_path(addr1: "Tokyo", format: :json)
      json = JSON.parse(response.body)
      expect(json.size).to eq @users.count
      expect(json[0]["id"]).to eq @users[0].id
      expect(json[1]["id"]).to eq @users[1].id
    end

    it "should not get json of saitama" do
      get api_v1_users_path(addr1: "Tokyo", format: :json)
      json = JSON.parse(response.body)
      expect(json[0]["id"]).not_to eq @saitamas[0].id
      expect(json[1]["id"]).not_to eq @saitamas[1].id
    end
  end
end
