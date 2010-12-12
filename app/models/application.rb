module Application
  def login_validation_parameters
    return {:presence=>{:message => "should be logged in via facebook to post"}}
  end
end
