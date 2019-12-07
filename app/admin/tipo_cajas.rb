ActiveAdmin.register TipoCaja do
  menu parent: "Cajas", label: "Tipos de cajas"

   permit_params :tcaja_desc, :sect_active

   controller do
     def destroy
       lab = TipoCaja.find(params[:id])
       lab.update_attribute(:tcaja_active, false)
       redirect_to admin_tipo_cajas_path
     end
   end

   action_item :view, only: :show do
     link_to 'Atras', admin_tipo_cajas_path
   end

   # Link para activar registro
   action_item :activado, only: :show do
     link_to "Activar", activado_admin_tipo_cajas_path(tipo_caja), method: :put if !tipo_caja.tcaja_active
   end

   # Funcion para activar registro
    member_action :activado, method: :put do
    lab = TipoCaja.find(params[:id])
    lab.update(tcaja_active: true)
    redirect_to admin_tipo_cajas_path
    end


  filter :tcaja_desc, label: "Descripcion"

  scope :inactivo
  scope :activo, :default => true
  scope :todos

  index title: "Tipo de cajas" do
   	 column "Descripcion", :tcaja_desc
  	 column "Creado", :created_at
    actions
   end


   form title: 'Tipo de cajas' do |f|
       inputs 'Detalles' do
         input :tcaja_desc, label: "Descripcion"
       end
       actions
     	end

  # Vista show
   show title: "Tipo de caja"  do
     attributes_table_for tipo_caja do
       row("Descripcion") {tipo_caja.tcaja_desc}
       row("Creado") {tipo_caja.created_at}
     end
   end


end
