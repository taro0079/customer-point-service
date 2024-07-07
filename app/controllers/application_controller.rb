class ApplicationController < ActionController::Base
  def respond_with_format(resource)
    respond_to do |format|
      format.html
      format.json { render json: resource }
    end
  end
end
