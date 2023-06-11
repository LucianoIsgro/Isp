class Client < ApplicationRecord
  
  validates :nombre, :dni, :token, presence: true
  
  has_many :requests
  has_many :plans, through: :requests
    
    
end
