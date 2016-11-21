# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
Question.destroy_all
Answer.destroy_all

ActiveRecord::Base.connection.reset_pk_sequence!(:User)
ActiveRecord::Base.connection.reset_pk_sequence!(:Question)
ActiveRecord::Base.connection.reset_pk_sequence!(:Answer)

User.create!({
	email: "test@test.com",
	password: "password"
	})
Question.create!({
	user_id: User.first.id,
	title: "Fibonacci (Recursive)",
	body: "Find the nth number in the Fibonacci sequence using recursion."
	})
Answer.create!({
	user_id: User.first.id,
	question_id: Question.first.id,
	body: <<-ANSWER
def fibonacci(n)
	return 0 if n < 1
	return 1 if n == 1
	return fibonacci(n-1) + fibonacci(n-2)
end
	ANSWER
	})


