module Application
  def login_validation_parameters
    return {:presence => {:message => "should be logged in via facebook to post"}}
  end
  
  def terms_must_be_accepted
    return {:acceptance => {:message => "of use must be accepted"}}
  end
end
