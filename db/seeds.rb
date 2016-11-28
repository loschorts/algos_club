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
q1 = Question.create!({
	user_id: User.first.id,
	title: "Fibonacci (Recursive)",
	body: "Find the nth number in the Fibonacci sequence using recursion.",
	tag_list: "recursion"
	})
Answer.create!({
	user_id: User.first.id,
	question_id: q1.id,
	body: <<-ANS
	def fibonacci(n)
		return 0 if n < 1
		return 1 if n == 1
		return fibonacci(n-1) + fibonacci(n-2)
	end
	ANS
	})
q2 = Question.create!({
	user_id: User.first.id,
	title: "Check if singly linked list is a palidrome",
	body: "Given a singly linked list, determine if its a palindrome. Return 1 or 0 denoting if its a palindrome or not, respectively. Expected solution is linear in time and constant in space.\r\n\r\nFor example,\r\n1 > 2 > 1 is a palindrome.\r\n1 > 2 > 3 is not a palindrome.",
	tag_list: "linked list, palindrome"
	})
Answer.create!({
	user_id: User.first.id,
	question_id: q2.id,
	body: <<-ANS
	1. Get the middle of the linked list.
	2. Reverse the second half of the linked list.
	3. Check if the first half and second half are identical.
	4. Construct the original linked list by reversing the second half again and attaching it back to the first half.

	O(n) time and O(1) extra space.
	ANS
	})
q3 = Question.create!({
	user_id: User.first.id,
	title: "Reverse a linked list",
	body: "You’re given the pointer to the head node of a linked list. Change the next pointers of the nodes so that their order is reversed. The head pointer given may be null meaning that the initial list is empty.\r\n\r\nSample Input:\r\nNULL \r\n2 --> 3 --> NULL\r\n\r\nSample Output:\r\nNULL\r\n3 --> 2 --> NULL",
	tag_list: "linked list"
	})
