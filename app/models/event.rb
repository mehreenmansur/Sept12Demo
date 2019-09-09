# frozen_string_literal: true

class Event < ActiveRecord::Base
  # has_many :event_people, dependent: :destroy, inverse_of: :event
  # has_many :event_things, dependent: :destroy, inverse_of: :event
  has_many :things, dependent: :destroy
  has_many :persons, dependent: :destroy
  has_many :items, dependent: :destroy

  accepts_nested_attributes_for :things, allow_destroy: true
  accepts_nested_attributes_for :persons, allow_destroy: true
  # mount_uploader :image, ImageUploader


  # has_and_belongs_to_many :faculties
  # has_and_belongs_to_many :departments
  # belongs_to :club, optional: true
  # belongs_to :on_campus, optional: true

end
