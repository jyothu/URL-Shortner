require 'rails_helper'

RSpec.describe Url do
  it "is valid with a valid url" do
    expect(Url.new(original_url: "jyothishkumar.in")).to be_valid
  end

  it { is_expected.to validate_presence_of(:original_url) }
  it { should allow_value('http://bar.com').for(:original_url).on(:create) }
  it { should_not allow_value('blahblah').for(:original_url).on(:create) }
end
