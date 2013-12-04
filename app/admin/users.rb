ActiveAdmin.register User do

  form do |f|
    f.inputs "Details" do
      f.input :name
      f.input :email
      f.input :password
      f.input :password_confirmation
    end
    f.inputs "Roles" do
      f.input :roles, :as => :select, :collection => Role.all
    end
    f.actions
  end

  show do
    attributes_table do
      row :name
      row :email
    end
    active_admin_comments
  end

  index do
    column :name
    column :email
    actions
  end

  filter :name
  filter :email
  
end
