VALID_LOG_LEVELS = [:debug, :info, :warn, :error, :fatal, :unknown]
class Warden
  def initialize app , log_level
    @app = app
    @log_level = VALID_LOG_LEVELS.include?(log_level) ?  log_level : :info
  end

  def call env
  	dup._call env
  end

  def _call env
  	env["warden"] = EnvSession.new(env)
    request_started_on = Time.now
    @status, @headers, @response = @app.call(env)
    request_ended_on = Time.now
    Rails.logger.send(@log_level, ("=" * 50))
    Rails.logger.send(@log_level, "Request delta time: #{request_ended_on - request_started_on} seconds.")
    Rails.logger.send(@log_level, ("=" * 50))
    [@status, @headers, @response]
    # do something...
  end
end

class EnvSession
	attr_accessor :user
	def initialize env
		self.user = call env
	end

	def call env
		dup._call env
	end

	def _call env
		User.find_by(id: env['rack.session']["user_id"]) if env['rack.session']["user_id"].present? 
	end
end
