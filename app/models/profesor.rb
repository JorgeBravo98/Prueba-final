class Profesor < ApplicationRecord
  # Relación con cursos
  has_many :cursos, dependent: :destroy
  
  # Establece el nombre de la tabla a 'profesores' si no lo hace automáticamente
  self.table_name = 'profesores'

  # Devise módulos para autenticación
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable

  # Validaciones adicionales para asegurar consistencia en los datos
  validates :nombre, presence: true
  validates :apellido, presence: true
  validates :nombre_usuario, presence: true, uniqueness: true

  # Otros campos personalizados, si es necesario
  # validates :avatar, presence: true  # Solo si es requerido el campo avatar
end
