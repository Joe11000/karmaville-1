class User < ActiveRecord::Base
  has_many :karma_points

  attr_accessible :first_name, :last_name, :email, :username, :karma

  validates :first_name, :presence => true
  validates :last_name, :presence => true

  validates :username,
            :presence => true,
            :length => {:minimum => 2, :maximum => 32},
            :format => {:with => /^\w+$/},
            :uniqueness => {:case_sensitive => false}

  validates :email,
            :presence => true,
            :format => {:with => /^[\w+\-.]+@[a-z\d\-.]+\.[a-z]+$/i},
            :uniqueness => {:case_sensitive => false}

  before_save :update_karma

  def self.by_karma
    # joins(:karma_points).group('users.id').order('SUM(karma_points.value) DESC')
    User.order("karma DESC")
  end

  def total_karma
    self.karma
  end

  def full_name
    "#{first_name} #{last_name}"
  end

  # def self.page(page_number)
  #   if ! page_number
  #     render users_url
  #   end
  # end

  def update_karma
    self.karma = self.total_karma
  end

  # Joe added method below
  # def self.recalculate_karma_value
  #   self.update(karma: karma_points.reduce(:+))
  # end
end
