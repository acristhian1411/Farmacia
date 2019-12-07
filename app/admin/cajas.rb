ActiveAdmin.register Caja do
  menu parent: "Cajas", label: "Cajas"

   permit_params :caja_desc, :caja_es, :caja_fecha, :caja_monto, :tipo_caja_id, :tmov_caja_id

   controller do
     def destroy
       lab = Caja.find(params[:id])
       lab.update_attribute(:caja_es, false)
       redirect_to admin_cajas_path
     end
   end

   action_item :view, only: :show do
     link_to 'Atras', admin_cajas_path
   end

   # Link para activar registro
   action_item :activado, only: :show do
     link_to "Activar", activado_admin_cajas_path(caja), method: :put if !caja.caja_es
   end

   # Funcion para activar registro
    member_action :activado, method: :put do
    lab = Caja.find(params[:id])
    lab.update(caja_es: true)
    redirect_to admin_cajas_path
    end


  filter :caja_desc, label: "Descripcion"

  scope :inactivo
  scope :activo, :default => true
  scope :todos

  index title: "Cajas" do
   	 column "Descripcion", :caja_desc
  	 column "Creado", :created_at
    actions
   end


   form title: 'Cajas' do |f|
       inputs 'Detalles' do
         input :caja_desc, label: "Descripcion"
         input :caja_desc, label: "Descripcion"
         input :caja_desc, label: "Descripcion"
         input :caja_desc, label: "Descripcion"
         input :caja_desc, label: "Descripcion"
         input :caja_desc, label: "Descripcion"
       end
       actions
     	end

  # Vista show
   show title: "Tipo de caja"  do
     attributes_table_for caja do
       row("Descripcion") {caja.caja_desc}
       row("Estado") {caja.caja_es}
       row("Fecha") {caja.caja_fecha}
       row("Monto") {caja.caja_monto}
       row("Creado") {caja.created_at}
     end
   end


end
