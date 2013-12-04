class User < ActiveRecord::Base
  rolify
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :role_ids
  attr_accessible :name, :email, :password, :password_confirmation, :remember_me

  has_many :facts

  after_create :assign_default_user_role

  private
  def assign_default_user_role
    self.add_role :contributor if self.roles.empty?
  end

end
