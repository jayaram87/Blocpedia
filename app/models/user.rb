class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable
  has_many :wikis
  enum role: [:standard, :premium, :admin]
  after_initialize :set_default_role
  after_find :downgrade_user
  
  private
  def set_default_role
    self.role ||= :standard  
  end
  
  private
  def downgrade_user
    if self.role == "standard"
      self.wikis.all.each do |wiki|
        wiki.update(private: false)
      end
    end
  end

end
