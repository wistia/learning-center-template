namespace :learning_center do
  desc "Sync data with the Wistia app"
  task :sync => :environment do
    require "wistia"
    Wistia.password = ENV["WISTIA_API_KEY"]
    
    Project.delete_all
    Media.delete_all
    
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
        position: project_index
      )

      media_index = 0

      Wistia::Media.find(:all, :params => { :project_id => p.id }).each do |m|
        media_index += 1

        Media.create(
          hashed_id: m.hashed_id,
          name: m.name,
          duration: m.duration,
          description: m.description,
          thumbnail: m.thumbnail.url,
          created: m.created,
          project_id: new_project.id,
          aspect_ratio: m.assets.last.height.to_f / m.assets.last.width.to_f,
          position: media_index
        )
      end
    end
  end
end
