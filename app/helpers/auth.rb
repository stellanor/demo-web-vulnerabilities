helpers do
  def authorize_teacher_only!
    if !logged_in?
      redirect '/'
    end
  end

  def logged_in?
    session[:user_id] && Teacher.find_by(id: session[:user_id])
  end
end