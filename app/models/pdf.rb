class Pdf < ApplicationRecord
  belongs_to :lessos
  validates_presence_of :pdf_name
  validates_presence_of :pdf_link
  validates_presence_of :pdf_length
  validates_presence_of :status
  validates_presence_of :pdf_read_status
 
end
