enable :sessions

get '/' do
  if session[:email]

    user = User.find_by(email: session[:email])

    @objectives = Objective.where(user_id: user.id).order(:id)

    @keyresults = []
    @objectives.each do |objective|
      kr_for_obj = Keyresult.where(objective_id: objective.id).order(:id)
      @keyresults << kr_for_obj
    end

  end

  erb :index
end

put '/' do

  params.each do |param, value|
    if param != "_method"
      keyresult = Keyresult.find(param)
      Update.create(keyresult_id: keyresult.id, prev_value: keyresult.number)
      keyresult.update(number: value)
    end
  end

  redirect '/'
end

