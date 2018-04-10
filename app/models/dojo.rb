class Dojo < ActiveRecord::Base
    validates :brach, :street, :city, :state, presence: true
    validates :state, length: { is: 2 }
    has_many :students
end
