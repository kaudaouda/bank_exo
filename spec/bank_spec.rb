RSpec.describe Bank do
  subject(:bank) { Bank.new}

  it 'has clients' do
    expect(bank).to respond_to(:clients)
  end

  context 'when created' do
    it 'has no clients' do
      expect(bank.clients.size).to eq(0)
    end
  end

  describe '.create_account_for' do
    context 'with no clients' do
      before do
        @user = User.new
        bank.create_account_for(@user)
      end
      it 'add user as key' do
        expect(bank.clients).to have_key(@user)
      end

      it 'adds account for user key' do
        expect(bank.clients[@user]).to be_an Account
      end

      it 'has a client' do
        expect(bank.clients.size).to eq(1)
      end
    end

    context 'with clients' do
      before do
        @user1 = User.new
        bank.clients[@user1] = Account.new
      end
      it 'has one more clients' do
        size = bank.clients.size
        user2 = User.new
        bank.create_account_for(user2)
        expect(bank.clients.size).to eq(size + 1)
      end

      it 'does not override an existing user account' do
        account = bank.clients[@user1]
        bank.create_account_for(@user1)
        expect(bank.clients[@user1]).to eq(account)
      end
    end

  end

  describe '.deposit' do
    before do
      @user = User.new
      bank.create_account_for(@user)
    end
    it 'calls deposit of account' do
      account_dbl = double("Account")
      bank.clients[@user] = account_dbl
      amount = 1000
      expect(account_dbl).to receive(:deposit).with(amount)
      bank.deposit(@user, amount)
    end
  end
end