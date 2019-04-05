require 'pry'

class Transfer

  attr_reader :sender, :receiver, :amount
  attr_accessor :status
  
  def initialize(sender, receiver, amount=50)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end 

  def valid? 
    sender.valid? && receiver.valid?
    # binding.pry
  end 

  # def reject_transfer
  #     @status = "rejected"
  #     "Transaction rejected. Please check your account balance."
  # end 

  def execute_transaction 
        if valid? && sender.balance > @amount && @status == 'pending'
        sender.balance -= @amount
        receiver.balance += @amount
        @status = "complete"
        else
        # reject_transfer
        @status = "rejected"
        "Transaction rejected. Please check your account balance."  
    end 
  end

  def reverse_transfer
      if self.execute_transaction
        sender.balance += @amount
        receiver.balance -= @amount
        @status = "reversed"
      end 
  end 

end 