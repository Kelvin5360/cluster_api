class Cluster
  include Virtus.model
  attribute :members, Set[String]

  def add_member(member_url)
    members << member_url
  end
end
