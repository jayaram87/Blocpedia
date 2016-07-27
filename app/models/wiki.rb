class Wiki < ActiveRecord::Base
  
  belongs_to :user
  
  after_create :user_wikis
  
  scope :visible_to, -> (user) { user && ( user.premium || user.admin ) ? all : where(private: false) }
  
  private
  def user_wikis
    if user.role == "premium"
      self.update_attributes(private: true)
    end
  end

end
