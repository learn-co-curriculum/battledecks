class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  include Pundit
  protect_from_forgery with: :exception
  # rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  # def user_not_authorized
  #   flash[:alert] = "You are not authorized to perform this action."
  #   redirect_to(request.referrer || root_path)
  # end

  private
    def set_tournament
      @tournament= Tournament.find(params[:tournament_id] || params[:id])
    end

    def set_match
      @match = if @tournament
        @tournament.matches.find(params[:match_id] || params[:id])
      else
        Match.find(params[:match_id] || params[:id])
      end
    end
    
    def set_bracket
      @bracket = BracketGenerator.new(@tournament)
    end

    def set_tournament_and_bracket
      set_tournament
      set_bracket
    end

    def set_tournament_and_match
      set_tournament
      set_match
    end
end
