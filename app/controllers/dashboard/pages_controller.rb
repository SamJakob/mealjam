module Dashboard
  class PagesController < ApplicationController

    def index
      render inertia: 'Dashboard/Index', props: {}
    end

  end
end
