require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

require_relative 'cash_register'
require_relative 'transaction'

class CashRegisterTest < MiniTest::Test
  def test_give_receipt
    register = CashRegister.new(1000)
    transaction = Transaction.new(100)
    assert_output("You've paid $100.\n") {register.give_receipt(transaction)}
  end
end