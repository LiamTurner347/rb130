require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

require_relative 'cash_register'
require_relative 'transaction'

class TransactionTest < MiniTest::Test
  def test_prompt_for_payment
    transaction = Transaction.new(30)
    input = StringIO.new("40\n")
    transaction.prompt_for_payment(input: input)
    assert_equal(40.0, transaction.amount_paid)
  end
end