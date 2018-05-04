class Url < ApplicationRecord
  validates :original_url, presence: true, on: :create
  validates_format_of :original_url, with: (/\A(?:(?:http|https):\/\/)?([-a-zA-Z0-9.]{2,256}\.[a-z]{2,4})\b(?:\/[-a-zA-Z0-9@,!:%_\+.~#?&\/\/=]*)?\z/)
  has_many :audit_logs
end
