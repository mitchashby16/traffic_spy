class Registration < ActiveRecord::Base
  validates_uniqueness_of :identifier
  has_many :payloads
  has_many :events, through: :payloads
  has_many :urls, through: :payloads

  def screen_resolutions
    payloads.group(:screen_resolution).count
  end

  def browsers
    payloads.group(:browser).count
  end

  def operating_systems
    payloads.group(:operating_system).count
  end

end
