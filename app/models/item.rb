# frozen_string_literal: true

class Item < ActiveRecord::Base
  belongs_to :event
  # mount_uploader :image, ImageUploader


  # has_and_belongs_to_many :faculties
  # has_and_belongs_to_many :departments
  # belongs_to :club, optional: true
  # belongs_to :on_campus, optional: true

end
