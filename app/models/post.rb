class Post < ActiveRecord::Base
# adding validations to our model. minumum title of 5 chars and body must contain content.
	validates :title, presence: true, length: {minimum: 5}
	validates :body, presence: true
end
