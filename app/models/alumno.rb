class Alumno < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_and_belongs_to_many :grupos
  validates :numero_alumno, presence: true

  has_many :inscripcions, dependent: :destroy
  has_many :cursos, through: :inscripcions
end
