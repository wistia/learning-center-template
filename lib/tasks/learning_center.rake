namespace :learning_center do
  desc "Sync data with the Wistia app"
  task :sync => :environment do
    require "wistia"
    Wistia.password = ::AppConfig.wistia_api_key || ENV["WISTIA_API_KEY"] 

    project_colors = ["green", "sea_foam", "blue", "purple"]
    project_index = 0

    wistia_projects = Wistia::Project.find(:all, :params => { :sort_by => "name" })
    
    wistia_projects.each do |p|
      project_color = project_colors[project_index % 4]
      project_index += 1

      new_project_name = p.name
      if new_project_name =~ /^\d+\s/
        new_project_name.gsub!(/^\d+\s/, "")
      end

      new_project = Project.create(
        name: new_project_name,
        description: p.description,
        color: project_color,
        hashed_id: p.hashedId,
        position: project_index,
        is_current: false
      )

      media_index = 0

      Wistia::Media.find(:all, :params => { :project_id => p.id, :sort_by => "position" }).each do |m|
        media_index += 1
        descriptions = m.description.split(/<p>\s*---\s*<\/p>/)

        if descriptions.length == 2
          short_description = descriptions.first
          long_description = descriptions.last
        else
          short_description = m.description
          long_description = m.description
        end

        Media.create(
          hashed_id: m.hashed_id,
          name: m.name,
          duration: m.duration,
          long_description: long_description,
          short_description: short_description,
          thumbnail: m.thumbnail.url,
          created: m.created,
          project_id: new_project.id,
          aspect_ratio: m.assets.last.height.to_f / m.assets.last.width.to_f,
          position: media_index,
          is_current: false
        )
      end
    end

    Project.delete_all(["is_current = ?", true])
    Media.delete_all(["is_current = ?", true])

    Project.unscoped { Project.update_all(["is_current = ?", true]) }
    Media.unscoped { Media.update_all(["is_current = ?", true]) }

  end
end
