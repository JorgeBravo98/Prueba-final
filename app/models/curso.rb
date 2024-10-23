class Curso < ApplicationRecord
  belongs_to :profesor
  has_and_belongs_to_many :alumnos
  has_many :grupos, dependent: :destroy

  validates :nombre, presence: true
  validates :sigla, presence: true, uniqueness: true
  has_many :inscripciones, class_name: 'Inscripcion'
  has_many :alumnos, through: :inscripciones
end
