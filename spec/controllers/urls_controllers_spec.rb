require 'rails_helper'

RSpec.describe UrlsController do

  describe "GET #index" do
    it "assigns @urls" do
      url = Url.create
      get :index
      expect(assigns(:urls)).to eq([url])
    end

    it "has a 200 status code" do
      get :index
      expect(response.status).to eq(200)
    end

    it "renders the index template" do
      get :index
      expect(response).to render_template :index
    end
  end

  describe "GET #new" do
    it "assigns a new Url instance to @url" do
      get :new
      expect(assigns(:url)).to be_a_new(Url)
    end
  end
end
