json.array!(@transactions) do |transaction|
  json.extract! transaction, :id, :dt, :account_id, :amount, :remark, :transaction_type
  json.url transaction_url(transaction, format: :json)
end
