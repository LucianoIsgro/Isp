class CreateRequests < ActiveRecord::Migration[7.0]
  def change
    create_table :requests do |t|

    t.belongs_to :client
    t.timestamps
    end
  end
end
