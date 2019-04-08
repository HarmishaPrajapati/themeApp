json.extract! booking, :id, :customer_name, :cleaner_name, :date, :created_at, :updated_at
json.url booking_url(booking, format: :json)
