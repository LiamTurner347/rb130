require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

require_relative 'cash_register'
require_relative 'transaction'

class CashRegisterTest < MiniTest::Test
  def test_change
    register = CashRegister.new(6)
    transaction = Transaction.new(100)
    transaction.amount_paid = 105
    assert_equal(5, register.change(transaction))
  end
end