# frozen_string_literal: true

class Album < ApplicationRecord
  scope :with_details, -> { includes(%i[artist genre]) }
  scope :count_by, ->(rank) { group(rank).count }

  belongs_to :artist
  belongs_to :genre
  validates_length_of :name, maximum: 120
  validates_presence_of :name

  validates_presence_of :year
  validates_inclusion_of :year, in: 1889..Time.new.year
  validates_length_of :year, is: 4

  accepts_nested_attributes_for :artist
  accepts_nested_attributes_for :genre
end
