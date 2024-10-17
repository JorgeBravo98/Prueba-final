class Profesor < ApplicationRecord
  has_many :cursos
  self.table_name = 'profesores'
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable
end
