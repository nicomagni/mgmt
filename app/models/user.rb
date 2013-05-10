class User < ActiveRecord::Base
  include GithubProvisioner::User

  has_many :teams
  has_many :projects, through: :teams, uniq: true

  # Devise

  devise :registerable
  devise :rememberable
  devise :trackable
  devise :omniauthable, omniauth_providers: [:github]
end
