class Curso < ApplicationRecord
  belongs_to :profesor
  has_many :grupos, dependent: :destroy

  validates :nombre, presence: true
  validates :sigla, presence: true, uniqueness: true

  # Asegúrate de declarar primero la relación intermedia
  has_many :inscripcions, dependent: :destroy
  has_many :alumnos, through: :inscripcions
end
