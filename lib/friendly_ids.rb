module FriendlyIds


  def active_slug
    Slug.where(hashed_id: hashed_id,
               resource_type: self.class.to_s,
               active: true)
  end


  def to_param
    active_slug.first.try(:key)
  end


  def update_slugs
    # do nothing if the correct slug already exists
    return if active_slug.where(key: name.parameterize).first

    # if the slug exists but is not current, make it the current slug
    s = Slug.where(resource_type: self.class.to_s,
                   hashed_id: hashed_id,
                   key: name.parameterize,
                   active: false).first
    if s
      deactivate_all_slugs!
      s.update_attribute(:active, true)
      return
    end

    # create the slug if necessary
    deactivate_all_slugs!
    s = Slug.create(resource_type: self.class.to_s,
                    hashed_id: hashed_id,
                    key: name.parameterize,
                    active: true)
  end


  def deactivate_all_slugs!
    Slug.update_all([ 'active = ?', false ], [ "resource_type = '#{self.class.to_s}' and hashed_id = ?", hashed_id ])
  end

end
