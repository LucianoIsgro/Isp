class Request < ApplicationRecord

    enum estado: [:pendiente, :aprobada, :rechazada]
   
    belongs_to :client
    belongs_to :plan

end
