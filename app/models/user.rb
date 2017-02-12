class User < ApplicationRecord
  has_many :activities

  enum status: %i(active suspended terminated)

  # validations
  validates :name, presence: true
  validates :email, presence: true

  #devise
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable,
         omniauth_providers: [:facebook]

  #paperclip
  has_attached_file :avatar, styles:
                            {
                              medium: '500x500>',
                              thumb: '100x100>'
                            }
  validates_attachment_file_name :avatar, matches: [/png\Z/, /jpe?g\Z/]
  
  # rubocop:disable Metrics/AbcSize
  def self.from_omniauth(auth)
    where(provider: auth.provider, uuid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0, 20]
      user.remote_photo = auth.info.image if auth.info.image?
      user.name = auth.info.name
      user.skip_confirmation!
    end
  end

  def self.new_with_session(params, session)
    return super unless defined? data
    super.tap do |user|
      if data == session['devise.facebook_data'] &&
         session['devise.facebook_data']['extra']['raw_info']
        user.email = data['email'] if user.email.blank?
      end
    end
  end
end
