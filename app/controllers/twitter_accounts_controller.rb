class TwitterAccountsController < ApplicationController
  before_action :authenticate_user!, only: :create

  def create
    auth = request.env['omniauth.auth']
    @twitter_account = current_user.build_twitter_account(uid: auth.uid,
                                                          token: auth.credentials.token,
                                                          secret: auth.credentials.secret)
    respond_to do |format|
      if @twitter_account.save
        format.html { redirect_to setting_of_twitter_path, notice: 'Your twitter connect.'}
      else
        format.html { redirect_to setting_of_twitter_path, notice: 'Your twitter disconnect.'}
      end
    end
  end

  def destroy
    current_user.twitter_account.destroy
    respond_to do |format|
      format.html { redirect_to setting_of_twitter_path,
                    notice: 'Your twitter account was successfully destroyed.'}
    end
  end
end