class Alumno < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_and_belongs_to_many :grupos
  validates :numero_alumno, presence: true

  has_many :inscripciones, class_name: 'Inscripcion', dependent: :destroy
  has_many :cursos, through: :inscripciones
end
