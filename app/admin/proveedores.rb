ActiveAdmin.register Proveedore do
  menu parent: "Compras", label: "Proveedores"

   permit_params :prov_active, :prov_direc, :prov_email, :prov_ruc, :prov_nombre, :prov_telefono

   controller do
     def destroy
       lab = Proveedore.find(params[:id])
       lab.update_attribute(:prov_active, false)
       redirect_to admin_proveedores_path
     end
   end

   action_item :view, only: :show do
     link_to 'Atras', admin_proveedores_path
   end

   # Link para activar registro
   action_item :activado, only: :show do
     link_to "Activar", activado_admin_proveedore_path(proveedore), method: :put if !proveedore.prov_active
   end

   # Funcion para activar registro
    member_action :activado, method: :put do
    lab = Proveedore.find(params[:id])
    lab.update(prov_active: true)
    redirect_to admin_proveedores_path
    end


  filter :prov_nombre, label: "Razon Social"

  scope :inactivo
  scope :activo, :default => true
  scope :todos

  index title: "Proveedores" do
   	 column "Razon social", :prov_nombre
  	 column "Ruc", :prov_ruc
     column "Direccion", :prov_direc
     column "Email", :prov_email
     column "Telefono", :prov_telefono
    actions
   end


   form title: 'Proveedores' do |f|
       inputs 'Detalles' do

         input :prov_nombre, label: "Razon social"
         input :prov_ruc, label: "Ruc"
         input :prov_direc, label: "Direccion"
         input :prov_email, label: "Email"
         input :prov_telefono, label: "Telefono"
       end
       actions
     	end

  # Vista show
   show title: "Proveedor"  do
     attributes_table_for proveedore do
       row("Razon social") {proveedore.prov_nombre}
       row("Ruc") {proveedore.prov_ruc}
       row("Direccion") {proveedore.prov_direc}
       row("Email") {proveedore.prov_email}
       row("Telefono") {proveedore.prov_telefono}

     end
   end
end
