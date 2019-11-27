ActiveAdmin.register Almacene do
  menu parent: "Almacenes", label: "Almacenes"

   permit_params :alma_desc, :alma_active

   controller do
     def destroy
       alma = Almacene.find(params[:id])
       alma.update_attribute(:alma_active, false)
       redirect_to admin_almacenes_path
     end
   end

   action_item :view, only: :show do
     link_to 'Atras', admin_almacenes_path
   end

   # Link para activar registro
   action_item :activado, only: :show do
     link_to "Activar", activado_admin_almacene_path(almacene), method: :put if !almacene.alma_active
   end

   # Funcion para activar registro
    member_action :activado, method: :put do
    alma = Almacene.find(params[:id])
    alma.update(alma_active: true)
    redirect_to admin_almacenes_path
    end


  filter :alma_desc, label: "Descripcion"

  scope :inactivo
  scope :activo, :default => true
  scope :todos

  index title: "Almacenes" do
   	 column "Descripcion", :alma_desc
  	 column "Creado", :created_at
    actions
   end


   form title: 'Almacenes' do |f|
       inputs 'Detalles' do
         input :alma_desc, label: "Descripcion"
       end
       actions
     	end

  # Vista show
   show title: "Almacenes"  do
     attributes_table_for almacene do
       row("Descripcion") {almacene.alma_desc}
       row("Creado") {almacene.created_at}

     end
   end
end
