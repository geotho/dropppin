class User < ActiveRecord::Base
	has_many :places, dependent: :destroy
	validates :email, uniqueness: { case_sensitive: false }

end
