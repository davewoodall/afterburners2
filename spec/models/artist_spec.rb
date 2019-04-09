# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Artist, type: :model do
  subject { create(:artist) }

  describe '#name' do
    it { is_expected.to have_db_column(:name) }
    it { is_expected.to have_db_index(:name) }
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_length_of(:name).is_at_most(120) }
    it { is_expected.to validate_uniqueness_of(:name) }
  end
end
