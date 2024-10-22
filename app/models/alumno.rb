class Alumno < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_and_belongs_to_many :grupos
  validates :numero_alumno, presence: true
end
