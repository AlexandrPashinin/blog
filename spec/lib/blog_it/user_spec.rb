require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { create(:user, name: 'oleg') }

  it 'returns a valid email' do
    expect(user.email).to eq('oleg@example.com')
  end

  it 'returns a valid last_name' do
    expect(user.last_name).to eq('Ivanov')
  end

  it 'returns a valid name' do
    expect(user.name).to eq('oleg')
  end

  it 'returns a valid nik_name' do
    expect(user.nik_name).to eq('olegnik')
  end
end
