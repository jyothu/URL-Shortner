class Api::V1::UrlsController < ActionController::API
  include ActionController::MimeResponds

  def create
    @url = Url.new(url_params)
    decorator = Urls::Decorator.new(@url)

    if decorator.exists?
      @url = decorator.duplicate
    else
      decorator.add_fields
      decorator.save
    end

    render 'create.json.jbuilder'
  end

  private

  def url_params
    params.require(:url).permit(:original_url)
  end
end
