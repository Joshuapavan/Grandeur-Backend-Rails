# Clear existing users
User.delete_all

# Define a start date and number of records
start_date = 6.months.ago

# Generate users with various created_at dates
100.times do |i|
  User.create!(
    email: "user#{i + 1}@example.com",  # Unique email addresses
    password: "password123",           # Simple password
    created_at: start_date + i.days,   # Incremental dates
    verified: true                    # Set verified status to true
  )
end

# Create admin user (if in development environment)
# AdminUser.create!(email: 'admin@grandeur.com', password: 'Grandeur@123', password_confirmation: 'Grandeur@123') if Rails.env.development?
