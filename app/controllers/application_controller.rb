class ApplicationController < ActionController::Base
  include Userstamp
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  if !Rails.env.development?
    rescue_from ActiveRecord::RecordNotFound, Exception, with: :render_500
    rescue_from ActionController::RoutingError, with: :render_404
    rescue_from UserException::AccessDenied, with: :render_403
  end

  def routing_error
    raise ActionController::RoutingError.new(params[:path])
  end

  private
  
  def render_404(e=nil)
    if e
      logger.info "Rendering 404 with exception: #{e.message}"
      e.backtrace.each do |line|
        logger.info "---#{line}" unless (line =~ /\/rbenv\/versions\// || line =~ /\/\.rvm\/gems\//)
      end
    end
    @title = "404 Error"
    @header = "Page was not found"
    @caption = "The page you tried to access was not found."
    render template: 'pages/error', status: 404, layout: 'application', content_type: 'text/html'
  end
  
  def render_403(e=nil)
    if e
      logger.info "Rendering 403 with exception: #{e.message}"
      e.backtrace.each do |line|
        logger.info "---#{line}" unless (line =~ /\/rbenv\/versions\// || line =~ /\/\.rvm\/gems\//)
      end
    end
    @title = "Authentication Error"
    @header = "Authentication Error"
    @caption = "Your account is not entitled to this function."
    render template: 'pages/error', status: 403, layout: 'application', content_type: 'text/html'
  end
  
  def render_500(e=nil)
    if e
      logger.info "Rendering 500 with exception: #{e.message}"
      e.backtrace.each do |line|
        logger.info "---#{line}" unless (line =~ /\/rbenv\/versions\// || line =~ /\/\.rvm\/gems\//)
      end
    end
    @title = "Server Error"
    @header = "Server Error"
    @caption = "An internal server error occured. We apologize for any inconveniences."
    render template: 'pages/error', status: 500, layout: 'application', content_type: 'text/html'
  end

  def admin_only
    raise UserException::AccessDenied unless (user_signed_in? && current_user.is_admin?)
  end
end
