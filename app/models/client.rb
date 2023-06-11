class Client < ApplicationRecord
  has_many :requests
  has_many :plans, through: :requests
    
    
end
