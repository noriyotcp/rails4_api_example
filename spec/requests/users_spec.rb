require 'rails_helper'

RSpec.describe "Users", type: :request do
  describe "GET api/v1/users" do
    let!(:users) { FactoryGirl.create_list(:user, 2) }
    let!(:saitamas) { FactoryGirl.create_list(:user, 2, :saitama) }

    before { get api_v1_users_path(addr1: "東京都", format: :json) }

    it "works! (now write some real specs)" do
      expect(response).to have_http_status(200)
    end

    it "should get json" do
      json = JSON.parse(response.body)
      expect(json.size).to eq users.count
      expect(json[0]["id"]).to eq users[0].id
      expect(json[1]["id"]).to eq users[1].id
    end

    it "should not get json of saitama" do
      json = JSON.parse(response.body)
      expect(json[0]["id"]).not_to eq saitamas[0].id
      expect(json[1]["id"]).not_to eq saitamas[1].id
    end
  end

  describe "GET api/v1/users/:id" do
    let(:user) { FactoryGirl.create(:user) }

    before { get api_v1_user_path(user.id) }

    it "should be success" do
      expect(response).to have_http_status(200)
    end

    it "should get json" do
      json = JSON.parse(response.body)
      expect(json["id"]).to eq user.id
      expect(json["name"]).to eq user.name
      expect(json["addr1"]).to eq user.addr1
      expect(json["addr2"]).to eq user.addr2
    end
  end

  describe 'POST api/v1/users' do
    it 'shoud create a user' do
      address = Gimei.address
      params = { name: Gimei.kanji,
                         addr1: address.prefecture.kanji,
                         addr2: address.city.kanji + address.town.kanji }

     expect {
       post api_v1_users_path(format: :json), params
     }.to change { User.count }.by 1

     expect(response).to have_http_status 201

      json = JSON.parse(response.body)
      expect(json["name"]).to eq params[:name]
      expect(json["addr1"]).to eq params[:addr1]
      expect(json["addr2"]).to eq params[:addr2]
    end
  end
end
