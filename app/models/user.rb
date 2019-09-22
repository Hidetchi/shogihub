class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable
  model_stamper

  def is_admin?
    role_i == 3
  end

  def is_moderator?
    role_i >= 2
  end

  def is_collaborator?
    role_i >= 1
  end

  def to_role
    ['Member', 'Collaborator', 'Moderator', 'Admin'][role_i]
  end

  def role_i
    self.role || 0
  end

  def to_name
    self.email.split("@")[0]
  end

  def to_hidden_email
    tokens = self.email.match(/^(.*)@(.)(.*)$/)
    $1 + "@" + $2 + "**********"
  end
end
