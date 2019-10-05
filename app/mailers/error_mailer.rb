class ErrorMailer < ApplicationMailer
  def sample_email(params)
    @error_details = JSON.parse(params[:error_details]).flatten rescue []
    @err=params[:err]
    @detail= JSON.parse(params[:params_details])
    mail(to: "atul22king@gmail.com", subject: 'Sample Email')
  end
end
