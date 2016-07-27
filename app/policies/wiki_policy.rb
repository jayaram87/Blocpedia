class WikiPolicy < ApplicationPolicy
    def update?
        user.present?
    end
    
    def destroy?
        user.present?
    end
end