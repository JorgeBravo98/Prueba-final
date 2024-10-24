class Archivo < ApplicationRecord
  belongs_to :curso
  has_one_attached :file

  before_destroy :purge_file
  
  validates :nombre, presence: true

  private

  def purge_file
    file.purge
  end
end
