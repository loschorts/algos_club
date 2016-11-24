class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :questions
  has_many :answers

  def owns?(item)
  	item.user == self
  end

  def score
  	@score ||= answers.map(&:score).reduce(:+) + questions.joins(:answers).select("answers.id").count
  end
end
