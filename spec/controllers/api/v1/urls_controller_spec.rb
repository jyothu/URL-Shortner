require 'rails_helper'

RSpec.describe Api::V1::UrlsController do

  describe "POST #create" do
    it "renders the :create template" do
      post :create, params: { url: attributes_for(:url) }
      expect(response).to render_template 'api/v1/urls/create.json.jbuilder'
    end

    context "with valid attributes" do
      context "with a new url" do
        it "creates a new url entry" do
          expect{
            post :create, params: { url: attributes_for(:url, original_url: 'jyothishkumar.in') }
          }.to change(Url, :count).by(1)
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
      end
    end

    context "with invalid attributes" do
      it "does not create a new URL" do
        expect{
          post :create, params: { url: attributes_for(:url, original_url: nil) }
        }.to_not change(Url, :count)
      end
    end
  end
end
