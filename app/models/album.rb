class Album < ActiveRecord::Base
  has_many :pictures, inverse_of: :album, dependent: :destroy
  accepts_nested_attributes_for :pictures, allow_destroy: true
end
