class Curso < ApplicationRecord
  belongs_to :profesor
  has_many :grupos, dependent: :destroy
  has_many :archivos, dependent: :destroy

  validates :nombre, presence: true
  validates :sigla, presence: true, uniqueness: true

  has_many :evaluaciones, class_name: 'Evaluacion', dependent: :destroy

  # Asegúrate de declarar primero la relación intermedia
  has_many :inscripcions, dependent: :destroy
  has_many :alumnos, through: :inscripcions
end
