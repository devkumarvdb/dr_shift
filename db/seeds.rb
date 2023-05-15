# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)


admin = User.create(email: 'admin@drshift.com', password: 'admin123', password_confirmation: 'admin123',
  first_name: 'Admin', last_name: 'Admin'
)
admin.add_role(:admin)
