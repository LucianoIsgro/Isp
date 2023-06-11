class Plan < ApplicationRecord

    belongs_to :internet_provider

    has_many :requests
    has_many :clients, through: :requests 
      
    

end
