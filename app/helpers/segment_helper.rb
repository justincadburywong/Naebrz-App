helpers do
  def segment_identify
    if current_user
      Analytics.identify(
        user_id: current_user.id,
        traits: { email: current_user.email})
    end
  end
end
