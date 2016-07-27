class Wiki < ActiveRecord::Base
  
  belongs_to :users
  
  scope :visible_to, -> (user) { 
    return all if (user && (user.premium? || user.admin? ))
    where(private: false)
  }

end
