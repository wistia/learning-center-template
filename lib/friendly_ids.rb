module FriendlyIds

  def to_param
    Slug.where(hashed_id: hashed_id, resource_type: self.class.to_s, active: true).first.try(:slug)
  end


  def update_slugs
    # do nothing if the correct slug already exists
    s = Slug.where(resource_type: self.class.to_s, hashed_id: hashed_id, slug: name.parameterize, active: true).first
    return if s

    # if the slug exists but is not current, make it the current slug
    s = Slug.where(resource_type: self.class.to_s, hashed_id: hashed_id, slug: name.parameterize, active: false).first
    if s
      Slug.update_all([ 'active = ?', false ], [ "resource_type = '#{self.class.to_s}' and hashed_id = ?", hashed_id ])
      s.update_attribute(:active, true)
      return
    end

    # create the slug if necessary
    Slug.update_all([ 'active = ?', false ], [ "resource_type = '#{self.class.to_s}' and hashed_id = ?", hashed_id ])
    s = Slug.create(resource_type: self.class.to_s, hashed_id: hashed_id, slug: name.parameterize, active: true)
  end

end
