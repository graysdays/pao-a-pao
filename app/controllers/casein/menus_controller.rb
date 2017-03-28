# Scaffolding generated by Casein v5.2.0.0

module Casein
  class MenusController < Casein::CaseinController
    ## optional filters for defining usage according to Casein::AdminUser access_levels
    # before_action :needs_admin, except: [:action1, :action2]
    # before_action :needs_admin_or_current_user, only: [:action1, :action2]
  
    def index
      @casein_page_title = 'Menus'
      @menus = Menu.order(sort_order(:dish_id)).paginate page: params[:page]
    end

    def show
      @casein_page_title = 'View menu'
      @menu = Menu.find params[:id]
    end

    def new
      @casein_page_title = 'Add a new menu'
      @menu = Menu.new
    end

    def create
      @menu = Menu.new menu_params

      if @menu.save
        flash[:notice] = 'Menu created'
        redirect_to casein_menus_path
      else
        flash.now[:warning] = 'There were problems when trying to create a new menu'
        render action: :new
      end
    end

    def update
      @casein_page_title = 'Update menu'

      @menu = Menu.find params[:id]

      if @menu.update_attributes menu_params
        flash[:notice] = 'Menu has been updated'
        redirect_to casein_menus_path
      else
        flash.now[:warning] = 'There were problems when trying to update this menu'
        render action: :show
      end
    end

    def destroy
      @menu = Menu.find params[:id]

      @menu.destroy
      flash[:notice] = 'Menu has been deleted'
      redirect_to casein_menus_path
    end

    private

    def menu_params
      params.require(:menu).permit(:dish_id, :restaurant_id)
    end
  end
end
