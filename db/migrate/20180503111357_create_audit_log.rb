class CreateAuditLog < ActiveRecord::Migration[5.0]
  def change
    create_table :audit_logs do |t|
      t.bigint :url_id
      t.text :request_details
      t.timestamps
    end

    add_index :audit_logs, :url_id
  end
end
