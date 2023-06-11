class InternetProvider < ApplicationRecord

    validates :name, :token, presence: true

    has_many :plans, dependent: :destroy



end
