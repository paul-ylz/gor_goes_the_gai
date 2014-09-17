class Alphabet < ActiveRecord::Base
  has_one :consonant, dependent: :destroy
  accepts_nested_attributes_for :consonant
end
