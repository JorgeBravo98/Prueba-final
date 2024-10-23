class Inscripcion < ApplicationRecord
  belongs_to :alumno
  belongs_to :curso
end
