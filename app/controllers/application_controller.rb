class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
end

# use the resource generator
# define a model with validations for song
# define all restful routes for songs
# render the lost of songs in an HTML table
# build views that connect to each other using route helpers
# use form_for to build forems with pre-fill and error list features
# allow deleting songs with a link, using link_to. check out the official docuetnation for additional info including setting the method: to :delete. use strong parameters in your post/patch controller actions. set the root route to the song index.

