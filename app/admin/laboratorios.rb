ActiveAdmin.register Laboratorio do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#

menu parent: "Productos", label: "Laboratorios"

 permit_params :lab_desc, :lab_active

 controller do
   def destroy
     lab = Laboratorio.find(params[:id])
     lab.update_attribute(:lab_active, false)
     redirect_to admin_laboratorios_path
   end
 end

 action_item :view, only: :show do
   link_to 'Atras', admin_laboratorios_path
 end

 # Link para activar registro
 action_item :activado, only: :show do
   link_to "Activar", activado_admin_laboratorio_path(laboratorio), method: :put if !laboratorio.lab_active
 end

 # Funcion para activar registro
  member_action :activado, method: :put do
  lab = Laboratorio.find(params[:id])
  lab.update(lab_active: true)
  redirect_to admin_laboratorios_path
  end


filter :lab_desc, label: "Descripcion"

scope :inactivo
scope :activo, :default => true
scope :todos

index title: "Laboratorios" do
 	 column "Descripcion", :lab_desc
	 column "Creado", :created_at
  actions
 end


 form title: 'Laboratorios' do |f|
     inputs 'Detalles' do
       input :lab_desc, label: "Descripcion"
     end
     actions
   	end

# Vista show
 show title: "Laboratorio"  do
   attributes_table_for laboratorio do
     row("Descripcion") {laboratorio.lab_desc}
     row("Creado") {laboratorio.created_at}

   end
 end


end
