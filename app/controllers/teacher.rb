post '/teachers' do
  @teacher = Teacher.new(params[:teacher])
  if @teacher.save
    session[:user_id] = @teacher.id
    redirect "/students"
  else
    erb :'teachers/new'
  end
end

get '/super-secret-url/teachers/new' do
  erb :'teachers/new'
end

get '/logout' do
  session.clear
  redirect '/'
end

get '/login' do
  erb :'teachers/login'
end

post '/login' do
  teacher = Teacher.authenticate(params[:username], params[:password])
  if teacher
    session[:user_id] = teacher.id
    redirect '/students'
  else
    redirect '/login'
  end
end