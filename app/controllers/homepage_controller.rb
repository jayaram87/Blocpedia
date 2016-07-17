class HomepageController < ApplicationController
    skip_before_action :authenciate_user1, only: [:index]
    def index
    end
end
