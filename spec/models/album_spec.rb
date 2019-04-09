# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Album, type: :model do
  subject { create(:album) }

  describe '#name' do
    it { is_expected.to have_db_column(:name) }
    it { is_expected.to have_db_index(:name) }
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_length_of(:name).is_at_most(120) }
  end

  describe '#year' do
    it { is_expected.to have_db_column(:year) }
    it { is_expected.to have_db_index(:year) }
    it { is_expected.to validate_presence_of(:year) }
  end
end
