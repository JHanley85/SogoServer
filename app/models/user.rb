class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  #:database_authenticatable ,# :registerable,
devise :database_authenticatable,
       :token_authenticatable,
       :recoverable,
       :rememberable, 
       :omniauthable,
       :validatable,
       :trackable,
       :timeoutable,
       :registerable
#       :lockable
#       :confirmable


  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  has_many :assets
end
