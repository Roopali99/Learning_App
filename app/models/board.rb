class Board < ApplicationRecord
    belongs_to :account
    has_many :standards, dependent: :destroy
    has_many :subject, through: :standard
    has_many :chapters,through: :subject
    validates_presence_of :board_nm, :board_description, :board_logo
end
