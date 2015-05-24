enable :sessions

get '/' do
  if session[:email]
    user = User.find_by(email: session[:email])
    @objectives = Objective.where(user_id: user.id)
    @keyresults = []
    @objectives.each do |objective|
      kr_for_obj = Keyresult.where(objective_id: objective.id)
      @keyresults << kr_for_obj
    end
    @keyresults
  end

  erb :index
end

post '/' do

end

