class Profesor < ApplicationRecord
  self.table_name = 'profesores'
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable, :confirmable
end
