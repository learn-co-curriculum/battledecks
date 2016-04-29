module PresentationsHelper
  def render_presentation_for(match, player_number)    
    upload_presentation = match.send("#{player_number}?", current_user) && 
                          !match.presentation_uploaded?(player_number)

    render 'presentations/match_presentation', :upload_presentation => upload_presentation
  end
end
