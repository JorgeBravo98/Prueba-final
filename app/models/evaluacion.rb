class Evaluacion < ApplicationRecord
  belongs_to :curso

  # Validaciones adicionales si es necesario
  validates :nombre_evaluacion, presence: true
  validates :calificacion, numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 7 }
end
