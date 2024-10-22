class Grupo < ApplicationRecord
  belongs_to :curso
  validates :nombre, presence: true
  has_and_belongs_to_many :alumnos
end
