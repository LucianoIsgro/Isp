class CreatePlans < ActiveRecord::Migration[7.0]
  def change
  
    create_table :plans do |t|

      t.string :nombre
      t.text :descripcion
      t.belongs_to :internet_provider, foreign_key: true
      t.timestamps
    end

  
  end
end
