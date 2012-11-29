module NewsHelper
  def truncate_link(link)
    truncate(link, :length => 25)
  end
end
