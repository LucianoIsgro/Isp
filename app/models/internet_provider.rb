class InternetProvider < ApplicationRecord

    has_many :plans, dependent: :destroy



end
