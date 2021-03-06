class PreferencesController < ApplicationController

  def create
    @preference = Preference.new(preference_params)
    @preference.user = current_user
    if @preference.save
      sleep 1.5
      redirect_to deals_path
    else
      redirect_to new_user_session_path
    end
  end

  def destroy
    @preference = Preference.find(params[:id])
    @preference.destroy
    redirect_to profile_path
  end

  def preference_params
    params.require(:preference).permit(:weekday, :duration, :city_id, :discount)
  end
end
