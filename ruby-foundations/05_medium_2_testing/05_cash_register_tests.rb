require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

require_relative '05_cash_register'
require_relative '05_transaction'

class CashRegisterTest < Minitest::Test
  attr_reader :cash_register, :transaction
  
  def setup
    @cash_register = CashRegister.new(1000)
    @transaction = Transaction.new(20)
  end
  
  def test_accept_money
    previous_amount = cash_register.total_money
    
    transaction.amount_paid = 20
    cash_register.accept_money(transaction)
    current_amount = cash_register.total_money
    
    assert_equal(previous_amount + transaction.amount_paid, current_amount)
  end
  
  def test_change
    previous_amount = cash_register.total_money

    transaction.amount_paid = 30
    amount_paid = transaction.amount_paid
    item_cost = transaction.item_cost
    change = cash_register.change(transaction)
    
    current_amount = cash_register.total_money
    
    assert_equal amount_paid - item_cost, change
    # assert_equal previous_amount + item_cost, current_amount
  end
  
  def test_give_receipt
    item_cost = transaction.item_cost
    
    assert_output("You've paid $#{item_cost}.\n") do
      cash_register.give_receipt(transaction)
    end
  end
end
