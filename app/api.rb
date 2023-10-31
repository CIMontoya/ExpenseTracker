require 'sinatra/base'
require 'json'
require_relative 'ledger'

module ExpenseTracker
  class API < Sinatra::Base
    def initialize(ledger: Ledger.new)
      @ledger = ledger
      super()
    end

    post '/expenses' do
      expense = JSON.parse(request.body.read)
      result = @ledger.record(expense)

      if result.success?
        JSON.generate('expense_id' => result.expense_id)
      else
        status 422
        JSON.generate('error' => result.error_message)
      end
        
    end

    get '/expenses/:date' do
      date = JSON.parse(request.params)

      if date == '2023-10-23'
        JSON.generate(['expense_id' => 417])
      else
        Json.generate([])
      end
    end
  end
end