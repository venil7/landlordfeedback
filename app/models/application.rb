module Application
  def login_validation_parameters
    return {:presence => {:message => "please login to post"}}
  end

  def terms_must_be_accepted
    return {:acceptance => {:message => "of use"}}
  end
end

