class Admin < ActiveRecord::Base

  devise :invitable, :database_authenticatable, :timeoutable,
         :trackable, :validatable


  def name
    email.split('@').first
  end

end
