module ApplicationHelper
    def current_user
        @current_user ||= Hr.find_by(id: session[:user_id]) if session[:user_id]
    end
end
