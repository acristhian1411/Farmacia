ActiveAdmin.register Sectore do
  menu parent: "Almacenes", label: "Sectores"

   permit_params :sect_desc, :sect_active, :almacene_id

   controller do
     def destroy
       lab = Sectore.find(params[:id])
       lab.update_attribute(:sect_active, false)
       redirect_to admin_sectores_path
     end
   end

   action_item :view, only: :show do
     link_to 'Atras', admin_sectores_path
   end

   # Link para activar registro
   action_item :activado, only: :show do
     link_to "Activar", activado_admin_sectore_path(sectore), method: :put if !sectore.sect_active
   end

   # Funcion para activar registro
    member_action :activado, method: :put do
    lab = Sectore.find(params[:id])
    lab.update(sect_active: true)
    redirect_to admin_sectores_path
    end


  filter :sect_desc, label: "Descripcion"

  scope :inactivo
  scope :activo, :default => true
  scope :todos

  index title: "Sectores" do
   	 column "Descripcion", :sect_desc
     column(:almacenes) { |payment| payment.almacene.alma_desc }
  	 column "Creado", :created_at
    actions
   end


   form title: 'Sectores' do |f|
       inputs 'Detalles' do

         input :sect_desc, label: "Descripcion"
         input :almacene_id,  label: "Almacenes", :as => :select, :collection => Almacene.activo.map{|a|["#{a.alma_desc}", a.id]}
       end
       actions
     	end

  # Vista show
   show title: "Sectores"  do
     attributes_table_for sectore do
       row("Descripcion") {sectore.sect_desc}
       row(:almacen) { |payment| payment.almacene.alma_desc }
       row("Creado") {sectore.created_at}

     end
   end

end
