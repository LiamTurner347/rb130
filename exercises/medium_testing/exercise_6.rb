require 'minitest/autorun'

require_relative 'cash_register'
require_relative 'transaction'

class TransactionTest < MiniTest::Test
  def test_prompt_for_payment
    transaction = Transaction.new(30)
    io_input = StringIO.new("40\n")
    io_output = StringIO.new
    transaction.prompt_for_payment(input: io_input, output: io_output)
    assert_equal(40.0, transaction.amount_paid)
  end
end