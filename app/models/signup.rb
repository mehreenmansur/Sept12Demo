class Signup < ActiveRecord::Base
  has_many :items, dependent: :destroy
  accepts_nested_attributes_for :items, allow_destroy: true

  # has_many :signup_items, dependent: :destroy
  # accepts_nested_attributes_for :signup_items, allow_destroy: true
end
