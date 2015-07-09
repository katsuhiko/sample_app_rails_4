class ServiceUrl
  include Comparable

  attr_reader :service, :version

  class << self
    def from_url(url)
      self.new(url)
    end
  end

  # url : http://api.xxxx.com/v1/xxx
  def initialize(url)
    @url = url
    uri = URI(url)
    @service = uri.merge('/').to_s
    @version = uri.path.split('/')[1]
  end

  def better_than?(other)
    self > other
  end

  def <=>(other)
    other.to_s <=> to_s
  end

  def hash
    @url.hash
  end

  def eql?(other)
    to_s == other.to_s
  end

  def to_s
    @url.to_s
  end
end
