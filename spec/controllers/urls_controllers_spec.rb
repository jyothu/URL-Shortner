require 'rails_helper'

RSpec.describe UrlsController do

  describe "GET #index" do
    it "assigns @urls" do
      url = Url.create(original_url: 'jyothishkumar.in')
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

    it "should paginate urls" do
      get :index
      allow(Url).to receive(:page)
    end
  end

  describe "GET #new" do
    it "assigns a new Url instance to @url" do
      get :new
      expect(assigns(:url)).to be_a_new(Url)
    end
  end

  describe "GET #show" do
    before :each do
      @url = Url.new(original_url: "jyothishkumar.in")
      d = Urls::Decorator.new(@url)
      d.add_fields
      d.save
    end

    it "assigns the requested url to @url" do
      get :show, params: { id: @url.id }
      expect(assigns(:url)).to eq @url
    end

    it "has a 200 status code" do
      get :show, params: { id: @url.id }
      expect(response.status).to eq(200)
    end

    it "renders the show template" do
      get :show, params: { id: @url.id }
      expect(response).to render_template :show
    end
  end

  describe "GET #shortened" do
    before :each do
      @url = Url.new(original_url: "jyothishkumar.in", customized_url: 'jyothishkumar.in')
      d = Urls::Decorator.new(@url)
      d.add_fields
      d.save
    end

    it "redirects to the shortened url" do
      get :shortened, params: { shortened: @url.shortened }
      expect(response).to redirect_to(@url.customized_url)
    end

    it "has a 302 status code" do
      get :shortened, params: { shortened: @url.shortened }
      expect(response.status).to eq(302)
    end

    it "assigns the requested url to @url" do
      get :shortened, params: { shortened: @url.shortened }
      expect(assigns(:url)).to eq(@url)
    end
  end

  describe "POST #create" do
    context "with valid attributes" do
      context "with a new url" do
        it "creates a new url entry" do
          expect{
            post :create, params: { url: attributes_for(:url, original_url: 'jyothishkumar.in') }
          }.to change(Url, :count).by(1)
        end

        it "redirects to the url index page" do
          post :create, params: { url: attributes_for(:url, original_url: 'jyothishkumar.in') }
          expect(response).to redirect_to urls_path
        end
      end

      context "when url already exists in the database" do
        it "does not create a new url entry" do
          @url = Url.new(attributes_for(:url, original_url: 'jyothishkumar.in'))
          d = Urls::Decorator.new(@url)
          d.add_fields
          d.save

          expect{
            post :create, params: { url: attributes_for(:url, original_url: 'jyothishkumar.in') }
          }.to_not change(Url, :count)
        end

        it "redirects to the URL Index page" do
          post :create, params: { url: attributes_for(:url, original_url: 'jyothishkumar.in') }
          expect(response).to redirect_to urls_path
        end
      end
    end

    context "with invalid attributes" do
      it "does not create a new URL" do
        expect{
          post :create, params: { url: attributes_for(:url, original_url: nil) }
        }.to_not change(Url, :count)
      end

      it "renders the :new template" do
        post :create, params: { url: attributes_for(:url, original_url: nil) }
        expect(response).to render_template :new
      end
    end
  end
end
