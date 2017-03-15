class CreateClusterHealthData < ActiveRecord::Migration[5.0]
  def change
    create_table :cluster_health_data do |t|
      t.json :doc
      t.string :cluster_id

      t.timestamps
    end
  end
end
