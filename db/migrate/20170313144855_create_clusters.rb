class CreateClusters < ActiveRecord::Migration[5.0]
  enable_extension 'pgcrypto' unless extension_enabled?('pgcrypto')
  def change
    create_table :clusters, id: :uuid, default: 'gen_random_uuid()' do |t|
      t.string :master_url
      t.string :name
      t.timestamps
    end
  end
end
