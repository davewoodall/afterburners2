# frozen_string_literal: true

class Artist < ApplicationRecord
  scope :and_albums, -> { includes(:albums) }

  has_many :albums, dependent: :destroy
  validates_uniqueness_of :name
  validates_length_of :name, maximum: 120
  validates_presence_of :name
end
