class Grupo < ApplicationRecord
  belongs_to :curso
  validates :nombre, presence: true
end
