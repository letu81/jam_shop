class Invite < ActiveRecord::Base
  validates :title, :body, :link, :inviter_benefits, :invitee_benefits, presence: true
  
  mount_uploader :icon, AvatarUploader
  
  def self.current_invite_for(user)
    where('score >= ?', user.score).order('score desc').first
  end
  
  def share_icon_url
    if icon.blank?
      ActionController::Base.helpers.asset_path('wechat_shop/default_invite_share_icon.png')
    else
      icon.url(:big)
    end
  end
end