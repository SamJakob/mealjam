class PagesController < ApplicationController

  def index
    render inertia: 'Index', props: {}
  end

  def contact
    render inertia: 'Contact', props: {}
  end

end
