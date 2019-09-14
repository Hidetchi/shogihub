class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable
  model_stamper

  def is_admin?
    self.role || 0 == 3
  end

  def is_moderator?
    self.role || 0 >= 2
  end

  def is_collaborator?
    self.role || 0 >= 1
  end

  def to_role
    ['Member', 'Collaborator', 'Moderator', 'Admin'][role]
  end
end
