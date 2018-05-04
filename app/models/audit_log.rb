class AuditLog < ApplicationRecord
  belongs_to :url
  serialize :request_details, Hash
end
