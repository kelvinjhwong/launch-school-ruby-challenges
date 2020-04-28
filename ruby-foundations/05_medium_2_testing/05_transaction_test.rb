require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

require_relative '05_cash_register'
require_relative '05_transaction'

class TransactionTest < Minitest::Test
  attr_reader :cash_register, :transaction
  
  def setup
    @cash_register = CashRegister.new(1000)
    @transaction = Transaction.new(20)
  end
  
  def test_prompt_for_payment
    input = StringIO.new("30\n")
    output = StringIO.new
    transaction.prompt_for_payment(input: input, output: output)

    assert_equal 30.0, transaction.amount_paid
  end
end
