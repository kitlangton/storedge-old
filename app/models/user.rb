class User < ActiveRecord::Base
  before_create :titleize_name
  belongs_to :company
  has_many :orders
  has_one :shopping_cart, dependent: :destroy
  acts_as_taggable
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  validates :first_name, :last_name, presence: true
  validates :company_id, presence: true, unless: Proc.new { |u| u.admin? }
  devise :invitable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :invitable, validate_on_invite: true

  # def current_cart
  #   self.cart || User.cart.create
  # end
  #
  def cart
    shopping_cart || create_shopping_cart
  end

  def full_name
    "#{first_name} #{last_name}"
  end

  def titleize_name
    self.first_name = first_name.capitalize
    self.last_name = last_name.capitalize
  end

end
