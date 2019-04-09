# frozen_string_literal: true

class Genre < ApplicationRecord
  has_many :albums
  validates_uniqueness_of :name
  validates_length_of :name, maximum: 120
  validates_presence_of :name
end
