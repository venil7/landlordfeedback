ActiveAdmin::Dashboards.build do

  # Define your dashboard sections here. Each block will be
  # rendered on the dashboard in the context of the view. So just
  # return the content which you would like to display.

  # == Simple Dashboard Section
  # Here is an example of a simple dashboard section
  #
  #   section "Recent Posts" do
  #     ul do
  #       Post.recent(5).collect do |post|
  #         li link_to(post.title, admin_post_path(post))
  #       end
  #     end
  #   end

  # == Render Partial Section
  # The block is rendererd within the context of the view, so you can
  # easily render a partial rather than build content in ruby.
  #
  #   section "Recent Posts" do
  #     render 'recent_posts' # => this will render /app/views/admin/dashboard/_recent_posts.html.erb
  #   end

  # == Section Ordering
  # The dashboard sections are ordered by a given priority from top left to
  # bottom right. The default priority is 10. By giving a section numerically lower
  # priority it will be sorted higher. For example:
  #
  #   section "Recent Posts", :priority => 10
  #   section "Recent User", :priority => 1
  #
  # Will render the "Recent Users" then the "Recent Posts" sections on the dashboard.
  section "Recent Properties" do
    table_for Property.order("updated_at desc").limit(10) do
      column :name do |property|
        link_to property.address, [:admin, property]
      end
      column :updated_at
    end
    strong { link_to "View All Properties", admin_properties_path }
  end


  section "Recent Feedbacks" do
    table_for Feedback.order("updated_at desc").limit(10) do
      column :name do |feedback|
        link_to feedback.property.address, [:admin, feedback]
      end
      column :updated_at
    end
    strong { link_to "View All Feedbacks", admin_feedbacks_path }
  end


  section "Recent Entries" do
    table_for Entry.order("updated_at desc").limit(10) do
      column :name do |entry|
        link_to entry, [:admin, entry]
      end
      column :updated_at
    end
    strong { link_to "View All Entries", admin_entries_path }
  end

  section "Recent Users" do
    table_for User.order("updated_at desc").limit(10) do
      column :name do |user|
        link_to "#{user.name} #{user.surname}", [:admin, user]
      end
      column :updated_at
    end
    strong { link_to "View All Users", admin_users_path }
  end
end

