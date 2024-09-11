# frozen_string_literal: true
ActiveAdmin.register_page "Dashboard" do
  menu priority: 1, label: proc { I18n.t("active_admin.dashboard") }

  content title: proc { I18n.t("active_admin.dashboard") } do
    div class: "blank_slate_container", id: "dashboard_default_message" do
      span class: "blank_slate" do
        # span I18n.t("active_admin.dashboard_welcome.welcome")
        # small I18n.t("active_admin.dashboard_welcome.call_to_action")
      end
    end

    columns do
      column do
        panel "Recent Users" do
          ul do
            User.last(5).map do |user|
              li link_to(user.email, admin_user_path(user))
            end
          end
        end
      end

      hr

      column do
        panel "Recent Cars" do
          ul do
            Car.last(5).map do |car|
              li link_to(car.brand, admin_car_path(car))
            end
          end
        end
      end

      hr

      column do
        panel "" do
          user_data = User.group_by_day(:created_at).count

          # Render the chart directly in the view
          render partial: 'admin/dashboard/chart', locals: { data: user_data, title: "Users Signed Up By Date!" }
        end
      end

      column do
        panel "" do
          car_data = Car.group_by_day(:created_at).count

          # Render the chart directly in the view
          render partial: 'admin/dashboard/chart', locals: { data: car_data, title: "Users Signed Up By Date!" }
        end
      end
    end



    # Here is an example of a simple dashboard with columns and panels.
    #
    # columns do
    #   column do
    #     panel "Recent Posts" do
    #       ul do
    #         Post.recent(5).map do |post|
    #           li link_to(post.title, admin_post_path(post))
    #         end
    #       end
    #     end
    #   end

    #   column do
    #     panel "Info" do
    #       para "Welcome to ActiveAdmin."
    #     end
    #   end
    # end
  end # content

  # content do
  #   # Fetch users signed up by date

  # end
end
