MoneyRails.configure do |config|
  config.default_currency = :aud  # or :gbp, :usd, etc.
  config.no_cents_if_whole = false
end
