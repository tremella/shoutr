class SessionsController < Clearance::SessionsController
    private

    def authenticate(_) #val doesn't matter
        super(session_params)
    end

    def session_params # returns a hash
        { session: session_params_with_email }
    end

    def session_params_with_email #returns a hash
        params.
        require(:session).
        permit(:password).
        merge(email: user.email)
    end

    def user # i.e. current user. Guest.new is to handle nulls (see Guest class)
        User.where(email: email_or_username).or(User.where(username: email_or_username)).first || Guest.new
    end

    def email_or_username
        params[:session][:email_or_username]
    end

end