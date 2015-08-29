require 'rails_helper'

describe User, type: :model do
  describe '.new' do
    let(:user) { build(:user) }
    subject { user }

    it { is_expected.to respond_to(:name) }
    it { is_expected.to respond_to(:email) }
  end
end
