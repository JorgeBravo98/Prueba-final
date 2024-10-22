class Grupo < ApplicationRecord
  belongs_to :curso
  has_and_belongs_to_many :alumnos

  # Validación de presencia del nombre
  validates :nombre, presence: true

  # Validación para asegurar que el grupo tenga al menos un alumno
  validate :must_have_at_least_one_alumno

  private

  def must_have_at_least_one_alumno
    if alumnos.empty?
      errors.add(:alumnos, "El grupo debe tener al menos un alumno")
    end
  end
end
