class User < ApplicationRecord
	has_secure_password
	scope :client ,-> { where(role: 'Client') }
	scope :agent ,-> { where(role: "Agent") }

  has_many :orders, dependent: :destroy
   enum role: ["Admin","Agent", "Client"]
   enum blocked: ["Unblock","Block"]
   
   validates :email, presence: true , uniqueness: {case_sensitive: false}
   # validates :user_name,presence: true , uniqueness: {case_sensitive: false}
	 

	 class << self
   def send_otp_token (user)
    new_token = User.new_otp_token
    @update_user = user.update_attributes(authentication_token: new_token, authentication_timeout: Time.now)
    begin
      UserMailer.second_fa(user).deliver_now
    rescue Exception => e
      "Exception--send_otp_token--#{e.inspect}--"
    end
	end

	 def new_otp_token
    token = SecureRandom.hex(3)
    return token unless User.exists?(authentication_token: token).present?

  	end

  	def token_expired?
    authentication_timeout < 3.hours.ago
  end

  def new_token
    rand(36**10).to_s(36)
  end
  end

   def create_reset_digest
   self.password = User.new_token
   update_attribute(:password,  password)
  end


  def send_password_reset_email
    UserMailer.forget_password(self).deliver_now
  end

  def find_member
    # binding.pry
    @a=self.departments.includes(:members, :wallet)
    @a.collect{|x| x.members.collect{|x| x}}

    # @b=@a.collect{|x| x.manager_id}
    # User.where(id: @b)
  end
end
