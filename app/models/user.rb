require 'byebug'
class User < ApplicationRecord
	belongs_to :user_type
	belongs_to :user_role
	has_many :project_details
      has_many :quote_deatils


	def self.authenticate(params)
		email = params[:email_id].present? ? params[:email_id] : nil
		password= params[:password].present? ? params[:password] : 0
		username = params[:username].present? ? params[:username] : nil
		user = params[:email_id].present? ? User.find_by_email_id(email) : User.find_by_username(username)
            if user.present? 
                  if user.password == password
      	           return user
                  else
      	           return false
                  end
            else
                  return false
            end
	end

	def self.updatepass(params)
      email = params[:email_id].present? ? params[:email_id] : 0
      mobile = params[:mobile_no].present? ? params[:mobile_no] : 0
      username = params[:username].present? ? params[:username] : 0
      password = params[:password]
      user = User.find_by_email_id(email)
      if user.mobile_no == mobile && user.username == username
      	user.update(password: password)
      	return user
      else
      	return false
      end
 	end

end
