class Cat < ActiveRecord::Base

  validates :age, :numericality => true
  validates :color, inclusion: { in: ['black', 'blue', 'brown', 'tan', 'orange']}
  validates :sex, inclusion: { in: ['m', 'f']}
  validates :age, :color, :sex, :name, :birthdate, :presence => true

  has_many :cat_rental_requests, :dependent => :destroy



end