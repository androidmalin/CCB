class FirstController < ApplicationController
layout:false
  def index
    render layout: "admin_layout"
  end
end
