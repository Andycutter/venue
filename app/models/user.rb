class User < ApplicationRecord
  after_initialize :set_default_role, if: :new_record?
  after_create :send_welcome_mail
    
  has_many :campaigns
  has_many :orders
  has_many :event_tickets
  has_and_belongs_to_many :performers

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: [:facebook, :google_oauth2]
  enum role: { artist: 0, fan: 1, admin: 9 }

  def set_default_role
    self.role ||= :fan
  end

  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session['devise.facebook_data'] && session['devise.facebook_data']['extra']['raw_info']
        user.email = data['email'] if user.email.blank?
      end
    end
  end

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
    end
  end

  def send_welcome_mail
    UserMailer.send_welcome_mail(self).deliver
  end
end
