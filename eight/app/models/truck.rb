class Truck < ActiveRecord::Base
    belongs_to :user
    validates :model, :presence => true
    validates :make, :presence => true
end
