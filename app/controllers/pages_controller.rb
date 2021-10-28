class PagesController < ApplicationController

  def index
    render inertia: 'Home', props: {}
  end

end
