post '/students' do
  @student = Student.new(params[:student])
  if @student.save
    redirect "/students/#{@student.id}"
  else
    erb :'students/new'
  end
end

get '/students/new' do
  erb :'students/new'
end

get '/students/:id' do
  @student = Student.find_by(id: params[:id])
  if @student
    erb :'students/show'
  else
    status 404
    "That student doesn't exist :-("
  end
end