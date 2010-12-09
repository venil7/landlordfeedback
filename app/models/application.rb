module Application
  def login_validation_parameters
    return {:presence=>{:message => "You should be logged in to post"}}
  end
end
