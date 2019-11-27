ActiveAdmin.register Farmaco do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters

menu parent: "Productos", label: "Farmacos"


 permit_params :farma_desc, :farma_active

 controller do
   def destroy
     lab = Farmaco.find(params[:id])
     lab.update_attribute(:farma_active, false)
     redirect_to admin_farmacos_path
   end
 end

 action_item :view, only: :show do
   link_to 'Atras', admin_farmacos_path
 end

 # Link para activar registro
 action_item :activado, only: :show do
   link_to "Activar", activado_admin_farmaco_path(farmaco), method: :put if !farmaco.farma_active
 end

 # Funcion para activar registro
  member_action :activado, method: :put do
  lab = Farmaco.find(params[:id])
  lab.update(farma_active: true)
  redirect_to admin_farmacos_path
  end


filter :farma_desc, label: "Descripcion"

scope :inactivo
scope :activo, :default => true
scope :todos

index title: "Farmacos" do
 	 column "Descripcion", :farma_desc
	 column "Creado", :created_at
  actions
 end


 form title: 'Farmacos' do |f|
     inputs 'Detalles' do
       input :farma_desc, label: "Descripcion"
     end
     actions
   	end

# Vista show
 show title: "Farmaco"  do
   attributes_table_for farmaco do
     row("Descripcion") {farmaco.farma_desc}
     row("Creado") {farmaco.created_at}

   end
 end

end
