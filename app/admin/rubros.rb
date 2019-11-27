ActiveAdmin.register Rubro do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
menu parent: "Productos", label: "Rubros"

 permit_params :rubro_desc, :rubro_iva, :rubro_active


 controller do
   def destroy
     lab = Rubro.find(params[:id])
     lab.update_attribute(:rubro_active, false)
     redirect_to admin_rubros_path
   end
 end

 action_item :view, only: :show do
   link_to 'Atras', admin_rubros_path
 end

 # Link para activar registro
 action_item :activado, only: :show do
   link_to "Activar", activado_admin_rubro_path(rubro), method: :put if !rubro.rubro_active
 end

 # Funcion para activar registro
  member_action :activado, method: :put do
  lab = Rubro.find(params[:id])
  lab.update(rubro_active: true)
  redirect_to admin_rubros_path
  end


filter :rubro_desc, label: "Descripcion"

scope :inactivo
scope :activo, :default => true
scope :todos

index title: "Rubros" do
 	 column "Descripcion", :rubro_desc
   column "Iva", :rubro_iva
	 column "Creado", :created_at
  actions
 end


 form title: 'Rubro' do |f|
     inputs 'Detalles' do
       input :rubro_desc, label: "Descripcion"
       input :rubro_iva,  :as => :select,      :collection => [5,10]
     end
     actions
   	end

# Vista show
 show title: "Rubros"  do
   attributes_table_for rubro do
     row("Descripcion") {rubro.rubro_desc}
     row("Iva") {rubro.rubro_iva}
     row("Creado") {rubro.created_at}

   end
 end

end
