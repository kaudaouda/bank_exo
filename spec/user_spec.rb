RSpec.describe User do
  it 'has a name' do
    user = User.new
    expect(user).to respond_to(:name)
  end
end