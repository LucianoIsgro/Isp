class Plan < ApplicationRecord
    
    validates :nombre, :descripcion, presence: true

    belongs_to :internet_provider

    has_many :requests
    has_many :clients, through: :requests 
      
    

end
