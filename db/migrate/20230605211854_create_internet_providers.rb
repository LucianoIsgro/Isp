class CreateInternetProviders < ActiveRecord::Migration[7.0]
  def change
    create_table :internet_providers do |t|

      t.string  :name
      t.string :token
      
      t.timestamps
    end

    
  end
end
