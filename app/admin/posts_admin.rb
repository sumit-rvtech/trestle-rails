Trestle.resource(:posts) do
  # Add a link to this admin in the main navigation
  menu do
    group :blog_management, priority: :first do
      item :posts, icon: "fa fa-file-text-o"
    end
  end

  # Define custom scopes for the index view
  scope :all, default: true
  # scope :published
  # scope :drafts, -> { Post.unpublished }

  # Define the index view table listing
  table do
    column :title, link: true
    # column :published, align: :center do |post|
    #   status_tag(icon("fa fa-check"), :success) if post.published?
    # end
    column :updated_at, header: "Last Updated", align: :center
    actions
  end

  # Define the form structure for the new & edit actions
  form do
    # Organize fields into tabs and sidebars
    tab :post do
      text_field :title

      # Define custom form fields for easy re-use
      text_area :body
    end

    tab :metadata do
      # Layout fields based on a 12-column grid
      row do

      end
    end

    sidebar do
      # Render a custom partial: app/views/admin/posts/_sidebar.html.erb
      render "sidebar"
    end
  end
end