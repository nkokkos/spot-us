class HomesController < ApplicationController
  # caches_page :show
  #include OauthConnect
  def show
    @featured_pitches = Pitch.featured_by_network(current_network)
    @featured_stories = Story.published.latest
    @posts = Post.by_network(@current_network).latest
  end

  def start_story
    if !logged_in?
      session[:return_to] = start_story_path
      redirect_to new_session_path
    elsif logged_in? && current_user.is_a?(Reporter) || current_user.is_a?(Organization)
      redirect_to new_pitch_path
    else
      redirect_to new_tip_path
    end
  end
  
end
