ActiveAdmin.register Producto do
  menu parent: "Productos", label: "Productos"

   permit_params :prod_active, :prod_bcode, :prod_desc, :prod_precio, :laboratorio_id, :rubro_id, prod_farma_attributes:[:id, :producto_id, :farmaco_id, :pfar_cant], prod_sectore_attributes:[:id, :producto_id, :sectore_id]

   controller do
     def destroy
       lab = Producto.find(params[:id])
       lab.update_attribute(:prod_active, false)
       redirect_to admin_productos_path
     end
   end

   action_item :view, only: :show do
     link_to 'Atras', admin_productos_path
   end

   # Link para activar registro
   action_item :activado, only: :show do
     link_to "Activar", activado_admin_producto_path(producto), method: :put if !producto.prod_active
   end

   # Funcion para activar registro
    member_action :activado, method: :put do
    lab = Producto.find(params[:id])
    lab.update(prod_active: true)
    redirect_to admin_productos_path
    end


  filter :prod_desc, label: "Descripcion"

  scope :inactivo
  scope :activo, :default => true
  scope :todos

  index title: "Productos" do
    column(:rubro) { |payment| payment.rubro.rubro_desc }
    column(:laboratorio) { |payment| payment.laboratorio.lab_desc }

     column "Descripcion", :prod_desc

     column "Creado", :created_at
    actions
   end


   form title: 'Productos' do |f|
       inputs 'Detalles' do
         input :rubro_id,  label: "Rubros", :as => :select, :collection => Rubro.activo.map{|a|["#{a.rubro_desc}", a.id]}
         input :laboratorio_id,  label: "Laboratorio", :as => :select, :collection => Laboratorio.activo.map{|a|["#{a.lab_desc}", a.id]}
         input :prod_desc, label: "Descripcion"
         input :prod_precio, label: "Precio"
         input :prod_bcode, label: "Codigo de barras"
       end

      f.inputs "Farmacos" do
          f.has_many :prod_farma do |i|
            i.input :farmaco_id,  label: "Farmaco", :hint => "Elija el farmaco", :as => :select, :collection => Farmaco.activo.map{|a|["#{a.farma_desc}", a.id]}
            i.input :pfar_cant, label: "Cantidad", :hint => "Ingrese la cantidad"
          end
      end

      f.inputs "Sectores" do
          f.has_many :prod_sectore do |i|
            i.input :sectore_id,  label: "Sectores", :hint => "Elija el sector al que corresponde", :as => :select, :collection => Sectore.activo.map{|a|["#{a.sect_desc}", a.id]}
          end
      end
       actions
      end

  # Vista show
   show title: "Producto"  do
     attributes_table_for producto do
       row("Descripcion") {producto.prod_desc}
       row(:laboratorio) { |payment| payment.laboratorio.lab_desc }
       row("Creado") {producto.created_at}

     end
   end

end
