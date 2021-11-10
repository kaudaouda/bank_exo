class Bank
  attr_accessor :clients

  def initialize()
    @clients = {}
  end

  def create_account_for(user)
    @clients[user] = Account.new() unless clients.has_key?(user)
  end

  def deposit(user, amount)
    account = @clients[user]
    account.deposit(amount)
  end
end