class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable
  has_many :collaborations
  has_many :wikis
  has_many :collaborating_wikis, through: :collaborations, source: :wiki
  
  enum role: [:standard, :premium, :admin]
  after_initialize :set_default_role
  
  def downgrade
    self.role = :standard
    save
    self.wikis.each { |wiki| wiki.make_public }
  end
  
  def upgrade
    self.role = :premium
    save
  end
  
  private
  def set_default_role
    self.role ||= :standard  
  end

end
