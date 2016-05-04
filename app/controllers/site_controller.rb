class SiteController < ApplicationController
  def index
    if user_signed_in?
      signed_in_homepage
    else
      public_homepage
    end
  end

  private 
    def signed_in_homepage
    end

    def public_homepage
      @upcoming_tournaments = Tournament.upcoming
      @in_progress_matches = Match.in_progress
      @finished_tournaments = Tournament.finished
      render 'site/public'
    end
end
