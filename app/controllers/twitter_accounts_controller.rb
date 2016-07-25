class TwitterAccountsController < ApplicationController
  before_action :authenticate_user!, only: :create

  def create
    auth = request.env['omniauth.auth']
    @twitter_account = current_user.build_twitter_account(uid: auth.uid,
                                                          token: auth.credentials.token,
                                                          secret: auth.credentials.secret,
                                                          name: auth.info.name,
                                                          link: auth.info.urls.Twitter)
    respond_to do |format|
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