class Anuncio < ApplicationRecord
  belongs_to :curso
  belongs_to :profesor

  validates :titulo, presence: true
  validates :contenido, presence: true
end
