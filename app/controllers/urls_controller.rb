class UrlsController < ApplicationController
  before_action :set_url, only: [:show]

  def index
    @urls = Url.page(params[:page])
  end

  def new
    @url = Url.new
  end

  def show; end

  def shortened
    @url = Url.find_by(shortened: params[:shortened])
    audit_log if @url.present?
    redirect_to @url.customized_url
  end

  def create
    @url = Url.new(url_params)
    decorator = Urls::Decorator.new(@url)

    if decorator.exists?
      flash[:alert] = "Short URL aleready existing! #{decorator.duplicate.shortened_url}"
      redirect_to urls_path
    else
      decorator.add_fields
      if decorator.save
        flash[:success] = "URL Shortened created Successfuly! #{@url.shortened_url}"
        redirect_to urls_path
      else
        render 'new'
      end
    end
  end

  private

  def set_url
    @url = Url.find_by(id: params[:id])
  end

  def url_params
    params.require(:url).permit(:original_url, :customized_url)
  end

  def audit_log
    args = {
      remote_addr: request.remote_addr,
      remote_host: request.remote_host,
      remote_ip: request.remote_ip,
      remote_user: request.remote_user,
      user_agent: request.user_agent,
      uuid: request.uuid,
      client_ip: request.client_ip
    }

    @url.audit_logs.create(request_details: args)
  end
end
