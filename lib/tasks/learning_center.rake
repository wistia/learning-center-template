namespace :learning_center do
  desc "Sync data with the Wistia app"
  task :sync => :environment do
    require "wistia"
    Wistia.password = ENV["WISTIA_API_KEY"]
    
    Project.delete_all
    Media.delete_all
    
    project_colors = ["green", "sea_foam", "blue", "purple"]
    project_index = 0

    Wistia::Project.all.each do |p|
      project_color = project_colors[project_index % 4]
      project_index += 1

      new_project = Project.create(name: p.name, description: p.description, color: project_color)

      Wistia::Media.find(:all, :params => { :project_id => p.id }).each do |m|
        Media.create(
          hashed_id: m.hashed_id,
          name: m.name,
          duration: m.duration,
          description: m.description,
          thumbnail: m.thumbnail.url,
          created: m.created,
          project_id: new_project.id,
          aspect_ratio: m.assets.last.height.to_f / m.assets.last.width.to_f
        )
      end
    end
  end
end
