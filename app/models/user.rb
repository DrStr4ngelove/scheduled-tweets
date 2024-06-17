# email:string
# password_digest:string
#
# password:string_virtual
# password_confirmation:string_virtual

class User < ApplicationRecord
    has_secure_password # runs through bcrypt gem
    # has_many :posts
    # has_many :comments
    # has_many :likes
    # has_many :liked_posts, through: :likes, source: :post
    # has_many :liked_comments, through: :likes, source: :comment
    validates :email, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i, message: "Must be a valid email address" }, presence: true, uniqueness: true # must have unique email
    # validates :username, presence: true, uniqueness: true # must have unique username
    validates :password, length: { minimum: 6 }, allow_nil: true
    before_save :downcase_email
    # before_save :downcase_username

    def downcase_email
        self.email = email.downcase
    end

    # def downcase_username
    #     self.username = username.downcase
    # end
end
