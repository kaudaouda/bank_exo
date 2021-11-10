RSpec.describe Account do
  it 'has a balance' do
    expect(Account.new).to respond_to(:balance)
  end

  context 'when created' do
    it 'has a balance of 0' do
      expect(Account.new.balance).to eq(0)
    end
  end

  describe '.deposit' do
    before do
      @account = Account.new
    end
    context 'when amount is positive' do
      it 'increments the balance' do
        @account.deposit(1000)
        expect(@account.balance).to eq(1000)
      end
    end
      
    context 'when amount is negative' do
      it 'does not change the balance' do
        @account.deposit(-1000)
        expect(@account.balance).to eq(0)
      end
    end
  end
end