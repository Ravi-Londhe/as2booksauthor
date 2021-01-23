

class AuthorService
  include Godmin::Resources::ResourceService

  attrs_for_index :name 
  attrs_for_show :name 
  attrs_for_form :name 
  attrs_for_export :id, :name

  filter :name

  def filter_name(authors, value)
    authors.where("name LIKE ?", "%#{value}%")
  end

  batch_action :destroy, confirm: true

  def batch_action_destroy(authors)
    authors.each { |a| a.destroy }
  end
end
