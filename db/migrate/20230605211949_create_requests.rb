class CreateRequests < ActiveRecord::Migration[7.0]
  def change
    create_table :requests do |t|

    t.column :estado, :integer, default: 0

    t.belongs_to :client, foreign_key: true
    t.belongs_to :plan, foreign_key: true


    t.timestamps
    end
  end
end
