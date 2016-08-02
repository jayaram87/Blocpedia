class Wiki < ActiveRecord::Base
  
  belongs_to :users
  
  scope :visible_to, -> (user) { 
    return all if (user && (user.premium? || user.admin? ))
    where(private: false)
  }
  
  def make_public
    self.private = false
    save
  end

end
