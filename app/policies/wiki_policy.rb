class WikiPolicy < ApplicationPolicy
    def update?
        user.present?
    end
    
    def destroy?
        user.present?
    end
    
    class Scope
        attr_reader :user, :scope

        def initialize(user, scope)
            @user  = user
            @scope = scope
        end

        def resolve
            wikis = []
            scope.all.each do |wiki|
                if wiki.private == false || wiki.user == user || wiki.collaborators.include?(user)
                    wikis <<  wiki
                elsif wiki.private == false || wiki.collaborators.include?(user)
                    wikis << wiki
                end
            end
            wikis
        end
    end
end