class Urls::Decorator
  attr_accessor :url, :duplicate

  def initialize(url)
    @url = url
  end

  def exists?
    url.customized_url = customized_url
    duplicate.present?
  end

  def duplicate
    @duplicate = Url.find_by(customized_url: url.customized_url)
  end

  def add_fields
    url.customized_url ||= customized_url
    url.shortened = shortened
    url.shortened_url = shortened_url
  end

  def customized_url
    url.original_url.strip!
    curl = url.original_url.downcase.gsub(/(https?:\/\/)|(www\.)/, "")
    curl.slice!(-1) if curl[-1] == "/"
    "http://#{curl}"
  end

  def shortened
    chars = ['0'..'9', 'A'..'Z', 'a'..'z'].map { |range| range.to_a }.flatten
    # Assign a shortened
    shortened = 6.times.map { chars.sample }.join
    # If shortened already existing should create a unique one
    until Url.find_by(shortened: shortened).nil?
      shortened = 6.times.map { chars.sample }.join
    end
    shortened
  end

  def shortened_url
    "#{host}/#{url.shortened}"
  end

  def save
    url.save
  end

  def save!
    url.save!
  end

  private

  def host
    Rails.application.config.action_controller.default_url_options[:host]
  end
end
