class API < Sinatra::Base
  def initialize(ledger:)
    @ledger = ledger
    super()
  end
end

app = Api.new(ledger: Ledger.new)
