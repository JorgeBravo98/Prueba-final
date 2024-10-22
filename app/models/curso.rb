class Curso < ApplicationRecord
  belongs_to :profesor
  has_and_belongs_to_many :alumnos
  has_many :grupos, dependent: :destroy

  validates :nombre, presence: true
  validates :sigla, presence: true, uniqueness: true
end
