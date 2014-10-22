class User < ActiveRecord::Base
  before_create :titleize_name
  belongs_to :company
  acts_as_taggable
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  validates :first_name, :last_name, presence: true
  validates_presence_of :company, unless: Proc.new { |u| u.admin? }
  devise :invitable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :invitable, validate_on_invite: true

  def full_name
    "#{first_name} #{last_name}"
  end

  def titleize_name
    self.first_name = first_name.capitalize
    self.last_name = last_name.capitalize
  end

end
