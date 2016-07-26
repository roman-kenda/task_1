class TwitterAccountsController < ApplicationController
  before_action :authenticate_user!, only: :destroy

  def create_or_authorize
    auth = request.env['omniauth.auth']

    respond_to do |format|
    unless user_signed_in?
      sign_in(User.find(TwitterAccount.where(token: auth.credentials.token,
                                             secret: auth.credentials.secret).first.user_id))
      format.html { redirect_to root_path, notice: 'You successfully sign in throw twitter account.' }
    end

    @twitter_account = current_user.build_twitter_account(uid: auth.uid,
                                                          token: auth.credentials.token,
                                                          secret: auth.credentials.secret,
                                                          name: auth.info.name,
                                                          link: auth.info.urls.Twitter)
      if @twitter_account.save
        format.html { redirect_to setting_of_twitter_path, notice: 'Your twitter account was connected.'}
      else
        format.html { redirect_to setting_of_twitter_path, notice: 'Your twitter account wasn\'t connected.'}
      end
    end
  end

  def destroy
    current_user.twitter_account.destroy
    respond_to do |format|
      format.html { redirect_to setting_of_twitter_path,
                    notice: 'Your twitter account was successfully disconnected.'}
    end
  end
end