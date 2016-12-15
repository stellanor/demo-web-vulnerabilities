get '/' do
  if logged_in?
    redirect '/students'
  else
    redirect '/students/new'
  end
end

post '/students' do
  p params
  @student = Student.new(params[:student])
  if @student.save
    "Thanks for registering!"
  else
    erb :'students/new'
  end
end

get '/students' do
  authorize_teacher_only!
  @students = Student.all
  erb :'students/index'
end

get '/students/new' do
  erb :'students/new'
end

get '/students/:id' do
  authorize_teacher_only!
  @student = Student.find_by(id: params[:id])
  if @student
    erb :'students/show'
  else
    status 404
    "That student doesn't exist :-("
  end
end

get '/students/:id/remove' do
  authorize_teacher_only!
  @student = Student.find_by(id: params[:id])
  if @student
    @student.destroy
  else
    status 404
    "That student doesn't exist :-("
  end
end

put '/students/:id' do
  authorize_teacher_only!
  @student = Student.find_by(id: params[:id])
  if @student
    @student.update_attributes(params[:student])
    redirect "/students/#{@student.id}"
  else
    status 404
    "That student doesn't exist :-("
  end
end