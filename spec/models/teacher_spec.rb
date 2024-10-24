require 'rails_helper'

RSpec.describe Teacher, type: :model do
  # Association tests
  it { should have_many(:students).dependent(:destroy) }

  # Devise validations
  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:password) }
  it { should validate_length_of(:password).is_at_least(6) }

  describe 'Devise modules' do
    it { is_expected.to respond_to(:remember_me) }
    it { is_expected.to respond_to(:reset_password) }
    it { is_expected.to respond_to(:valid_password?) }
  end
end
